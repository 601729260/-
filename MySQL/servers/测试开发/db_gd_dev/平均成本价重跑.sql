

select * from wgn_init_average_price where item_num_id is  null;

create table wgn_init_average_price_bak as select * from wgn_init_average_price;
select replace(replace(barcode,'.',''),'e+16','') from wgn_init_average_price where barcode  like '%e+%';



select * from wgn_init_average_price where barcode not   like '%e+%' and barcode like '%.0%';
select replace(barcode,'.0','') from wgn_init_average_price where barcode not   like '%e+%' and barcode like '%.0%';



update wgn_init_average_price set barcode=replace(barcode,'.0','')  where barcode not   like '%e+%' and barcode like '%.0%';
update wgn_init_average_price set barcode=replace(replace(barcode,'.',''),'e+16','') where barcode like '%e+%';

update wgn_init_average_price a
left join gb_share_item  b on a.barcode=b.barcode_1 and b.IS_DELETED=0;
set a.item_num_id=b.item_num_id;



-------------------------------------执行重跑的脚本-----------------------------


-- update u_goods_stock_log a  
-- left join u_stock_log_detail b on  a.id=b.id and a.item_num_id=b.item_num_id
-- set a.cost_price=b.cost_price,a.purchase_price=b.purchase_price;

#将item_num_id 更新上去
update wgn_init_average_price  a 
left join gb_share_item b on a.barcode=b.barcode_1 
set a.item_num_id=b.item_num_id
where b.is_deleted=0;

drop table wgn_init_average_price_result;
create table  wgn_init_average_price_result as select * from wgn_init_average_price where item_num_id is not null;

create index index_item_sid on wgn_init_average_price_result(item_num_id,sid);
create index index_item_sid on u_goods_stock_log(item_num_id,sid);

update u_goods_stock_log a 
inner join wgn_init_average_price_result  b on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.cost_price=b.average_cost_price
where a.cost_price is null 
and a.sid!=1800000080;

update u_goods_stock_log a 
inner join wgn_init_average_price_result  b on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.purchase_price=b.average_cost_price
where a.purchase_price is null 
and a.sid=1800000080;

update u_goods_stock_log b 
inner join gb_share_item_ext a on a.item_num_id=b.item_num_id
set b.cost_price=a.cost_price/100
where b.cost_price is null;


update u_goods_stock_log b 
inner join gb_share_item_ext a on a.item_num_id=b.item_num_id
set b.purchase_price=a.purchase_price/100
where b.purchase_price is null;



update  u_goods_stock_log set cost_price=0 where cost_price is null;


update u_goods_stock_log set purchase_price=0 where purchase_price is null;

update u_goods_stock_log set sid_type=3 where sid in (1800000080,1800000088);




update  u_goods_stock_log set bill_type=300001 where bill_type is null;




truncate table t_average_cost_price;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,avarage_cost_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,2 from wgn_init_average_price_result b where b.sid!=1800000080;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,avarage_purchase_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,3 from wgn_init_average_price_result b where b.sid=1800000080;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b where b.sid!=1800000080 group by item_num_id;

update t_average_cost_price a 
inner join 
(select 1 as sid,item_num_id,sum(total_cost_price) as total_purchase_price,sum(qty) as total_purchase_num from wgn_init_average_price_result b where b.sid=1800000080 group by item_num_id) b
on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.total_purchase_price=b.total_purchase_price ,a.total_purchase_num=b.total_purchase_num 
where a.sid=1;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b
where b.sid=1800000080  and not exists(select 1 from t_average_cost_price  a where a.sid=1 and a.item_num_id=b.item_num_id) group by item_num_id;

update t_average_cost_price a  set avarage_cost_price=total_cost_price/total_num where total_num!=0 and sid=1;
update t_average_cost_price a set avarage_purchase_price=total_purchase_price/total_purchase_num where total_purchase_num!=0 and sid=1;

update  t_average_cost_price set avarage_cost_price=0 where avarage_cost_price is null;

update  t_average_cost_price set avarage_purchase_price=0 where avarage_purchase_price is null;

truncate table t_average_cost_price_log;




select  * from GB_SHARE_ITEM limit 100;

select * from GB_SHARE_ITEM  limit ;


select gb_brand_num_id,count(1)  from GB_SHARE_ITEM group by  gb_brand_num_id;

select * from GB_SHARE_ITEM where mmh_id is null;



select count(1) from GB_SHARE_ITEM ;



select * from  t_style_stock limit 100;

alter table t_style_stock add mmh_id bigint(18);







