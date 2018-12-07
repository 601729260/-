#------------------创建表---------------------------

create table mamahao_price.t_daily_standard_price as select * from db_gd_dev.t_daily_standard_price;
create table mamahao_price.t_daily_custom_price as select * from db_gd_dev.t_daily_custom_price;

create table mamahao_price.t_daily_company_pmt_price as select * from db_gd_dev.t_daily_company_pmt_price;
create table mamahao_price.t_daily_country_pmt_price as select * from db_gd_dev.t_daily_country_pmt_price;

create table t_daily_shop_pmt_price_0 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_1 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_2 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_3 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_4 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_5 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_6 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_7 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_8 as select * from t_daily_shop_pmt_price_0 where 1=2;
create table t_daily_shop_pmt_price_9 as select * from t_daily_shop_pmt_price_0 where 1=2;




create table gb_pmt_pcy_item_lable_0 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=0;
create table gb_pmt_pcy_item_lable_1 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=1;
create table gb_pmt_pcy_item_lable_2 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=2;
create table gb_pmt_pcy_item_lable_3 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=3;
create table gb_pmt_pcy_item_lable_4 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=4;
create table gb_pmt_pcy_item_lable_5 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=5;
create table gb_pmt_pcy_item_lable_6 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=6;
create table gb_pmt_pcy_item_lable_7 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=7;
create table gb_pmt_pcy_item_lable_8 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=8;
create table gb_pmt_pcy_item_lable_9 as select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=9;


select * from db_gd_dev.gb_pmt_pcy_item_lable_1 limit 1;

#-----------------备份生产表----------------------------------
create table t_daily_shop_pmt_price_sh     as select * from t_daily_shop_pmt_price    ; 
create table t_daily_company_pmt_price_sh  as select * from t_daily_company_pmt_price ; 
create table t_daily_country_pmt_price_sh  as select * from t_daily_country_pmt_price ; 
create table t_daily_custom_price_sh       as select * from t_daily_custom_price      ; 
create table t_daily_standard_price_sh     as select * from t_daily_standard_price    ; 
create table gb_pmt_pcy_item_lable_sh      as select * from gb_pmt_pcy_item_lable     ;

#------------------数据割接-----------------------------------
create table gb_pmt_pcy_item_lable as select * from db_gd_dev.gb_pmt_pcy_item_lable_20180529;

#------------------测试数据准备---------------------------------

create table t_daily_shop_pmt_price_6 as select * from t_daily_shop_pmt_price_0 where 1=2;
select * from t_daily_shop_pmt_price_6 where shop_id=90053406 and valid_date='2018-05-31' ; 
select * from t_daily_shop_pmt_price_6 where shop_id=37856 and valid_date='2018-05-31' ;

select count(1) from t_daily_standard_price;
select count(1) from t_daily_custom_price;

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
truncate table t_daily_company_pmt_price;
truncate table t_daily_country_pmt_price;
truncate table t_daily_custom_price;
truncate table t_daily_standard_price;



	select 't_daily_shop_pmt_price_0',count(1) from t_daily_shop_pmt_price_0 union all
	select 't_daily_shop_pmt_price_1',count(1) from t_daily_shop_pmt_price_1 union all
	select 't_daily_shop_pmt_price_2',count(1) from t_daily_shop_pmt_price_2 union all
	select 't_daily_shop_pmt_price_3',count(1) from t_daily_shop_pmt_price_3 union all
	select 't_daily_shop_pmt_price_4',count(1) from t_daily_shop_pmt_price_4 union all
	select 't_daily_shop_pmt_price_5',count(1) from t_daily_shop_pmt_price_5 union all
	select 't_daily_shop_pmt_price_6',count(1) from t_daily_shop_pmt_price_6 union all
	select 't_daily_shop_pmt_price_7',count(1) from t_daily_shop_pmt_price_7 union all
	select 't_daily_shop_pmt_price_8',count(1) from t_daily_shop_pmt_price_8 union all
	select 't_daily_shop_pmt_price_9',count(1) from t_daily_shop_pmt_price_9 union all
	select 't_daily_company_pmt_price',count(1) from t_daily_company_pmt_price union all
	select 't_daily_country_pmt_price',count(1) from t_daily_country_pmt_price union all
	select 't_daily_custom_price',count(1) from t_daily_custom_price;
	
	-----------
		select count(1) from t_daily_standard_price_sh where valid_date='2018-06-01';
	select count(1) from t_daily_standard_price where valid_date='2018-06-01';
	
	select * from t_daily_standard_price limit 1;
	
	create table t_daily_standard_price_cy
	select * from (
	select 	item_num_Id	,style_num_id	,price	,valid_date	 from t_daily_standard_price where valid_date='2018-06-01' union all 
	select 	item_num_Id	,style_num_id	,price	,valid_date	 from t_daily_standard_price_sh where valid_date='2018-06-01') t
	group by item_num_Id	,style_num_id	,price	,valid_date having count(*)=1;
	
	
	select * from t_daily_standard_price where item_num_id in ( select item_num_id from t_daily_standard_price_cy);
	
	item_num_Id	style_num_id	price	valid_date
