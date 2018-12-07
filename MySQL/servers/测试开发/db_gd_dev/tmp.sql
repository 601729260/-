select * from t_shop_style_price_base limit 10;
select * from t_shop_style_price_base  where shop_id=90000070;

=================================
batchInsertShopGoodsIndexBaseInfoAndStandardPrice2
select * from t_shop_style_price_base_sh  where shop_id=90000070;
select
            s.online_time,
            s.style_num_id,
            s.style_id,
            s.style_title,
            s.style_pic,
            s.style_catelog_first,
            s.style_catelog_sec,
            s.style_catelog_third,
            t1.gt_name as first_type_name,
            t2.gt_name as second_type_name,
            t3.gt_name as third_type_name,
            t3.gt_weights as third_weight_value,
            s.brand_id,
            b.b_name as brand_name,
            s.style_apply_age,
            s.style_apply_sex,
            s.order_num,
            s.total_sale,
            0 as favorable_rate,
            0 as collectors_num,
            s.season_num_id as style_apply_season,
            s.style_use_type,
            1 as online,
            s.is_hide,
            s.is_not_sale,
            o.standard_price / 100 as standard_price,
            o.standard_price / 100 as min_price,
            o.item_num_id as item_num_id,
            90000070 as shop_id,
            '2018-06-01' as valid_date,
            0,
            ifnull(st.pre_month_sale_count, 0) as month_sales,
            ifnull(gmb.click_num, 0) as month_clicks
        from
          gb_style s
          inner join (
            select
            *
            from (
                select
                  g1.style_id as style_num_id, g2.price as standard_price, g2.item_num_id
                from gb_online g1
                left join mamahao_price.t_daily_standard_price g2 on g1.item_id = g2.item_num_id
                where
                g1.sid = 90000070
                and g2.valid_date = '2018-06-01'
                order by g2.price asc
            ) T group by T.style_num_id)o on s.style_num_id = o.style_num_id
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id
        where not exists (select 1 from t_shop_style_price_base where style_num_id = s.style_num_id and valid_date = '2018-06-01' and shop_id =  90000070);
				
				
	===========================
	batchUpdateShopGoodsIndexCustomPrice2
	
	select * from 
	
	truncate table t_shop_style_price_base;
	select custom_price,pmt_label,item_num_id,shop_pmt_price,min_price from t_shop_style_price_base where shop_id=90000070 and valid_date='2018-06-01';

	
	select * from t_shop_style_price_base where shop_id=90000070 and style_num_id in (select style_num_id from wgn_tmp);
	select * from wgn_tmp;

