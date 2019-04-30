select a.id as 单据编号,a.sid as 门店ID,a.create_time as 时间 ,a.item_num_id as sku,b.barcode_1 as  条码,a.pre_qty 变化前库存 ,a.qty_change as 库存变化量  
from  u_goods_stock_log a left join gb_share_item b 
on a.item_num_id=b.item_num_id  and b.is_deleted=0
where sid=1500000114 and b.barcode_1='7613035260207';

select * from u_goods_stock_log where id='MJCc1c1329f8fe8487';

select * from t_gb_stock where shop_id=1500000114 and item_num_id=374325

select * from u_goods_stock_log  where sid=1500000114 and item_num_id=374326

select * from t_gb_stock where shop_id=1500000114 and item_num_id=374325


select * from t_gb_stock_20181130 limit 1;



#----------- 限定item_num_id
select a.sid,a.item_num_id,a.pre_qty,b.qty_change,c.qty ,c.qty-(a.pre_qty+b.qty_change) as cha from u_goods_stock_log a left join 
(select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log where item_num_id= 374326 group by sid,item_num_id) b on a.sid=b.sid and a.item_num_id=b.item_num_id
left join t_gb_stock c on a.sid=c.shop_id and a.item_num_id=c.item_num_id
where seq_id in(
select seq_id from (select sid,item_num_id,min(seq_id) as seq_id from u_goods_stock_log where  item_num_id=374326 group by sid,item_num_id) a ) 
and a.pre_qty+b.qty_change!=c.qty

#-------------限定sid
select a.sid,a.item_num_id,a.pre_qty,b.qty_change,c.qty ,c.qty-(a.pre_qty+b.qty_change),(c.qty-(a.pre_qty+b.qty_change))*d.cost_price/100 as cha from u_goods_stock_log a left join 
(select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log where sid= 1500000114 group by sid,item_num_id) b on a.sid=b.sid and a.item_num_id=b.item_num_id
left join t_gb_stock c on a.sid=c.shop_id and a.item_num_id=c.item_num_id
left join gb_share_item_ext d on a.item_num_id=d.item_num_id
where seq_id in(
select seq_id from (select sid,item_num_id,min(seq_id) as seq_id from u_goods_stock_log where  sid=1500000114 group by sid,item_num_id) a ) 
and a.pre_qty+b.qty_change!=c.qty
order by (c.qty-(a.pre_qty+b.qty_change))*d.cost_price/100 










