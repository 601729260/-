#---------需要分库的表-----------------------------------
select * from db_gd_dev.t_daily_shop_pmt_price_0 limit 1;
select * from db_gd_dev.gb_pmt_pcy_item_lable_1 limit 1;
select * from db_gd_dev.t_daily_company_pmt_price limit 1;
select * from db_gd_dev.t_daily_country_pmt_price limit 1;
select * from db_gd_dev.t_daiy
	  <!--***********门店商品所有 begin***************-->
    <!--1,插入商品基本信息,以及吊牌价-->
		
		   <!--***********门店商品所有 begin***************-->
    <!--1,插入商品基本信息,以及吊牌价-->
    <insert id="batchInsertShopGoodsIndexBaseInfoAndStandardPrice" parameterType="java.util.HashMap">
        insert into t_shop_style_price_base (
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
            min_price,
            item_num_id,
            shop_id,
            valid_date,
            local_shop_city_num_id,
            month_sales,
            month_clicks
        )
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
            #{shopId} as shop_id,
            #{validDate} as valid_date,
            #{cityNumId},
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
                left join t_daily_standard_price g2 on g1.item_id = g2.item_num_id
                where
                g1.sid = #{shopId}
                <if test="styleNumIds != null">
                    and g1.style_id in
                    <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                        #{styleNumId}
                    </foreach>
                </if>
                and g2.valid_date = #{validDate}
                order by g2.price asc
            ) T group by T.style_num_id)o on s.style_num_id = o.style_num_id
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id
        where not exists (select 1 from t_shop_style_price_base where style_num_id = s.style_num_id and valid_date = #{validDate} and shop_id =  #{shopId})
    </insert>


            select
            *
            from (
                select
                  g1.style_id as style_num_id, g2.price as standard_price, g2.item_num_id
                from gb_online g1
                left join t_daily_standard_price g2 on g1.item_id = g2.item_num_id
                where
                g1.sid = #{shopId}
                <if test="styleNumIds != null">
                    and g1.style_id in
                    <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                        #{styleNumId}
                    </foreach>
                </if>
                and g2.valid_date = #{validDate}
                order by g2.price asc
            ) T group by T.style_num_id)
						
						
						




    <insert id="batchInsertShopGoodsIndexBaseInfoAndStandardPrice" parameterType="java.util.HashMap">
        insert into t_shop_style_price_base (
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
            min_price,
            item_num_id,
            shop_id,
            valid_date,
            local_shop_city_num_id,
            month_sales,
            month_clicks
        )
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
            #{shopId} as shop_id,
            #{validDate} as valid_date,
            #{cityNumId},
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
                left join t_daily_standard_price g2 on g1.item_id = g2.item_num_id
                where
                g1.sid = #{shopId}
                <if test="styleNumIds != null">
                    and g1.style_id in
                    <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                        #{styleNumId}
                    </foreach>
                </if>
                and g2.valid_date = #{validDate}
                order by g2.price asc
            ) T group by T.style_num_id)o on s.style_num_id = o.style_num_id
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id
        <!--  排序调整,此处废弃,不在引用好评,收藏数据
                 left join t_style_favorable f on f.style_num_id = s.style_num_id
                 left join t_style_collectors c on s.style_num_id = c.style_num_id -->
        where not exists (select 1 from t_shop_style_price_base where style_num_id = s.style_num_id and valid_date = #{validDate} and shop_id =  #{shopId})
    </insert>

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
            #{shopId} as shop_id,
            #{validDate} as valid_date,
            #{cityNumId},
            ifnull(st.pre_month_sale_count, 0) as month_sales,
            ifnull(gmb.click_num, 0) as month_clicks
        from
          gb_style s
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id
        where not exists (select 1 from t_shop_style_price_base where style_num_id = s.style_num_id and valid_date = #{validDate} and shop_id =  #{shopId})
		
		

----------------------------------------

-----------------------------------------------------
	  <!--2,更新自定义价格-->
    <update id="batchUpdateShopGoodsIndexCustomPrice" parameterType="java.util.HashMap">
        update  t_shop_style_price_base t1 inner join (
            select * from (
              select *from (
                select * from(
                    select
                      g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price, g2.shop_id
                    from gb_online g1
                    left join t_daily_custom_price g2 on g1.item_id = g2.item_num_id
                    where
                        g1.sid = #{shopId}
                        <if test="styleNumIds != null">
                            and g1.style_id in
                            <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                                #{styleNumId}
                            </foreach>
                        </if>
                        and (g2.city_num_id in (0, #{cityNumId}) or g2.shop_id = #{shopId})
                        and g2.valid_date = #{validDate}
                    order by  g2.shop_id desc, g2.city_num_id desc, g2.custom_id desc
        )T group by item_num_id
              ) T2 order by price asc
            ) T3 group by style_num_id
        )t2 on t1.style_num_id = t2.style_num_id
        set
            t1.custom_price = t2.price,
            t1.pmt_label = case when  t2.price <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
            t1.item_num_id = case when t2.price <![CDATA[< ]]> t1.min_price then t2.item_num_id else t1.item_num_id end,
        t1.shop_pmt_price = case when  t2.price <![CDATA[< ]]> t1.min_price and t2.shop_id != 0  then t2.price else 0 end,   <!--当运营自定义价格为门店自定义价格时,赋值shop_pmt_price, 这里仅标识后面用-->
        t1.min_price = case when  t2.price <![CDATA[< ]]> t1.min_price then t2.price else t1.min_price end
        where t1.valid_date = #{validDate} and t1.shop_id = #{shopId}
    </update>
		
			select * from 	t_daily_custom_price g2  where  
										and (g2.city_num_id in (0, #{cityNumId}) or g2.shop_id = #{shopId})
                    and g2.valid_date = #{validDate}
		
		
		更新逻辑加一行
		t1.shop_pmt_price = case when  t2.price <![CDATA[< ]]> t1.min_price and t2.shop_id != 0  then t2.price else 0 end, 
				

#---------------------------------------------------------
  <!--3,更新集团门店促销价-->
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



				
				select g2.item_num_id,g2.price/100 as price from db_gb_dev.t_daily_shop_pmt_price_0 g2 where g2.valid_date=#{valideDate} and g2.shop_id=#{shopId};
				
				select g1.style_id ,g1.item_id from  db_gb_dev.gb_online g1 where g1.sid=#{shop_id} 
				and <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if> 
										
				group by order by 
				
				update db_gb_dev.t_shop_style_price_base  t1 set
            t1.shop_pmt_price = #{price},
            t1.item_num_id = case when #{price} <![CDATA[< ]]> t1.min_price then #{item_num_id} else t1.item_num_id end,
            t1.pmt_label = case when  #{price} <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
            t1.min_price = case when  #{price} <![CDATA[< ]]>  t1.min_price then #{price} else t1.min_price end
        where t1.valid_date = #{validDate} and t1.shop_id = #{shopId} and t1.custom_price = 0
				and t1.style_num_id=#{style_num_id};
				

				
		----------------------------------		
---------------------------------------------------------
update  db_gb_dev.t_shop_style_price_base t1 inner join (
            select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from db_gb_dev.gb_online g1 left join db_gb_dev.t_daily_shop_pmt_price_#{tableIndex} g2 on g1.item_id = g2.item_num_id
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
        where t1.valid_date = #{validDate} and t1.shop_id = #{shopId} and t1.custom_price = 0;
				
				
				select g2.item_num_id,g2.price/100 from db_gb_dev.t_daily_shop_pmt_price_0 g2 where g2.valid_date=#{valideDate} and g2.shop_id=#{shopId};
				
				select g1.style_id ,g1.item_id from  db_gb_dev.gb_online g1 where g1.sid=#{shop_id} 
				and <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if> 
										
				group by 
				
				update db_gb_dev.t_shop_style_price_base  t1 set
            t1.shop_pmt_price = #{price},
            t1.item_num_id = case when #{price} <![CDATA[< ]]> t1.min_price then #{item_num_id} else t1.item_num_id end,
            t1.pmt_label = case when  #{price} <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
            t1.min_price = case when  #{price} <![CDATA[< ]]>  t1.min_price then #{price} else t1.min_price end
        where t1.valid_date = #{validDate} and t1.shop_id = #{shopId} and t1.custom_price = 0
				and t1.style_num_id=#{style_num_id};
				
				
				
		----------------------------------		
				
				
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
		
		
---------------------------------------------------------


										
		
		
	
----------------------batchUpdateCustomPrice------------------
    <insert id="batchUpdateCustomPrice" parameterType="java.util.HashMap">
        insert into t_daily_custom_price(
            reserved_no,
            city_num_id,
            shop_id,
            style_num_id,
            item_num_id,
            price,
            price_label,
            custom_id,
            valid_date
        )
        select * from (
            select
                reserved_no as reservedNo,
                city_num_id as cityNumId,
                shop_id as shopId,
                style_num_id as styleNumId,
                item_num_id as itemNumId,
                price as customPrice,
                price_label as preheatPriceLabel,
                id as customId,
                #{fictitiousDate}
            from t_operational_price
            where
                begin_time  <![CDATA[<= ]]>  #{validDateTime}
                and end_time >= #{validDateTime}
                and effective = 1
            order by id desc
        ) T group by T.itemNumId, T.cityNumId, T.shopId
    </insert>
		
	
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
				
	-------------------------------------
	    <!--2,更新自定义价格-->
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
		
		
		select * from gb_online g1 where 
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
									
		select * from 	t_daily_custom_price g2  where  
										g2.city_num_id in (0, #{cityNumId})
                    and g2.valid_date = #{validDate}
		
		
		更新条件与原来一致
		
----------------------------
   <!--4,集团区域促销价-->
    <update id="batchUpdateMainGoodsIndexCompanyPmtPrice" parameterType="java.util.HashMap">
        update  t_city_style_price_base t1 inner join (
            select * from(
                select
                      g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join t_daily_company_pmt_price g2 on g1.item_id = g2.item_num_id
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
        where t1.valid_date = #{validDate} and t1.city_num_id = #{cityNumId} and t1.custom_price = 0 and t1.city_num_id != t1.local_shop_city_num_id
    </update>
		
		
		
		  select * from t_daily_company_pmt_price g2
			where g2.valid_date =  #{validDate}
                and g2.company_id = #{companyId}
		
		
						select g1.style_id ,g1.item_id from  db_gb_dev.gb_online g1 where g1.sid=#{shop_id} 
						                g1.sid in
                <foreach collection="sids" item="sid" open="(" close=")" separator=",">
                    #{sid}
                </foreach>
				and <if test="styleNumIds != null">
                        and g1.style_id in
                        <foreach collection="styleNumIds" item="styleNumId" open="(" close=")" separator=",">
                            #{styleNumId}
                        </foreach>
                    </if> 
		
		    update  t_shop_style_price_base t1
        set
        t1.shop_pmt_price = #{price},
        t1.item_num_id = case when #{price} <![CDATA[< ]]> t1.min_price then #{itemNumId} else t1.item_num_id end,
        t1.pmt_label = case when  #{price} <![CDATA[< ]]> t1.min_price then 1 else t1.pmt_label end,
        t1.min_price = case when  #{price} <![CDATA[< ]]>  t1.min_price then #{price} else t1.min_price end
        where t1.valid_date = #{validDate}
				<if test="shopId != null">
					and t1.shop_id = #{shopId}
				</if>
				<if test="customPrice !=null">
					and t1.custom_price = #{customPrice}
				</if>
				<if test="shopPmtPrice!=null"> 
				 and t1.shop_pmt_price = 0
			  </if>
				<if test="styleNumId !=null">
         and t1.style_num_id = #{styleNumId}
			  </if>
				<if test="cityNumId!=null">
				 and t1.city_num_id = #{cityNumId}  
			  </if>
				<if test="notEqualLocal!=null">
				 and t1.city_num_id != t1.local_shop_city_num_id
			  </if>
		

	
	------------------------------------			
				    <!--5,更新全国促销价-->
    <update id="batchUpdateMainGoodsIndexCountryPmtPrice" parameterType="java.util.HashMap">
        update  t_city_style_price_base t1 inner join (
            select * from(
                select
                  g1.style_id as style_num_id , g2.item_num_id, g2.price / 100 as price
                from gb_online g1 left join t_daily_country_pmt_price g2 on g1.item_id = g2.item_num_id
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
              and t1.city_num_id = #{cityNumId}
              and t1.custom_price = 0
              and t1.shop_pmt_price = 0
              and (t1.company_pmt_price = 0 or t1.standard_price <![CDATA[< ]]> t1.company_pmt_price) and t1.city_num_id != t1.local_shop_city_num_id
    </update>

				
				
				