162925	900972	32900	2018-06-01
	         select
                EDMI.item_num_id as itemNumId,
                item.style_num_id as styleNumId,
                EDMI.RETAIL_PRICE * 100 as price,
                '2018-06-01' as validDate
            from mamahao_price_main.gb_share_item item
            LEFT JOIN  mamahao_price_main.GB_DIV_MARKET_ITEM EDMI on item.item_num_id=EDMI.ITEM_NUM_ID and EDMI.DIV_NUM_ID = item.DIV_NUM_ID
            INNER JOIN mamahao_price_main.GB_PRICE_COLLECT PCL ON EDMI.CHANNEL_SUB_NUM_ID = PCL.CHANNEL_SUB_NUM_ID
            INNER JOIN mamahao_price_main.GB_DIV DB ON DB.COLLECT_NUM_ID = PCL.COLLECT_NUM_ID
            WHERE
                DB.DIV_NUM_ID = 31
                AND EDMI.RETAIL_PRICE > 0
                AND EDMI.BEGIN_DAY <='2018-06-01'
                AND EDMI.END_DAY >= '2018-06-01'
								and EDMI.item_num_id =162925
            ORDER BY
                EDMI.BEGIN_DAY DESC,
                EDMI.RETAIL_PRICE ASC
		
select * from 		mamahao_price_main.GB_DIV_MARKET_ITEM where item_num_id=162925;
								
	---正常差异						
								
	
-------------	
	select count(1) from t_daily_custom_price_sh where valid_date='2018-06-01';
	select count(1) from t_daily_custom_price where valid_date='2018-06-01';
	
	create table t_daily_custom_price_cy as
	select * from (
	select custom_id	,item_num_id	,style_num_id	,price	,city_num_id	,reserved_no	,price_label	,valid_date	,shop_id from t_daily_custom_price where valid_date='2018-06-01'union all
	select custom_id	,item_num_id	,style_num_id	,price	,city_num_id	,reserved_no	,price_label	,valid_date	,shop_id from t_daily_custom_price_sh where valid_date='2018-06-01' ) t 
	group by custom_id	,item_num_id	,style_num_id	,price	,city_num_id	,reserved_no	,price_label	,valid_date	,shop_id having count(*)=1;
	
	select * from t_daily_custom_price_cy;
	
	select * from t_daily_custom_price where item_num_id in (select item_num_id from t_daily_custom_price_cy);
	
	--- 正常差异
	
	
	------------------
	
		select count(1) from t_daily_company_pmt_price_sh where valid_date='2018-06-01';
	select count(1) from t_daily_company_pmt_price where valid_date='2018-06-01';
	
	select * from t_daily_company_pmt_price limit 1;
	item_num_id	,style_num_id,	company_id,	price	,valid_date
