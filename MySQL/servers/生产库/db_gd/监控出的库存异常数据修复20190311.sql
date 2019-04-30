select * from t_order where order_no='14628128534';

select * from t_order_line where order_no='14628128534';

select * from u_goods_stock_log where id='14625120983';

select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100006716;


select * from u_goods_stock_log where id='TH147090310438201';

select * from t_refund_line where refund_line_no='TH147090310438201';

select * from t_refund_detail where rd_refund_no='TH147090310438201';

select a.rd_refund_no as order_no ,rd_item_id as item_num_id, rd_real_qty  as qty_change from  
t_refund_detail a inner join t_refund_line b on a.rd_refund_no=b.refund_line_no 
inner join t_order c on b.order_no=c.order_no  
where (b.status in (3,4,9) or b.exchange_status in (6,7,8)) 
and  c.order_source=3 
and c.dealing_type not in(5,4)  
and a.rd_create_time>'2019-01-29 00:00:00'
and rd_refund_no='TH147090310438201') xx
group by order_no,item_num_id


select * from  t_gb_stock  where shop_id=1500000115 and item_num_id=1100006368;

select * from u_goods_stock_log where sid=1500000108 and item_num_id=1000011726;


select * from t_gb_stock_20190201 where shop_id=1500000108 and item_num_id=1000011726;

select * from t_gb_stock_20190308 where storage_id=1800000080 and item_num_id=1000011726;


select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100006716;

select * from  u_goods_stock_log where sid=1800000080 and item_num_id=1100006716;








select * from 

select * from u_stock_log_detail where id='MMH2019022110033258' and  item_num_id=1000001448;


---------------------------- 删除异常的测试数据 ----------------------------------------

delete from  u_refund_basic where refund_no in ('MTH147080312479429',
'MTH147080336591300',
'MTH147080356584100');



select * from t_stock


---------------------------- 订单重复提交多扣库存返还

stock:sid:1500000115:sku:1100006368
create table u_goods_stock_log_MPOS147060649772431 as select * from u_goods_stock_log where id='MPOS147060649772431';
delete from u_goods_stock_log where seq_id=919381;
update t_gb_stock set qty=qty+10 where shop_id=1500000115 and item_num_id=1100006368;
update t_gb_stock_20190306 set qty=qty+10 where shop_id=1500000115 and item_num_id=1100006368;
update t_gb_stock_20190307 set qty=qty+10 where shop_id=1500000115 and item_num_id=1100006368;
update t_gb_stock_20190308 set qty=qty+10 where shop_id=1500000115 and item_num_id=1100006368;
update t_gb_stock_20190309 set qty=qty+10 where shop_id=1500000115 and item_num_id=1100006368;
update t_gb_stock_20190310 set qty=qty+10 where shop_id=1500000115 and item_num_id=1100006368;


--------------------------- 删除调拨单重复明细-----------
create table u_goods_stock_log_MMH2019022110033258 as select * from u_goods_stock_log where id='MMH2019022110033258';
delete from u_goods_stock_log where seq_id=833539;
create table u_stock_log_detail_MMH2019022110033258 as select * from u_stock_log_detail where id='MMH2019022110033258';
delete from u_stock_log_detail where seq_id=109450672;


-----------------------------订单维护发货------------------------

stock:sid:1800000080:sku:1100006716

INSERT INTO `db_gd`.`u_goods_stock_log`( `id`, `item_num_id`, `create_time`, `sid`, `sid_name`, `sid_type`,  `qty_change`, `p_qty_change`, `operate_type`,  `bill_type`) 
select a.order_no,'1100006716',a.delay_receipt_time,1800000080,'唯小宝门店仓',3,-1,0,100002,100001 from t_order  a where order_no in (
'14625120983',  
'14625122320',  
'14625122536',  
'14625127486',  
'14625127812',  
'14628120533',  
'14628121117',  
'14628121279',  
'14628122577',  
'14628122712',  
'14628124221',  
'14628124289',  
'14628126576',  
'14628126642',  
'14628128377',  
'14628128534'  
);


update t_gb_stock set qty=qty-16 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190304  set qty=qty-5 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190305  set qty=qty-5 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190306  set qty=qty-5 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190307  set qty=qty-5 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190308  set qty=qty-16 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190309  set qty=qty-16 where storage_id=1800000080 and item_num_id=1100006716;
update t_gb_stock_20190310  set qty=qty-16 where storage_id=1800000080 and item_num_id=1100006716;



------------------------------------------------------------------------


