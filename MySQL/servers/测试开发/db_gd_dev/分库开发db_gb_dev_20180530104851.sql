#---------需要分库的表-----------------------------------
select * from db_gd_dev.t_daily_shop_pmt_price_0 limit 1;
select * from db_gd_dev.gb_pmt_pcy_item_lable_1 limit 1;
select * from db_gd_dev.t_daily_company_pmt_price limit 1;
select * from db_gd_dev.t_daily_country_pmt_price limit 1;
select * from t_daily_

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
				
				
				
				
				
				
				
				
				
				
				
				
				