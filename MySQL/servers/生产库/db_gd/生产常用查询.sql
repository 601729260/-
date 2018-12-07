select 'gb_pmt_pcy_item_lable', count(1) from gb_pmt_pcy_item_lable union all
select 't_daily_shop_pmt_price',  count(1) from t_daily_shop_pmt_price union all
select 't_shop_style_price_base', count(1) from t_shop_style_price_base union all
select 't_city_style_price_base', count(1) from t_city_style_price_base;

select 'gb_pmt_pcy_item_lable', count(1) from gb_pmt_pcy_item_lable  union all
select 't_daily_shop_pmt_price',  count(1) from t_daily_shop_pmt_price where valid_date='2018-06-14' union all
select 't_shop_style_price_base', count(1) from t_shop_style_price_base  where valid_date='2018-06-14' union all
select 't_city_style_price_base', count(1) from t_city_style_price_base where valid_date='2018-06-14';


select * from t_daily_shop_pmt_price where  style_num_id=932269 and  shop_id=37548;

select * from t_shop_style_price_base where style_num_id=932269 and  shop_id=37548  limit 10; 	

select * from t_gb_stock limit 10;

select * from gb_cort_sub_unit where sub_unit_num_id=12772 limit 10;


select * from gb_online where style_id=126347;

select * from gb_online where item_id=12010985;

select * from t_gb_stock where item_num_id=12018726 and shop_id=67751;


select * from t_daily_shop_pmt_price_1  where shop_id=90000011 and valid_date='2018-06-21' limit 100;

select * from gb_style  t where t.STYLE_num_ID=209110;

select * from t_city_style_price_base where valid_date'2018-06-21' ; 


330100

select * from gb_cort_sub_unit where city_num_id=330100 and sale_status=1 limit 100;



create table t_city_style_price_base_20180621 as select * from t_city_style_price_base where valid_date='2018-06-21';
create table t_shop_style_price_base_20180621 as select * from t_shop_style_price_base where valid_date='2018-06-21';

select * from 
(select city_num_id,style_num_id from t_city_style_price_base_20180621 where style_num_id=920857 and valid_date='2018-06-21' union all
select city_num_id,style_num_id from t_city_style_price_base where style_num_id=920857 and valid_date='2018-06-21' ) t
group by city_num_id,style_num_id  having count(1)>2;

select count(1) from t_city_style_price_base_20180621 where style_num_id=920857 and  valid_date='2018-06-21' union all
select count(1) from t_city_style_price_base where style_num_id=920857 and  valid_date='2018-06-21';



select * from t_city_style_price_base_20180621 where city_num_id=320600 and style_num_id=920857 ;

select city_num_id,style_num_id  from t_city_style_price_base_20180621 where style_num_id=920857 and valid_date='2018-06-21' group by city_num_id,style_num_id  having count(1)>1;
select city_num_id,style_num_id  from t_city_style_price_base_20180621 where style_num_id=920857 and valid_date='2018-06-20' group by city_num_id,style_num_id  having count(1)>1;

select city_num_id,style_num_id  from t_city_style_price_base where style_num_id=920857 and valid_date='2018-06-21' group by city_num_id,style_num_id  having count(1)>1;
select city_num_id,style_num_id  from t_city_style_price_base_20180621 where style_num_id=920857 and valid_date='2018-06-21' group by city_num_id,style_num_id  having count(1)>1;



select count(1) from t_daily_standard_price where valid_date='2018-06-22';

select count(1) from t_daily_shop_pmt_price_5 where valid_date='2018-06-22';



select count(1) from t_daily_standard_price where valid_date='2018-07-02';

select * from t_daily_standard_price where item_num_id=15006445 and valid_date='2018-07-02' limit 100;

select count(1) from (select item_num_id ,count(1) from t_daily_standard_price where valid_date='2018-07-02' group by item_num_id having count(1)=2) t;

select count(1) from (select item_num_id ,count(1) from t_daily_standard_price where valid_date='2018-07-03' group by item_num_id) t;




select * from  t_storage_record limit 100;

select * from t_storage_record limit 100;

select * from t_common_attribute;


select count(1) from t_ebiz_user where first_login_time>'2018-01-01';





select DATE_FORMAT(first_login_time,'%Y-%m'),count(1) from t_ebiz_user group by  DATE_FORMAT(first_login_time,'%Y-%m') order by DATE_FORMAT(first_login_time,'%Y-%m') ;

select * from t_ebiz_user where member_phone in (18957159108,18989460900) limit 100;
1619258

select * from t_member_buy_record  where member_id=1619258;



//商店信息
select  * from gb_cort_sub_unit;





























