---------------------------------------------------------------------

create table u_goods_stock_log_20190610 as 
select * from u_goods_stock_log where seq_id in (
'1640562',
'1644166',
'1641940',		
'1641941',		
'1640891', 
'1640892', 
'1640893', 
'1640894', 
'1640895', 
'1640896', 
'1644167', 
'1644168', 
'1644169', 
'1644170', 
'1644171', 
'1644172',
'1451833',
'1609444');

delete from u_goods_stock_log where seq_id in (
'1640562',
'1644166',
'1641940',		
'1641941',		
'1640891', 
'1640892', 
'1640893', 
'1640894', 
'1640895', 
'1640896', 
'1644167', 
'1644168', 
'1644169', 
'1644170', 
'1644171', 
'1644172',
'1609444');
update u_goods_stock_log set operate_type=3 where seq_id=1451833;


-----------------------------------------------------------------------------

select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100011255;

select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100011255;




select  concat("update t_gb_stock set qty=qty-(",a.qty-ifnull(b.qty,0)-ifnull(c.qty_change,0),') where shop_id=',a.shop_id,' and item_num_id=',a.item_num_id,';') from t_gb_stock a left join t_gb_stock_20190129 b on a.shop_id=b.shop_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log c where c.create_time>='2019-01-30 00:00:00'  and sid_type=2  group by sid,item_num_id) c
on a.shop_id=c.sid and a.item_num_id=c.item_num_id
where a.shop_id > 150000000  and a.shop_id!=1500000150
and  a.qty!=ifnull(b.qty,0)+ifnull(c.qty_change,0) ;



#检查仓库是否有异常库存
select a.storage_id,a.item_num_id,(a.qty+a.p_qty) as total_qty,ifnull(c.total_qty_change,0),ifnull(b.qty+b.p_qty,0) bak_qty,a.qty+a.p_qty-ifnull(b.qty+b.p_qty,0)-ifnull(c.total_qty_change,0) from t_gb_stock a left join t_gb_stock_20190129 b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change+p_qty_change) as total_qty_change from u_goods_stock_log c where c.create_time>='2019-01-30 00:00:00'  and sid_type=3  and bill_type!=3  or (bill_type=3 and operate_type=5) group by sid,item_num_id) c
on a.storage_id=c.sid and a.item_num_id=c.item_num_id
where a.storage_id in(1800000080)
and  a.qty+a.p_qty!=ifnull(b.qty+b.p_qty,0)+ifnull(c.total_qty_change,0) ;


update t_gb_stock set qty=qty-1 where storage_id=1800000080 and item_num_id=1100011255;
update t_gb_stock set qty=qty-(-1) where shop_id=1500000105 and item_num_id=156495;
update t_gb_stock set qty=qty-(-1) where shop_id=1500000105 and item_num_id=156497;
update t_gb_stock set qty=qty-(2) where shop_id=1500000112 and item_num_id=429806;
update t_gb_stock set qty=qty-(2) where shop_id=1500000112 and item_num_id=20000638;
update t_gb_stock set qty=qty-(2) where shop_id=1500000112 and item_num_id=1000002259;
update t_gb_stock set qty=qty-(6) where shop_id=1500000112 and item_num_id=1000002260;
update t_gb_stock set qty=qty-(2) where shop_id=1500000112 and item_num_id=1100002591;
update t_gb_stock set qty=qty-(2) where shop_id=1500000112 and item_num_id=1100002595;
update t_gb_stock set qty=qty-(1) where shop_id=1500000126 and item_num_id=1100009144;
update t_gb_stock set qty=qty-(7) where shop_id=1500000126 and item_num_id=1100012131;
update t_gb_stock set qty=qty-(-1) where shop_id=1500000128 and item_num_id=1000002577;
update t_gb_stock set qty=qty-(14) where shop_id=1500000133 and item_num_id=1100012131;








