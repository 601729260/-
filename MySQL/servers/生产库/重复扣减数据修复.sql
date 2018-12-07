select id,sid,item_num_id,qty_change,count(1) from u_goods_stock_log group by id,sid,item_num_id,qty_change  having count(1)=2;



create table u_goods_stock_log_bak20181129 as select * from u_goods_stock_log;

create table t_gb_stock_bak2018112902 as select * from t_gb_stock a where a.storage_id=1800000080;
create table wgn_u_goods_stock_tmp as select * from u_goods_stock_log_bak20181129;


select distinct sid from 
(select id,sid,item_num_id,qty_change,count(1),min(seq_id) as seq_id from u_goods_stock_log where  substr(id,1,3)='MMH' and qty_change>0 group by id,sid,item_num_id,qty_change  having count(1)>1) a;




drop table wgn_u_goods_tmp1;
create table wgn_u_goods_tmp1 as 
select id,sid,item_num_id,qty_change,count(1),min(seq_id) as seq_id from u_goods_stock_log where  substr(id,1,3)='MMH' and qty_change>0 group by id,sid,item_num_id,qty_change  having count(1)>1;

update t_gb_stock a
inner join wgn_u_goods_tmp1 b
on a.shop_id=b.sid
and a.item_num_id=b.item_num_id
set a.qty=a.qty-b.qty_change
where shop_id in (1500000112,
1500000104,
1500000138,
1500000116,
1500000106,
1500000108,
1500000107,
1500000133,
1500000121,
1500000119,
1500000132,
1500000140,
1500000147,
1500000126);


delete from u_goods_stock_log where seq_id in (select seq_id from wgn_u_goods_tmp1);



update t_gb_stock a
inner join wgn_u_goods_tmp1 b
on a.storage_id=b.sid
and a.item_num_id=b.item_num_id
set a.p_qty_change=a.p_qty_change-b.p_qty_change
where a.storage_id=1800000080;