create table wgn_tmp as 
     select * from (
              select *from (
                select * from(
                    select
                      g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price, g2.shop_id
                    from gb_online g1
                    left join mamahao_price.t_daily_custom_price g2 on g1.item_id = g2.item_num_id
                    where
                        g1.sid = 90000070
                        and (g2.city_num_id =0 or g2.shop_id = 90000070)
                        and g2.valid_date = '2018-06-01'
                    order by  g2.shop_id desc, g2.city_num_id desc, g2.custom_id desc
        )T group by item_num_id
              ) T2 order by price asc
            ) T3 group by style_num_id
						
						
 ================================
 batchUpdateShopGoodsIndexShopPmtPrice2
 
 create table t_shop_style_price_base_step2 as select * from t_shop_style_price_base;
 
 select * from t_shop_style_price_base_step2  where shop_id=90000070 and style_num_id in (select style_num_id from wgn_step_3);
 select * from wgn_step_3;
 select * from t_shop_style_price_base   where shop_id=90000070 and style_num_id in (select style_num_id from wgn_step_3);
 select t1.style_num_id,t1.shop_pmt_price,t2.shop_pmt_price,t1.item_num_id ,t2.item_num_id ,t1.pmt_label,t2.pmt_label,t1.min_price ,t2.min_price from t_shop_style_price_base_step2 t1 left join t_shop_style_price_base t2 on t1.style_num_id=t2.style_num_id where  t1.shop_id=90000070 and t1.style_num_id in (select style_num_id from wgn_step_3);

 
 
 
   <update id="batchUpdateShopGoodsIndexShopPmtPrice" parameterType="java.util.HashMap">
        update  t_shop_style_price_base t1 inner join (
            select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join t_daily_shop_pmt_price_#{tableIndex} g2 on g1.item_id = g2.item_num_id
                where
                    g1.sid = #{shopId}
                    <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if>
                    and g2.valid_date =  #{validDate}
                    and g2.shop_id = #{shopId}
                order by g2.price asc
                )T group by T.style_num_id
            )t2 on t1.style_num_id = t2.style_num_id
        set
            t1.shop_pmt_price = t2.price,
            t1.item_num_id = case when t2.price <![CDATA[< ]]> t1.min_price then t2.item_num_id else t1.item_num_id end,
            t1.pmt_label = case when  t2.price <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
            t1.min_price = case when  t2.price <![CDATA[< ]]>  t1.min_price then t2.price else t1.min_price end
        where t1.valid_date = #{validDate} and t1.shop_id = #{shopId} and t1.custom_price = 0
    </update> 
				 
			 create table wgn_step_3 as  select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join mamahao_price.t_daily_shop_pmt_price_0 g2 on g1.item_id = g2.item_num_id
                where
                    g1.sid = 90000070
                    and g2.valid_date =  '2018-06-01'
                    and g2.shop_id = 90000070
                order by g2.price asc
                )T group by T.style_num_id;
            
	===================================================
	batchUpdateShopGoodsIndexCompanyPmtPrice
	
	 create table t_shop_style_price_base_step3 as select * from t_shop_style_price_base;
 
 select * from t_shop_style_price_base_step3  where shop_id=90000070 and style_num_id in (select style_num_id from wgn_step_3);
 select * from wgn_step_4;
 select * from t_shop_style_price_base   where shop_id=90000070 and style_num_id in (select style_num_id from wgn_step_3);
 select t1.style_num_id,t1.company_pmt_price,t2.company_pmt_price,t1.shop_pmt_price,t2.shop_pmt_price,t1.item_num_id ,t2.item_num_id ,t1.pmt_label,t2.pmt_label,t1.min_price ,t2.min_price from t_shop_style_price_base_step3 t1 left join t_shop_style_price_base t2 on t1.style_num_id=t2.style_num_id where  t1.shop_id=90000070 and t1.style_num_id in (select style_num_id from wgn_step_4);

 
					   <!--4,更新区域促销价-->
    <update id="batchUpdateShopGoodsIndexCompanyPmtPrice" parameterType="java.util.HashMap">
        update  t_shop_style_price_base t1 inner join (
            select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join t_daily_company_pmt_price g2 on g1.item_id = g2.item_num_id
                where
                    g1.sid = #{shopId}
                    <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if>
                    and g2.valid_date =  #{validDate}
                    and g2.company_id = #{companyId}
                order by g2.price asc
            )T group by T.style_num_id
        )t2 on t1.style_num_id = t2.style_num_id
        set
        t1.company_pmt_price = t2.price,
        t1.item_num_id = case when t2.price <![CDATA[< ]]> t1.min_price then t2.item_num_id else t1.item_num_id end,
        t1.pmt_label = case when  t2.price <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
        t1.min_price = case when  t2.price <![CDATA[< ]]>  t1.min_price then t2.price else t1.min_price end
        where t1.valid_date = #{validDate} and t1.shop_id = #{shopId} and t1.shop_pmt_price = 0
    </update>

	  
	  create table wgn_step_4 as           select * from (
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join mamahao_price.t_daily_company_pmt_price g2 on g1.item_id = g2.item_num_id
                where
                    g1.sid = 90000070
                    and g2.valid_date =  '2018-06-01'
                    and g2.company_id = 39
                order by g2.price asc
            )T group by T.style_num_id
	
				select * from mamahao_price.t_daily_company_pmt_price where 

				select city_num_id,div_num_id from gb_city_area where  del_state = 0  and city_num_id=320100 group by city_num_id;
  