1	31225	4608	21	69900	2018-06-01	2018-06-04 13:46:58	2018-06-04 13:46:58
	create table t_daily_company_pmt_price_cy as
	select * from (
	select item_num_id	,style_num_id,	company_id,	price	,valid_date from t_daily_company_pmt_price where valid_date='2018-06-01'union all
	select item_num_id	,style_num_id,	company_id,	price	,valid_date from t_daily_company_pmt_price_sh where valid_date='2018-06-01' ) t 
	group by item_num_id	,style_num_id,	company_id,	price	,valid_date having count(*)=1;
	
	select * from t_daily_company_pmt_price_cy;
	
-----没有差异

-------------------------
		select count(1) from t_daily_country_pmt_price_sh where valid_date='2018-06-01';
	select count(1) from t_daily_country_pmt_price where valid_date='2018-06-01';
	
	select * from t_daily_country_pmt_price limit 1;

	item_num_id,style_num_id,price,valid_date
1	32211	0	98000	2018-06-01	2018-06-04 13:47:15	2018-06-04 13:47:15

	create table t_daily_country_pmt_price_cy as
	select * from (
	select item_num_id,style_num_id,price,valid_date from t_daily_country_pmt_price where valid_date='2018-06-01'union all
	select item_num_id,style_num_id,price,valid_date from t_daily_country_pmt_price_sh where valid_date='2018-06-01' ) t 
	group by item_num_id,style_num_id,price,valid_date having count(*)=1;
	
	select * from t_daily_company_pmt_price_cy;

select * from gb_pmt_pcy_item_lable where item_num_id=161721

-----  合理差异
	
-------------------------------





drop table t_daily_shop_pmt_price ;
create table  t_daily_shop_pmt_price as 
select * from t_daily_shop_pmt_price_0 union all
select * from t_daily_shop_pmt_price_1 union all
select * from t_daily_shop_pmt_price_2 union all
select * from t_daily_shop_pmt_price_3 union all
select * from t_daily_shop_pmt_price_4 union all
select * from t_daily_shop_pmt_price_5 union all
select * from t_daily_shop_pmt_price_6 union all
select * from t_daily_shop_pmt_price_7 union all
select * from t_daily_shop_pmt_price_8 union all
select * from t_daily_shop_pmt_price_9 ;

select count(1) from t_daily_shop_pmt_price_sh where  valid_date='2018-06-01';
select count(1) from t_daily_shop_pmt_price where  valid_date='2018-06-01';

select  * from t_daily_shop_pmt_price limit 1;
id	style_num_id	item_num_id	shop_id	price	valid_date	create_time	update_time
0	232	29523	43840	7740	2018-06-01	2018-06-04 13:36:04	

	create table t_daily_shop_pmt_price_cy as
	select * from (
	select item_num_id,style_num_id,price,valid_date from t_daily_shop_pmt_price where valid_date='2018-06-01'union all
	select item_num_id,style_num_id,price,valid_date from t_daily_shop_pmt_price_sh where valid_date='2018-06-01' ) t 
	group by item_num_id,style_num_id,price,valid_date having count(*)=1;
	
	select count(1)  from t_daily_shop_pmt_price_cy;
	
	
select count(1) from t_daily_shop_pmt_price_cy a  where exists(select 1 from t_daily_shop_pmt_price b
		where a.item_num_id=b.item_num_id
		and a.style_num_id=b.style_num_id
		and a.price=b.price
		and a.valid_date=b.valid_date) ;
	
	------ 正常误差-------------
	create index wgn_tmp_is on t_daily_shop_pmt_price_0(item_num_id,style_num_id);
	create index wgn_tmp_is2 on t_daily_shop_pmt_price_cy(item_num_id,style_num_id);
	
	
	select * from t_daily_shop_pmt_price_cy limit 1;


update t_daily_shop_pmt_price_0 set valid_date='2018-05-30' where shop_id=90049620 and valid_date='2018-05-25';


SELECT  id,item_num_id,style_num_id,shop_id,price,valid_date,create_time,update_time  FROM t_daily_shop_pmt_price_0  WHERE (  valid_date = '2018-05-30'
            
        
          
              and shop_id = 90049620 )
