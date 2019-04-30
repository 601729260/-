======================清理之前的备份表=====================
drop table gb_div_market_item_20180614       ;
drop table gb_price_collect_20180614         ;
drop table gb_div_20180614                   ;
drop table gb_share_item_20180614            ;
drop table t_city_style_price_base_20180614  ;
drop table t_shop_style_price_base_20180614  ;
drop table gb_style_20180614                 ;
drop table gb_online_20180614                ;
drop table gb_city_area_20180614             ;
drop table t_goods_type_20180614             ;
drop table t_brand_20180614                  ;
drop table t_goods_month_browse_20180614     ;
drop table t_goods_month_sale_total_20180614 ;
drop table t_operational_price_20180614      ;
drop table t_daily_shop_pmt_price_20180614   ;
drop table t_daily_company_pmt_price_20180614;
drop table t_daily_country_pmt_price_20180614;
drop table t_daily_custom_price_20180614     ;
drop table t_daily_standard_price_20180614   ;



======================线上表备份===========================
create table gb_div_market_item_20180706                as select * from     gb_div_market_item       ; 
create table gb_price_collect_20180706                  as select * from     gb_price_collect         ; 
create table gb_div_20180706                            as select * from     gb_div                   ; 
create table gb_share_item_20180706                     as select * from     gb_share_item            ; 
create table t_city_style_price_base_20180706           as select * from     t_city_style_price_base  ; 
create table t_shop_style_price_base_20180706           as select * from     t_shop_style_price_base  ; 
create table gb_style_20180706                          as select * from     gb_style                 ; 
create table gb_online_20180706                         as select * from     gb_online                ; 
create table gb_city_area_20180706                      as select * from     gb_city_area             ; 
create table t_goods_type_20180706                      as select * from     t_goods_type             ; 
create table t_brand_20180706                           as select * from     t_brand                  ; 
create table t_goods_month_browse_20180706              as select * from     t_goods_month_browse     ; 
create table t_goods_month_sale_total_20180706          as select * from     t_goods_month_sale_total ; 
create table t_operational_price_20180706               as select * from     t_operational_price      ; 
create table t_daily_shop_pmt_price_20180706            as select * from     t_daily_shop_pmt_price   ; 
create table t_daily_company_pmt_price_20180706         as select * from     t_daily_company_pmt_price; 
create table t_daily_country_pmt_price_20180706         as select * from     t_daily_country_pmt_price; 
create table t_daily_custom_price_20180706              as select * from     t_daily_custom_price     ; 
create table t_daily_standard_price_20180706            as select * from     t_daily_standard_price   ; 
================= 准备数据测试单个style_num_id=======================================
alter table gb_pmt_pcy_item_lable rename to gb_pmt_pcy_item_lable_20180706;
create table gb_pmt_pcy_item_lable as select * from gb_pmt_pcy_item_lable_20180706 where STYLE_NUM_ID=807571;
select count(1) from gb_pmt_pcy_item_lable;

drop table gb_online;
create table gb_online as select * from gb_online_20180706 where style_id=807571;
select count(1) from gb_online;


drop table gb_online;
create table gb_online as select * from gb_online_20180706;
drop table wgn_gb_pmt_pcy_item_lable;
alter table gb_pmt_pcy_item_lable rename to wgn_gb_pmt_pcy_item_lable;
alter table gb_pmt_pcy_item_lable_20180706 rename to gb_pmt_pcy_item_lable;



 =============calculateStandardPriceCacheTest 测试=========================
	select
          *
        from
        (
            select
                EDMI.item_num_id as itemNumId,
                item.style_num_id as styleNumId,
                EDMI.RETAIL_PRICE * 100 as price,
                '2016-06-01' as validDate
            from gb_share_item item
            LEFT JOIN  GB_DIV_MARKET_ITEM EDMI on item.item_num_id=EDMI.ITEM_NUM_ID and EDMI.DIV_NUM_ID = item.DIV_NUM_ID
            INNER JOIN GB_PRICE_COLLECT PCL ON EDMI.CHANNEL_SUB_NUM_ID = PCL.CHANNEL_SUB_NUM_ID
            INNER JOIN GB_DIV DB ON DB.COLLECT_NUM_ID = PCL.COLLECT_NUM_ID
            WHERE
                DB.DIV_NUM_ID = 31
                AND EDMI.RETAIL_PRICE > 0
                AND EDMI.BEGIN_DAY <='2016-06-01'
                AND EDMI.END_DAY >= '2016-06-01'
            ORDER BY
                EDMI.BEGIN_DAY DESC,
                EDMI.RETAIL_PRICE ASC
        ) T
        where T.itemNumId > #{lastItemNumId}
        GROUP BY
        T.itemNumId
        order by
        T.itemNumId
        limit 50000
				
				
				
				
					select
          count(1)
        from
        (
            select
                EDMI.item_num_id as itemNumId,
                item.style_num_id as styleNumId,
                EDMI.RETAIL_PRICE * 100 as price,
                '2016-06-01' as validDate
            from gb_share_item item
            LEFT JOIN  GB_DIV_MARKET_ITEM EDMI on item.item_num_id=EDMI.ITEM_NUM_ID and EDMI.DIV_NUM_ID = item.DIV_NUM_ID
            INNER JOIN GB_PRICE_COLLECT PCL ON EDMI.CHANNEL_SUB_NUM_ID = PCL.CHANNEL_SUB_NUM_ID
            INNER JOIN GB_DIV DB ON DB.COLLECT_NUM_ID = PCL.COLLECT_NUM_ID
            WHERE
                DB.DIV_NUM_ID = 31
                AND EDMI.RETAIL_PRICE > 0
                AND EDMI.BEGIN_DAY <='2016-06-01'
                AND EDMI.END_DAY >= '2016-06-01'
            ORDER BY
                EDMI.BEGIN_DAY DESC,
                EDMI.RETAIL_PRICE ASC
        ) T
				
	create table t_daily_standard_price as select * from mamahao_price.t_daily_standard_price where 1=2;	
	
