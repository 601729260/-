select * from t_average_cost_price_Log where item_num_id=374396 and sid=1500000122;


select * from u_goods_stock_log where item_num_id=374396 and sid=1500000122;

select * from t_average_cost_price where item_num_id=374396 and sid=1500000122;





select count(1) from t_average_cost_price_Log

select * from t_average_cost_price_Log limit 100;

select a.sid,a.item_num_id,a.pre_avarage_cost_price,b.cost_price/100 ,a.pre_avarage_cost_price,case when a.pre_total_num<0 then 0 else a.pre_total_num end from  t_average_cost_price_log_20190402 a left join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.pre_avarage_cost_price>(b.cost_price/100)*1.1 and a.sid!=1
and b.cost_price/100

select a.sid,a.item_num_id,a.pre_avarage_cost_price,b.cost_price/100 ,a.pre_avarage_cost_price,case when a.pre_total_num<0 then 0 else a.pre_total_num end from  t_average_cost_price_log a left join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.pre_avarage_cost_price>(b.cost_price/100) 
and b.cost_price/100



select count(1) from t_average_cost_price_log;

select count(1) from t_average_cost_price;


drop table t_average_cost_price_log_20190402;
create table t_average_cost_price_log_20190402 as select * from t_average_cost_price_log;

select * from t_average_cost_price where item_num_id=195196;

select * from t_average_cost_price_log where item_num_id=1000000508 and sid=1;
select * from gb_share_item_ext where item_num_id=293848;
select * from wgn_init_average_price_result where  item_num_id=293848 and sid=1500000105;

delete from t_average_cost_price_Log where item_num_id=374430 and sid=1500000148;
update t_average_cost_price set avarage_cost_price=311.53,total_num=6,total_cost_price=1869.18  where item_num_id=374430 and sid=1500000148;
select * from t_average_cost_price where item_num_id=374430 and sid=1500000148;
select * from t_average_cost_price_Log where item_num_id=374430 and sid=1500000148 order by create_time;

select * from gb_share_item_ext where item_num_id=374465;

select * from gb_div_market_item limit 100;






select * from wgn_init_average_price_result where item_num_id=1000000779 and sid=1500000110;

select * from gb_share_item_ext where item_num_id=1000012725;

41878


select * from u_goods_stock_log where id=143040145928983;

select count(1) from u_goods_stock_log 




