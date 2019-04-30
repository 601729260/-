#company_pmt_price不同的数据

drop table t_city_style_price_base_cy_2;
create table t_city_style_price_base_cy_2 
as select * from 
(select style_num_id		,city_num_id	,company_pmt_price	,	standard_price,valid_date	from t_city_style_price_base_bak union all 
select style_num_id		,city_num_id	,company_pmt_price	,standard_price	,valid_date	from t_city_style_price_base_20180619 where valid_date='2018-06-20') t
group by style_num_id		,city_num_id	,company_pmt_price	,standard_price	,valid_date	having count(1)=1;
	

select count(1) from t_city_style_price_base_cy_2;

create index wgn_index_tmp on t_city_style_price_base_cy_2(city_num_id,style_num_id);
delete from t_city_style_price_base_cy_1 where exists(select 1 from t_city_style_price_base_cy_2 t2 where t_city_style_price_base_cy_1.city_num_id=t2.city_num_id and t_city_style_price_base_cy_1.style_num_id=t2.style_num_id);

#只关注min_price取差集，限定style_num_id
drop table t_city_style_price_base_cy_1;
create table t_city_style_price_base_cy_1 
as select * from 
(select style_num_id		,city_num_id	,min_price	,	standard_price,valid_date	from t_city_style_price_base_bak where style_num_id=807571 union all 
select style_num_id		,city_num_id	,min_price	,standard_price	,valid_date	from t_city_style_price_base_20180619 where valid_date='2018-06-20' and style_num_id=807571) t
group by style_num_id		,city_num_id	,min_price	,standard_price	,valid_date	having count(1)=1;
	

#只关注min_price取差集
drop table t_city_style_price_base_cy_1;
create table t_city_style_price_base_cy_1 
as select * from 
(select style_num_id		,city_num_id	,min_price	,	standard_price,valid_date	from t_city_style_price_base_bak union all 
select style_num_id		,city_num_id	,min_price	,standard_price	,valid_date	from t_city_style_price_base_20180619 where valid_date='2018-06-20') t
group by style_num_id		,city_num_id	,min_price	,standard_price	,valid_date	having count(1)=1;
	
select count(1) from t_city_style_price_base_cy_1;

#删除缺少的数据
drop table wgn_city_price_tc1;
create table wgn_city_price_tc1
select city_num_id,style_num_id from t_city_style_price_base_cy_1
group by city_num_id,style_num_id  having count(1)=1;
select count(1) from wgn_city_company_price_tc1;
create index wgn_index_tmp on wgn_city_price_tc1(city_num_id,style_num_id);
delete from t_city_style_price_base_cy_1 where exists(select 1 from wgn_city_price_tc1 t2 where t_city_style_price_base_cy_1.city_num_id=t2.city_num_id and t_city_style_price_base_cy_1.style_num_id=t2.style_num_id);


select concat('select * from t_city_style_price_base_cy_1 where city_num_id=',city_num_id,' and style_num_id=',style_num_id,' limit 100;
select * from t_city_style_price_base_bak where city_num_id=',city_num_id,' and style_num_id=',style_num_id,' limit 100;
select * from t_city_style_price_base_20180619 where city_num_id=',city_num_id,' and style_num_id=',style_num_id,' and valid_date=''2018-06-20''limit 100;
') from t_city_style_price_base_cy_1 limit 100;

select * from t_city_style_price_base_cy_1 where city_num_id=420100 and style_num_id=913498 limit 100;
select * from t_city_style_price_base_bak where city_num_id=420100 and style_num_id=913498 limit 100;
select * from t_city_style_price_base_20180619 where city_num_id=420100 and style_num_id=913498 and valid_date='2018-06-20' limit 100;

select * from t_operational_price_20180619 where style_num_id=923021  and shop_id=52391;
select * from t_shop_style_price_base_20180619 where  style_num_id=923021 and shop_id=52391;
select * from t_daily_company_pmt_price_20180619 where style_num_id=923021;
select * from gb_city_area_20180619 where city_num_id=110100;

create index wgn_index_tmp on t_city_style_price_base_cy_1(city_num_id,style_num_id);
select distinct shop_id from t_city_style_price_base_20180619 where  valid_date='2018-06-20' and exists(select 1 from t_city_style_price_base_cy_1 t2 where t_city_style_price_base_20180619.city_num_id=t2.city_num_id and t_city_style_price_base_20180619.style_num_id=t2.style_num_id) limit 100;

create index wgn_index_tmp1 on wgn_city_price_tc1(city_num_id,style_num_id);
select distinct shop_id from t_city_style_price_base_20180619 where  valid_date='2018-06-20' and exists(select 1 from wgn_city_price_tc1 t2 where t_city_style_price_base_20180619.city_num_id=t2.city_num_id and t_city_style_price_base_20180619.style_num_id=t2.style_num_id) limit 100;

67751
37351
52572
52571
67762
90000103
select * from t_city_style_price_base_20180619 where shop_id=90000103 and valid_date='2018-06-20' and exists(select 1 from wgn_city_price_tc1 t2 where t_city_style_price_base_20180619.city_num_id=t2.city_num_id and t_city_style_price_base_20180619.style_num_id=t2.style_num_id) limit 100;


#company 不同

select count(1) from t_city_style_price_base_cy_1 union all 
select count(1) from t_city_style_price_base_bak union all 
select count(1) from t_city_style_price_base_20180619 where valid_date='2018-06-20';

#限定style_num_id
select count(1) from t_city_style_price_base_cy_1 where style_num_id=807571 union all 
select count(1) from t_city_style_price_base_bak where style_num_id=807571 union all 
select count(1) from t_city_style_price_base_20180619 where valid_date='2018-06-20' and style_num_id=807571;





select * from t_shop_style_price_base_bak where style_num_id=181042;
select * from t_shop_style_price_base_20180619 where style_num_id=181042 and valid_date='2018-06-20';

select * from t_daily_country_pmt_price_bak where style_num_id=26032;