==============对比数据t_daily_custom_price===========================

select count(1) from t_daily_custom_price;
select count(1) from t_daily_custom_price_bak;
drop table t_daily_custom_price_bak;
create table t_daily_custom_price_bak as select * from t_daily_custom_price;

truncate table t_daily_custom_price;
				
select * from t_daily_custom_price limit 1;
				
				
select * from 		
(select custom_id	,item_num_id	,style_num_id	,price	,city_num_id	,reserved_no	,price_label	,valid_date	,shop_id from t_daily_custom_price	union all
select custom_id	,item_num_id	,style_num_id	,price	,city_num_id	,reserved_no	,price_label	,valid_date	,shop_id from t_daily_custom_price_bak) T
group by custom_id	,item_num_id	,style_num_id	,price	,city_num_id	,reserved_no	,price_label	,valid_date	,shop_id having count(*)=1;

========================================

select count(1) from gb_pmt_pcy_item_lable;

create table gb_pmt_pcy_item_lable as select * from mamahao_price.gb_pmt_pcy_item_lable;


create table  t_daily_shop_pmt_price_0 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_1 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_2 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_3 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_4 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_5 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_6 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_7 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_8 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;
create table  t_daily_shop_pmt_price_9 as select * from mamahao_price.t_daily_shop_pmt_price_0 where 1=2;

        select
            lb.depreciate * 100 as shopPmtPrice,
            lb.item_num_id as itemNumId,
            lb.style_num_id as styleNumId,
            lb.sub_unit_num_id as shopId,
            '2016-06-01' as validDate
            from  gb_pmt_pcy_item_lable lb
            WHERE
                lb.type_num_id = 1
                AND lb.BEGIN_DAY <='2018-06-01'
                AND lb.END_DAY >= '2018-06-01'
                AND lb.sub_unit_num_id > 0
                and lb.depreciate > 0
                AND lb.ticketid = '0'
                and lb.CANCELSIGN = 'N'
            ORDER BY
            lb.begin_day DESC,
            lb.depreciate ASC 
						limit 10;
						
						
						select * from gb_pmt_pcy_item_lable limit 10;
				

create table t_daily_shop_pmt_price_0_bak as select * from t_daily_shop_pmt_price_0;
create table t_daily_shop_pmt_price_1_bak as select * from t_daily_shop_pmt_price_1;
create table t_daily_shop_pmt_price_2_bak as select * from t_daily_shop_pmt_price_2;
create table t_daily_shop_pmt_price_3_bak as select * from t_daily_shop_pmt_price_3;
create table t_daily_shop_pmt_price_4_bak as select * from t_daily_shop_pmt_price_4;
create table t_daily_shop_pmt_price_5_bak as select * from t_daily_shop_pmt_price_5;
create table t_daily_shop_pmt_price_6_bak as select * from t_daily_shop_pmt_price_6;
create table t_daily_shop_pmt_price_7_bak as select * from t_daily_shop_pmt_price_7;
create table t_daily_shop_pmt_price_8_bak as select * from t_daily_shop_pmt_price_8;
create table t_daily_shop_pmt_price_9_bak as select * from t_daily_shop_pmt_price_9;


