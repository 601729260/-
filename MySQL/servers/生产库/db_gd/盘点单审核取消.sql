create table u_goods_stock_log_20190630 as  select * from u_goods_stock_log where id in ('MMH2019063010070630','MMH2019063010070633');
create table t_gb_stock_pd_20190630 as 
select * from t_gb_stock a left join   u_goods_stock_log b 
on a.storage_id=b.sid and a.item_num_id=b.item_num_id
where b.id in ('MMH2019063010070630','MMH2019063010070633');

update t_gb_stock a left join  u_goods_stock_log b 
on a.storage_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=a.qty-b.qty_change,a.p_qty=a.p_qty-b.p_qty_change
where b.id='MMH2019063010070630';


update t_gb_stock a left join  u_goods_stock_log b 
on a.storage_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=a.qty-b.qty_change,a.p_qty=a.p_qty-b.p_qty_change
where b.id='MMH2019063010070633';

# 刷新redis的sql
select * from t_gb_stock a left join   u_goods_stock_log b 
on a.storage_id=b.sid and a.item_num_id=b.item_num_id
where b.id in ('MMH2019063010070630','MMH2019063010070633');

select * from u_stock_log where id in ('MMH2019063010070630','MMH2019063010070633');

update u_stock_log a
set a.status=0
where a.id in ('MMH2019063010070630','MMH2019063010070633');

delete from u_goods_stock_log   where id in ('MMH2019063010070630','MMH2019063010070633');