============================================
batchUpdateShopGoodsIndexCountryPmtPrice
	 create table t_shop_style_price_base_step4 as select * from t_shop_style_price_base;
 
 select * from t_shop_style_price_base_step4  where shop_id=90000070 and style_num_id in (select style_num_id from wgn_step_5);
 select * from wgn_step_5;
 select * from t_shop_style_price_base   where shop_id=90000070 and style_num_id in (select style_num_id from wgn_step_5);
 select t1.style_num_id,t1.country_pmt_price,t2.country_pmt_price,t1.company_pmt_price,t2.company_pmt_price,t1.shop_pmt_price,t2.shop_pmt_price,t1.item_num_id ,t2.item_num_id ,t1.pmt_label,t2.pmt_label,t1.min_price ,t2.min_price from t_shop_style_price_base_step4 t1 left join t_shop_style_price_base t2 on t1.style_num_id=t2.style_num_id where  t1.shop_id=90000070 and t1.style_num_id in (select style_num_id from wgn_step_5);


		   <!--5,更新全国促销价-->
    <update id="batchUpdateShopGoodsIndexCountryPmtPrice" parameterType="java.util.HashMap">
        update  t_shop_style_price_base t1 inner join (
            select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join t_daily_country_pmt_price g2 on g1.item_id = g2.item_num_id
                where
                    g1.sid = #{shopId}
                    <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if>
                    and g2.valid_date =  #{validDate}
                order by g2.price asc
            )T group by T.style_num_id
        )t2 on t1.style_num_id = t2.style_num_id
        set
        t1.country_pmt_price = t2.price,
        t1.item_num_id = case when t2.price <![CDATA[< ]]> t1.min_price then t2.item_num_id else t1.item_num_id end,
        t1.pmt_label = case when  t2.price <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
        t1.min_price = case when  t2.price <![CDATA[< ]]>  t1.min_price then t2.price else t1.min_price end
        where t1.valid_date = #{validDate}
            and t1.shop_id = #{shopId}
            and t1.custom_price = 0
            and t1.shop_pmt_price = 0
            and (t1.company_pmt_price = 0 or t1.standard_price <![CDATA[< ]]> t1.company_pmt_price)
    </update>
				
	create table 			wgn_step_5 as select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join mamahao_price.t_daily_country_pmt_price g2 on g1.item_id = g2.item_num_id
                where
                    g1.sid = 90000070
                    and g2.valid_date =  '2018-06-01'
                order by g2.price asc
            )T group by T.style_num_id
						
						
========================================================================
#truncate table t_city_style_price_base;