truncate table t_daily_shop_pmt_price_0;
truncate table t_daily_shop_pmt_price_1;
truncate table t_daily_shop_pmt_price_2;
truncate table t_daily_shop_pmt_price_3;
truncate table t_daily_shop_pmt_price_4;
truncate table t_daily_shop_pmt_price_5;
truncate table t_daily_shop_pmt_price_6;
truncate table t_daily_shop_pmt_price_7;
truncate table t_daily_shop_pmt_price_8;
truncate table t_daily_shop_pmt_price_9;

				

		
======================================
		
create table wgn_style_tmp as 		
select           s.online_time,
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
            0 as shop_id,
            #{validDate} as valid_date,
            0 as local_shop_city_num_id,
            0 as city_num_id,
            ifnull(st.pre_month_sale_count, 0) as month_sales,
            ifnull(gmb.click_num, 0) as month_clicks,
            0 as country_pmt_price,
            0 as company_pmt_price,
            0 as custom_price,
            0 as shop_pmt_price,
            0 as pmt_label		
				from
          gb_style s
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id ;
		
		
		select * from wgn_style_tmp group by STYLE_NUM_ID having count(1)>1;
		
		select * from wgn_style_tmp limit 10;
		
		select count(1) from gb_online;
		
		select * from wgn_style_tmp where style_num_id=800791;
	=====================================
#测试shop_base 的生成
truncate table t_shop_style_price_base;
truncate table t_city_style_price_base;

select  * from  t_shop_style_price_base limit 10;
select * from t_city_style_price_base limit 10;



select  count(1) from  t_shop_style_price_base_sh limit 10;
select count(1) from t_city_style_price_base_sh where valid_date='2018-06-01' limit 10;

select * from t_daily_custom_price  limit 10;

select * from t_daily_standard_price where style_num_id=803371;

select * from t_operational_price_sh where   shop_id=0 and city_num_id=330100 and style_num_id=800712;
select * from t_operational_price_sh  where city_num_id=0;

380979
438895



truncate table t_operational_price;

insert into t_operational_price select * from t_operational_price_sh where shop_id=38034 and style_num_id=803371;
insert into t_operational_price select * from t_operational_price_sh where  style_num_id=803371 and shop_id=0 and city_num_id=0;
insert into t_operational_price  select * from t_operational_price_sh where   shop_id=0 and city_num_id=330100 and style_num_id=800712;
update t_operational_price set end_time=STR_TO_DATE("2018-07-01","%Y-%m-%d") ;


drop table wgn_operational_price;
create table wgn_operational_price as select * from t_operational_price;

select * from t_operational_price;



// shop 数据
delete from gb_pmt_pcy_item_lable ;
insert into gb_pmt_pcy_item_lable select * from mamahao_price.gb_pmt_pcy_item_lable where sub_unit_num_id=38034 and style_num_id=803371;
update gb_pmt_pcy_item_lable set item_num_id=380979 where item_num_id=330182;
update gb_pmt_pcy_item_lable set depreciate=66.40 where item_num_id=438895;

select * from gb_pmt_pcy_item_lable where sub_unit_num_id=38034 and style_num_id=803371;

       select
            lb.depreciate * 100 as price,
            lb.item_num_id as itemNumId,
            lb.style_num_id as styleNumId,
            lb.sub_unit_num_id as shopId,
            '2018-06-01' as validDate
            from  gb_pmt_pcy_item_lable lb
            WHERE
                mod(lb.sub_unit_num_id,10)=4
                AND lb.type_num_id = 1
                AND lb.BEGIN_DAY <= '2018-06-01'
                AND lb.END_DAY >= '2018-06-01'
                AND lb.sub_unit_num_id > 0
                and lb.depreciate > 0
                AND lb.ticketid = '0'
                and lb.CANCELSIGN = 'N'
            ORDER BY
            lb.begin_day DESC,
            lb.depreciate ASC
//company数据

delete from gb_pmt_pcy_item_lable;
insert into gb_pmt_pcy_item_lable select * from mamahao_price.gb_pmt_pcy_item_lable where mg_unit_num_id=45 limit 2;

update gb_pmt_pcy_item_lable set item_num_id=380979,depreciate=68.00 where item_num_id=392705;
update gb_pmt_pcy_item_lable set item_num_id=438895 where item_num_id=392706;
select * from gb_pmt_pcy_item_lable;


            select
                lb.depreciate * 100 as price,
                lb.item_num_id as itemNumId,
                lb.mg_unit_num_id as companyId,
                lb.style_num_id as styleNumId,
                '2018-06-01' as validDate
            from  mamahao_price.gb_pmt_pcy_item_lable lb
            WHERE
              lb.type_num_id = 1
                AND lb.BEGIN_DAY  <='2018-06-01'
                AND lb.END_DAY >= '2018-06-01'
                AND lb.mg_unit_num_id > 1 and lb.mg_unit_num_id != 10
                and lb.depreciate > 0
                AND lb.ticketid = '0'
                and lb.CANCELSIGN = 'N'
            ORDER BY
                lb.begin_day DESC,
                lb.depreciate ASC limit 1;

