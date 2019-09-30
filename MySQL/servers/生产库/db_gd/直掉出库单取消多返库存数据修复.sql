
select concat('delete from u_goods_stock_log  where id=''',id,''' and item_num_id=',item_num_id,';') from (
select id,item_num_id ,sum(qty_change) from u_goods_stock_log 
where bill_type=1 and operate_type in (7,5) 
and sid_type=2
and create_time>'2019-06-01 00:00:00' 
group by id,item_num_id having sum(qty_change)>0)
b 


select distinct id from (
select id,item_num_id ,sum(qty_change) from u_goods_stock_log 
where bill_type=1 and operate_type in (7,5) 
and sid_type=2
and create_time>'2019-06-01 00:00:00' 
group by id,item_num_id having sum(qty_change)>0)
b 


select * from u_goods_stock_log limit 100;
create table u_goods_stock_log_20190910 as select * from u_goods_stock_log where id in ('MMH2019051310058344',  
'MMH2019052910062600',  
'MMH2019052910062758',  
'MMH2019081710082464',  
'MMH2019082210084118',  
'MMH2019082510084870',  
'MMH2019082710085377',  
'MMH2019090910088798',  
'MMH2019090910088846'  
);


select * from u_goods_stock_log_20190910;
select * from u_stock_log where id in 
('MMH2019051310058344',  
'MMH2019052910062600',  
'MMH2019052910062758',  
'MMH2019081710082464',  
'MMH2019082210084118',  
'MMH2019082510084870',  
'MMH2019082710085377',  
'MMH2019090910088798',  
'MMH2019090910088846'  
);



delete from u_goods_stock_log  where id='MMH2019081710082464' and item_num_id=677332;
delete from u_goods_stock_log  where id='MMH2019082210084118' and item_num_id=428292;
delete from u_goods_stock_log  where id='MMH2019082510084870' and item_num_id=1100017782;
delete from u_goods_stock_log  where id='MMH2019082510084870' and item_num_id=1100017784;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018931;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018932;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018933;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018934;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018935;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018936;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018938;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018939;
delete from u_goods_stock_log  where id='MMH2019082710085377' and item_num_id=1100018940;
delete from u_goods_stock_log  where id='MMH2019090910088798' and item_num_id=1000000401;
delete from u_goods_stock_log  where id='MMH2019090910088846' and item_num_id=374464;