select * from t_city_style_price_base where shop_id=90000070;
   <insert id="batchInsertMainGoodsIndexBaseInfoByShopGoodsIndexBaseInfo" parameterType="java.util.HashMap">
        insert into t_city_style_price_base (
            online_time,
            style_num_id,
            style_id,
            style_title,
            style_pic,
            style_catelog_first,
            style_catelog_sec,
            style_catelog_third,
            first_type_name,
            second_type_name,
            third_type_name,
            third_weight_value,
            brand_id,
            brand_name,
            style_apply_age,
            style_apply_sex,
            order_num,
            total_sale,
            favorable_rate,
            collectors_num,
            style_apply_season,
            style_use_type,
            online,
            is_hide,
            is_not_sale,
            standard_price,
            country_pmt_price,
            <!-- company_pmt_price, -->
            shop_pmt_price,
            <!--custom_price, -->
            pre_heat_price,
            min_price,
            pmt_label,
            item_num_id,
            valid_date,
            shop_id,
            city_num_id,
            local_shop_city_num_id,
            month_sales,
            month_clicks
        )
        select online_time,
            style_num_id,
            style_id,
            style_title,
            style_pic,
            style_catelog_first,
            style_catelog_sec,
            style_catelog_third,
            first_type_name,
            second_type_name,
            third_type_name,
            third_weight_value,
            brand_id,
            brand_name,
            style_apply_age,
            style_apply_sex,
            order_num,
            total_sale,
            favorable_rate,
            collectors_num,
            style_apply_season,
            style_use_type,
            online,
            is_hide,
            is_not_sale,
            standard_price,
            country_pmt_price,
            <!-- company_pmt_price, -->
            shop_pmt_price,
            <!--custom_price, -->
            pre_heat_price,
            min_price,
            pmt_label,
            item_num_id,
            valid_date,
            shop_id,
           #{cityNumId},
            local_shop_city_num_id,
            month_sales,
            month_clicks
        from (
            select
              *
            from t_shop_style_price_base t
            where
                t.shop_id in
                <foreach collection="sids" item="sid" open="(" close=")" separator=",">
                    #{sid}
                </foreach>
                <if test="styleNumIds != null">
                    and t.style_num_id in
                    <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                        #{styleNumId}
                    </foreach>
                </if>
                and t.valid_date = #{validDate}
                and not exists (select 1 from t_city_style_price_base where style_num_id = t.style_num_id and valid_date = #{validDate} and city_num_id = #{cityNumId})
            order by t.min_price asc) T group by t.style_num_id

						
============================================================================

update t_city_style_price_base set local_shop_city_num_id=0,shop_pmt_price=0;
drop table t_city_style_price_base_step1;
	 create table t_city_style_price_base_step1 as select * from t_city_style_price_base;
 
 select * from t_city_style_price_base_step1  where style_num_id in (select style_num_id from wgn_step_2);
 select * from wgn_step_2;
 select * from t_city_style_price_base   where   style_num_id in (select style_num_id from wgn_step_2);
 select t1.style_num_id,t1.country_pmt_price,t2.country_pmt_price,t1.company_pmt_price,t2.company_pmt_price,t1.shop_pmt_price,t2.shop_pmt_price,t1.item_num_id ,t2.item_num_id ,t1.pmt_label,t2.pmt_label,t1.min_price ,t2.min_price from t_city_style_price_base_step1 t1 left join t_city_style_price_base t2 on t1.style_num_id=t2.style_num_id where  t1.style_num_id in (select style_num_id from wgn_step_2);

 <update id="batchUpdateMainGoodsIndexCustomPrice" parameterType="java.util.HashMap">

        <!--对于由非本市的门店价格数据生成的城市价格数据, 重置最低价格, 直降标签, 再重新计算-->
        update t_city_style_price_base t1 set t1.min_price = standard_price , t1.pmt_label = 0
        where t1.valid_date = #{validDate}
        <if test="styleNumIds != null">
            and t1.style_num_id in
            <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                #{styleNumId}
            </foreach>
        </if>
        and t1.city_num_id = #{cityNumId} and t1.city_num_id != t1.local_shop_city_num_id and t1.shop_pmt_price = 0;

        <!-- end -->

	 create table t_city_style_price_base_step2 as select * from t_city_style_price_base;
 
 select * from t_city_style_price_base_step2  where style_num_id in (select style_num_id from wgn_step_2);
 select * from wgn_step_2;
 select * from t_city_style_price_base   where   style_num_id in (select style_num_id from wgn_step_2);
 select t1.style_num_id,t1.custom_price,t2.custom_price,t1.company_pmt_price,t2.company_pmt_price,t1.shop_pmt_price,t2.shop_pmt_price,t1.item_num_id ,t2.item_num_id ,t1.pmt_label,t2.pmt_label,t1.min_price ,t2.min_price from t_city_style_price_base_step2 t1 left join t_city_style_price_base t2 on t1.style_num_id=t2.style_num_id where  t1.style_num_id in (select style_num_id from wgn_step_2);

        update  t_city_style_price_base t1 inner join (
          select * from (
            select *from (
              select * from(
                  select
                    g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                  from gb_online g1
                   left join t_daily_custom_price g2 on g1.item_id = g2.item_num_id
                  where
                    g1.sid in
                    <foreach collection="sids" item="sid" open="(" close=")" separator=",">
                        #{sid}
                    </foreach>
                    <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if>
                    and g2.city_num_id in (0, #{cityNumId})
                    <!--and (-->
                        <!--g2.city_num_id in (0, #{cityNumId})-->
                        <!--or-->
                        <!--g2.shop_id in-->
                        <!--<foreach collection="sids" item="shopId" open="(" close=")" separator=",">-->
                            <!--#{shopId}-->
                        <!--</foreach>-->
                       <!--)-->
                    and g2.valid_date = #{validDate}
                  order by g2.city_num_id desc, g2.custom_id desc
                )T group by item_num_id
              ) T2 order by price asc
            ) T3 group by style_num_id
        )t2 on t1.style_num_id = t2.style_num_id
        set
            t1.custom_price = t2.price,
            t1.pmt_label = case when  t2.price <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
            t1.item_num_id = case when t2.price <![CDATA[< ]]> t1.min_price then t2.item_num_id else t1.item_num_id end,
            t1.min_price = case when  t2.price <![CDATA[< ]]> t1.min_price then t2.price else t1.min_price end
             <!--这里因为之前为非本市门店的直降,故优先考虑本市的,若存在本市直降,则直接赋值(与吊牌价比较即可)-->
        where t1.valid_date = #{validDate} and t1.city_num_id = #{cityNumId} and t1.city_num_id != t1.local_shop_city_num_id
    </update>
		
   create table wgn_step_2  as select * from (
            select *from (
              select * from(
                  select
                    g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                  from gb_online g1
                   left join mamahao_price.t_daily_custom_price g2 on g1.item_id = g2.item_num_id
                  where
                    g1.sid in(90000070)
                    and g2.city_num_id in (0, 320100)
  
                    and g2.valid_date = '2018-06-01'
                  order by g2.city_num_id desc, g2.custom_id desc
                )T group by item_num_id
              ) T2 order by price asc
            ) T3 group by style_num_id
						
						
				