//country 数据
delete from gb_pmt_pcy_item_lable;
insert into gb_pmt_pcy_item_lable select * from mamahao_price.gb_pmt_pcy_item_lable where mg_unit_num_id in (1,10) limit 2;

update gb_pmt_pcy_item_lable set item_num_id=380979,depreciate=68.00 where item_num_id=750265;
update gb_pmt_pcy_item_lable set item_num_id=438895 where item_num_id=417841;
select * from gb_pmt_pcy_item_lable;


		
						
delete from gb_online;
insert into gb_online select * from gb_online_sh where sid=38034 and STYLE_ID=803371;

select * from gb_online where sid=38034 and STYLE_ID=803371;


============================
测试City_base

truncate table gb_online;
truncate table t_city_style_price_base;


delete from t_city_style_price_base;

#准备shop 数据

update t_shop_style_price_base set min_price=15 where local_shop_city_num_id=510100

#准备standard的数据
update t_shop_style_price_base set style_id=739376,style_num_id=800712 where local_shop_city_num_id=510100;


#准备custom数据
truncate table t_operational_price;
insert into t_operational_price select * from t_operational_price_sh where shop_id=38034 and style_num_id=803371;
insert into t_operational_price select * from t_operational_price_sh where  style_num_id=803371 and shop_id=0 and city_num_id=0;
insert into t_operational_price  select * from t_operational_price_sh where   shop_id=0 and city_num_id=330100 and style_num_id=800712;
update t_operational_price set end_time=STR_TO_DATE("2018-07-01","%Y-%m-%d") ;
update t_operational_price set style_num_id=800712 where id=2255594;
update t_operational_price set style_num_id=800712 ,city_num_id=320500,item_num_id=380979 where id=2615712;

#准备gbonline数据
delete from gb_online;
insert into gb_online select * from gb_online_sh where sid=38034 and STYLE_ID in (803371,800712);
update gb_online set STYLE_ID=800712 where id=11136468;
#准备company数据
delete from gb_pmt_pcy_item_lable;
insert into gb_pmt_pcy_item_lable select * from mamahao_price.gb_pmt_pcy_item_lable where mg_unit_num_id=45 limit 2;
update gb_pmt_pcy_item_lable set item_num_id=380979 where item_num_id=392705;
update gb_pmt_pcy_item_lable set item_num_id=438895 where item_num_id=392706;
update gb_pmt_pcy_item_lable set depreciate=55.40 ;
//country 数据
delete from gb_pmt_pcy_item_lable;
insert into gb_pmt_pcy_item_lable select * from mamahao_price.gb_pmt_pcy_item_lable where mg_unit_num_id in (1,10) limit 2;
update gb_pmt_pcy_item_lable set item_num_id=380979 where item_num_id=750265;
update gb_pmt_pcy_item_lable set item_num_id=438895 where item_num_id=417841;
update gb_pmt_pcy_item_lable set depreciate=20;


delete from t_city_style_price_base;
#查询结果
select * from t_city_style_price_base ;
select * from t_shop_style_price_base;
select * from t_operational_price;
select * from gb_online;
select * from gb_pmt_pcy_item_lable;
select * from t_sid_city;
================================



		
truncate table gb_pmt_pcy_item_lable;	

insert into gb_pmt_pcy_item_lable select * from mamahao_price.gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=0;

select count(1) from gb_pmt_pcy_item_lable ;
		
select reserved_no ,count(1) from gb_pmt_pcy_item_lable  group by reserved_no order by reserved_no desc;

delete from gb_pmt_pcy_item_lable where reserved_no>5000161454;

===================================
select count(1) from t_shop_style_price_base_sh;
		
select * from t_shop_style_price_base_sh where valid_date='2018-06-01' and mod(shop_id,10)=0 limit 10;		

#delete from gb_pmt_pcy_item_lable where sub_unit_num_id!=90000020;

select * from gb_pmt_pcy_item_lable where sub_unit_num_id=90000020;

select * from t_shop_style_price_base_sh where shop_id=90000020 and style_num_id=800719 and valid_date='2018-06-01';	

delete from gb_online where sid!=90000020 or style_id!=800719;

select * from gb_online where sid=90000020 and style_id=800719;


		
=============备份上次结果数据并清空表=========================

#批量数据测试
drop table t_daily_shop_pmt_price_0_bak   ;                                                      
drop table t_daily_shop_pmt_price_1_bak   ;                                                      
drop table t_daily_shop_pmt_price_2_bak   ;                                                      
drop table t_daily_shop_pmt_price_3_bak   ;                                                      
drop table t_daily_shop_pmt_price_4_bak   ;                                                      
drop table t_daily_shop_pmt_price_5_bak   ;                                                      
drop table t_daily_shop_pmt_price_6_bak   ;                                                      
drop table t_daily_shop_pmt_price_7_bak   ;                                                      
drop table t_daily_shop_pmt_price_8_bak   ;                                                      
drop table t_daily_shop_pmt_price_9_bak   ;                                                      
drop table t_daily_custom_price_bak       ;                                                      
drop table t_daily_standard_price_bak     ;                                                      
drop table t_daily_company_pmt_price_bak  ;                                                      
drop table t_daily_country_pmt_price_bak  ;                                                      
drop table t_shop_style_price_base_bak    ;                                                      
drop table t_city_style_price_base_bak    ;                                                      
create table t_daily_shop_pmt_price_0_bak      as   select * from   t_daily_shop_pmt_price_0  ;  
create table t_daily_shop_pmt_price_1_bak      as   select * from   t_daily_shop_pmt_price_1  ;  
create table t_daily_shop_pmt_price_2_bak      as   select * from   t_daily_shop_pmt_price_2  ;  
create table t_daily_shop_pmt_price_3_bak      as   select * from   t_daily_shop_pmt_price_3  ;  
create table t_daily_shop_pmt_price_4_bak      as   select * from   t_daily_shop_pmt_price_4  ;  
create table t_daily_shop_pmt_price_5_bak      as   select * from   t_daily_shop_pmt_price_5  ;  
create table t_daily_shop_pmt_price_6_bak      as   select * from   t_daily_shop_pmt_price_6  ;  
create table t_daily_shop_pmt_price_7_bak      as   select * from   t_daily_shop_pmt_price_7  ;  
create table t_daily_shop_pmt_price_8_bak      as   select * from   t_daily_shop_pmt_price_8  ;  
create table t_daily_shop_pmt_price_9_bak      as   select * from   t_daily_shop_pmt_price_9  ;  
create table t_daily_custom_price_bak          as   select * from   t_daily_custom_price      ;  
create table t_daily_standard_price_bak        as   select * from   t_daily_standard_price    ;  
create table t_daily_company_pmt_price_bak     as   select * from   t_daily_company_pmt_price ;  
create table t_daily_country_pmt_price_bak     as   select * from   t_daily_country_pmt_price ;  
create table t_shop_style_price_base_bak       as   select * from   t_shop_style_price_base   ;  
create table t_city_style_price_base_bak       as   select * from   t_city_style_price_base   ;  

truncate table t_daily_shop_pmt_price_0;
truncate table t_daily_shop_pmt_price_1;
truncate table t_daily_shop_pmt_price_2;
truncate table t_daily_shop_pmt_price_3;
truncate table t_daily_shop_pmt_price_4;
truncate table t_daily_shop_pmt_price_5;
truncate table t_daily_shop_pmt_price_6;
truncate table t_daily_shop_pmt_price_7;
truncate table t_daily_shop_pmt_price_8;
truncate table t_daily_shop_pmt_price_9;
truncate table t_daily_custom_price;
truncate table t_daily_standard_price;
truncate table t_daily_company_pmt_price;
truncate table t_daily_country_pmt_price;
truncate table t_shop_style_price_base;
truncate table t_city_style_price_base;

		
		
				
		
		
		
===========生成数据比对t_shop_style_price_base_cy========================


#取差集
drop table t_shop_style_price_base_cy;
create table t_shop_style_price_base_cy 
as select * from 
(select shop_id,local_shop_city_num_id,shop_name,style_num_id,style_id,city_num_id,min_price,standard_price,country_pmt_price,company_pmt_price,custom_price,shop_pmt_price,pre_heat_price,pmt_label,valid_date from t_shop_style_price_base_bak union all 
select shop_id,local_shop_city_num_id,shop_name,style_num_id,style_id,city_num_id,min_price,standard_price,country_pmt_price,company_pmt_price,custom_price,shop_pmt_price,pre_heat_price,pmt_label,valid_date from t_shop_style_price_base_20180706 where valid_date='2018-06-20') t
group by shop_id,local_shop_city_num_id,shop_name,style_num_id,style_id,city_num_id,min_price,standard_price,country_pmt_price,company_pmt_price,custom_price,shop_pmt_price,pre_heat_price,pmt_label,valid_date having count(1)=1;
#统计差异数据量		
select 't_shop_style_price_base_cy',count(1) from t_shop_style_price_base_cy union all
select 't_shop_style_price_base_bak',count(1) from t_shop_style_price_base_bak union all
select 't_shop_style_price_base_20180706',count(1) from t_shop_style_price_base_20180706 where valid_date='2018-06-20';

#查看差异
select * from t_shop_style_price_base_cy;

select concat('select * from t_shop_style_price_base_cy where shop_id=',shop_id,' and style_num_id=',style_num_id,' limit 100;
select * from t_shop_style_price_base_bak where shop_id=',shop_id,' and style_num_id=',style_num_id,' limit 100;
select * from t_shop_style_price_base_20180706 where shop_id=',shop_id,' and style_num_id=',style_num_id,' and valid_date=''2018-06-20''limit 100;
') from t_shop_style_price_base_cy limit 100;


select * from t_shop_style_price_base_cy where shop_id=37351 and style_num_id=126359 limit 100;
select * from t_shop_style_price_base_bak where shop_id=37351 and style_num_id=126359 limit 100;
select * from t_shop_style_price_base_20180706 where shop_id=37351 and style_num_id=126359 and valid_date='2018-06-20'limit 100;


#shop_pmt_price 不同的数据

drop table wgn_shop_shop_price;
create table wgn_shop_shop_price as 
select shop_id,style_num_id,shop_pmt_price 
from t_shop_style_price_base_cy 
group by shop_id,style_num_id,shop_pmt_price
having count(1)=1

select count(1) from wgn_shop_shop_price;---395

drop table t_shop_style_price_base_bak;
create table t_shop_style_price_base_bak as select * from t_shop_style_price_base;
drop table t_city_style_price_base_bak;
create table t_city_style_price_base_bak as select * from t_city_style_price_base;
		
select * from t_shop_style_price_base_cy where style_num_id=931969 and  shop_id=67751  limit 10; 	
select * from t_shop_style_price_base_bak where style_num_id=931969 and  shop_id=67751  limit 10; 	
select * from t_shop_style_price_base_20180706 where style_num_id=931969 and  shop_id=67751  limit 10; 	

select * from t_daily_shop_pmt_price_8 where style_num_id=931969 and  shop_id=67751;
select * from t_daily_shop_pmt_price_20180614 where    shop_id=67751;

select * from gb_online where  sid=90259808 ;
select * from t_daily_standard_price_bak where item_num_id in (12018743,12018746);


select * from gb_style where style_num_id=907208;

select * from t_daily_country_pmt_price where style_num_id=904500;

select * from t_daily_country_pmt_price_20180614 where style_num_id=904500;

select * from gb_pmt_pcy_item_lable where style_num_id=904500 ;






select * from t_daily_company_pmt_price where  style_num_id=802430 and company_id=1 ; 
select * from t_daily_company_pmt_price_20180614 where  style_num_id=802430 and company_id=1;
select * from gb_online where style_id=170845 and  sid=9489;

select * from gb_online where company_id  in (1,10);

==========修正线上错误数据=================================
create table  t_city_style_price_base_20180706bak as select * from  t_city_style_price_base_20180706;
update t_city_style_price_base_20180706 set company_pmt_price=0 where shop_pmt_price>0;

select * from t_city_style_price_base_20180706 where min_price!=standard_price and country_pmt_price=0  and company_pmt_price=0 and custom_price=0 and shop_pmt_price=0 limit 10;

----------生成数据比对t_city_style_price_base--------------

#取差集
drop table t_city_style_price_base_cy;
create table t_city_style_price_base_cy 
as select * from 
(select style_num_id,style_id		,city_num_id	,min_price	,standard_price	,pre_heat_price	,country_pmt_price,company_pmt_price		,custom_price	,shop_pmt_price				,valid_date	from t_city_style_price_base_bak union all 
select style_num_id,style_id		,city_num_id	,min_price	,standard_price	,pre_heat_price	,country_pmt_price,company_pmt_price		,custom_price	,shop_pmt_price				,valid_date	from t_city_style_price_base_20180706 where valid_date='2018-06-20') t
group by style_num_id,style_id		,city_num_id	,min_price	,standard_price	,pre_heat_price	,country_pmt_price,company_pmt_price		,custom_price	,shop_pmt_price				,valid_date	having count(1)=1;

#只关注min_price取差集
drop table t_city_style_price_base_cy_1;
create table t_city_style_price_base_cy_1 
as select * from 
(select style_num_id		,city_num_id	,min_price	,	standard_price,valid_date	from t_city_style_price_base_bak union all 
select style_num_id		,city_num_id	,min_price	,standard_price	,valid_date	from t_city_style_price_base_20180706 where valid_date='2018-06-20') t
group by style_num_id		,city_num_id	,min_price	,standard_price	,valid_date	having count(1)=1;
	
select count(1) from t_city_style_price_base_cy_1;

#统计数量
select concat('select * from t_city_style_price_base_cy_1 where city_num_id=',city_num_id,' and style_num_id=',style_num_id,' limit 100;
select * from t_city_style_price_base_bak where city_num_id=',city_num_id,' and style_num_id=',style_num_id,'l imit 100;
select * from t_city_style_price_base_20180706 where city_num_id=',city_num_id,' and style_num_id=',style_num_id,' limit 100;') from t_city_style_price_base_cy_1 limit 100;


select count(1) from t_city_style_price_base_cy union all 
select count(1) from t_city_style_price_base_bak union all 
select count(1) from t_city_style_price_base_20180706 where valid_date='2018-06-20';

#######company_pmt_price不同的数据

drop table wgn_city_company_price;
create table wgn_city_company_price
as select city_num_id,style_num_id,company_pmt_price 
from t_city_style_price_base_cy 
group by city_num_id,style_num_id,company_pmt_price having count(1)=1;
select count(1) from wgn_city_company_price;
select * from wgn_city_company_price;

#剔除company_price不等合理的数据
drop table wgn_city_company_price_tc;
create table wgn_city_company_price_tc as
select city_num_id,style_num_id,min_price
from t_city_style_price_base_cy
group by city_num_id,style_num_id,min_price
having count(1)=2;
select count(1) from wgn_city_company_price_tc;

delete from wgn_city_company_price where exists(select 1 from wgn_city_company_price_tc t2 where wgn_city_company_price.city_num_id=t2.city_num_id and wgn_city_company_price.style_num_id=t2.style_num_id);

#剔除没有生成的数据
create table wgn_city_company_price_tc1
select city_num_id,style_num_id from t_city_style_price_base_cy
group by city_num_id,style_num_id  having count(1)=1
select count(1) from wgn_city_company_price_tc1;
delete from wgn_city_company_price where exists(select 1 from wgn_city_company_price_tc1 t2 where wgn_city_company_price.city_num_id=t2.city_num_id and wgn_city_company_price.style_num_id=t2.style_num_id);



select * from t_city_style_price_base_cy where city_num_id=321000 and style_num_id=912987 limit 100;
select * from t_city_style_price_base_bak where city_num_id=321000 and style_num_id=912987 limit 100;
select * from t_city_style_price_base_20180706 where city_num_id=321000 and style_num_id=912987 and valid_date='2018-06-20' limit 100;

select * from t_shop_style_price_base_bak where style_num_id=912987;
select * from t_shop_style_price_base_20180706 where style_num_id=912987 and valid_date='2018-06-20';

##########shop_pmt_price 不同的数据--6626

create table wgn_city_shop_price
as select city_num_id,style_num_id,shop_pmt_price 
from t_city_style_price_base_cy 
group by city_num_id,style_num_id,shop_pmt_price having count(1)=1;

select count(1) from wgn_city_shop_price;
############custom_price 不同的数据---33412
create table wgn_city_custom_price 
as select city_num_id,style_num_id,custom_price 
from t_city_style_price_base_cy 
group by city_num_id,style_num_id,custom_price having count(1)=1;

select count(1) from wgn_city_custom_price;
select * from wgn_city_custom_price limit 100;


#country_pmt_price 不同的数据--3548
create table wgn_city_country_price 
as select city_num_id,style_num_id,country_pmt_price 
from t_city_style_price_base_cy 
group by city_num_id,style_num_id,country_pmt_price having count(1)=1;

select count(1) from wgn_city_country_price;


# 多出的数据
drop table t_city_style_price_base_qs;
create table t_city_style_price_base_qs as select * from (select city_num_id,style_num_id from t_city_style_price_base_cy group by city_num_id,style_num_id having count(1)=1) t ;

create index wgn_tmp on t_city_style_price_base_qs(

delete from t_city_style_price_base_cy  where  exists(select 1 from t_city_style_price_base_qs t2 where t_city_style_price_base_cy.city_num_id=t2.city_num_id and t_city_style_price_base_cy.style_num_id=t2.style_num_id) ;

create index wgn_index_tmp1 on t_city_style_price_base_cy(city_num_id,style_num_id);
create index wgn_index_tmp2 on t_city_style_price_base_qs(city_num_id,style_num_id);

select count(1) from t_city_style_price_base_cy t1 where not exists(select 1 from t_city_style_price_base_qs t2 where t1.city_num_id=t2.city_num_id and t1.style_num_id=t2.style_num_id) limit 100;
select count(1) from t_city_style_price_base_qs;




custom_price 不同的数据
select count(1) from t_city_style_price_base_tmp4;
select * from t_city_style_price_base_tmp4;

select * from t_shop_style_price_base where style_num_id=805272;
select * from t_shop_style_price_base_20180614 where style_num_id=805272;
select * from t_city_style_price_base_cy where city_num_id=130100 and style_num_id=805272 limit 100;
select * from t_city_style_price_base where city_num_id=130100 and style_num_id=805272 limit 100;
select * from t_city_style_price_base_20180614 where city_num_id=130100 and style_num_id=805272 and valid_date='2018-06-14' limit 100;
select * from t_daily_custom_price where style_num_id=805272;
select * from gb_online where style_id=805272;

##########standard_price 不同的数据1 生产不对



select * from t_shop_style_price_base where style_num_id=701208;
select * from t_shop_style_price_base_20180614 where style_num_id=701208;
select * from t_city_style_price_base_cy where city_num_id=140100 and style_num_id=701208 limit 100;
select * from t_city_style_price_base where city_num_id=140100 and style_num_id=701208 limit 100;
select * from t_city_style_price_base_20180614 where city_num_id=140100 and style_num_id=701208 and valid_date='2018-06-14' limit 100;

select * from t_shop_style_price_base where style_num_id= 181511;
select * from t_shop_style_price_base_20180614 where style_num_id=181511 and valid_date='2018-06-14';





select * from t_city_style_price_base_cy where city_num_id=210200 and style_num_id=178215 limit 100;
select * from t_city_style_price_base where city_num_id=210200 and style_num_id=178215 limit 100;
select * from t_city_style_price_base_20180614 where city_num_id=210200 and style_num_id=178215 limit 100;

select * from t_shop_style_price_base where style_num_id= 181511;
select * from t_shop_style_price_base_20180614 where style_num_id=181511 and valid_date='2018-06-14';

select * from gb_pmt_pcy_item_lable where style_num_id=181511 and sub_unit_num_id=39372;



select city_num_id,div_num_id from gb_city_area where  del_state = 0  and city_num_id=341200 group by city_num_id;
select * from t_daily_company_pmt_price where style_num_id=5921 and company_id= 9492;

create table t_city_style_price_base_bak as select * from t_city_style_price_base;

select * from gb_online where style_id=5921 and sid=52353;



show VARIABLES like '%tmp%';

set session tmp_table_size=1024000000;



------------t_shop_style_price_base 现在的生成方式
   select *   from
          gb_style s
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id
				where s.STYLE_NUM_ID=802430;
		
select * from gb_online where sid=9489 and style_id=170845;

select * from t_daily_standard_price  where item_num_id=218298;

				
				
----t_shop_style_price_base 之前的生成方式				
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
            9489 as shop_id,
            '2018-06-14'
						as valid_date,
            320500,
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
                g1.sid = 9489
                and g2.valid_date ='2018-06-14'
                order by g2.price asc
            ) T group by T.style_num_id)o on s.style_num_id = o.style_num_id
        left join t_goods_type t1 on t1.gt_id = s.style_catelog_first
        left join t_goods_type t2 on t2.gt_id = s.style_catelog_sec
        left join t_goods_type t3 on t3.gt_id = s.style_catelog_third
        left join t_brand b on b.b_id = s.brand_id
        left join t_goods_month_sale_total st on st.style_num_id = s.style_num_id
        left join t_goods_month_browse gmb on gmb.style_num_id = s.style_num_id
				where o.style_num_id=170845;
			
				
		
select * from t_daily_shop_pmt_price_3 where shop_id=9253 and item_num_id in (12009933,12028563);		
select * from t_daily_shop_pmt_price_20180614 where shop_id=9253 and item_num_id in (12009933,12028563);	
		
		
select * from t_daily_standard_price where item_num_id in (12009933,12028563);		
select * from t_daily_standard_price_20180614 where item_num_id in (12009933,12028563);			
		
		
 select city_num_id,div_num_id from gb_city_area where  del_state = 0 group by city_num_id,div_num_id having count(1)>1;		
		
		
		
		
		
=============================

        select
            *
        from (
            select
                lb.depreciate * 100 as countryPmtPrice,
                lb.item_num_id as itemNumId,
                lb.style_num_id as styleNumId
            from
              gb_pmt_pcy_item_lable lb
            WHERE
                lb.type_num_id = 1
                and lb.item_num_id in (374149)
                AND lb.BEGIN_DAY <='2018-06-14'
                AND lb.END_DAY >=  '2018-06-14'
                AND lb.mg_unit_num_id in (1, 10)
                AND lb.ticketid = '0'
                AND lb.depreciate > 0
                and lb.CANCELSIGN = 'N'
            ORDER BY
                lb.BEGIN_DAY DESC,
                lb.depreciate ASC
        ) T
        GROUP BY
          T.itemNumId

				
select * from gb_pmt_pcy_item_lable limit 1;				
				
				