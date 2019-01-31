select app_order_no from u_order where order_type=5 and order_state in (0,4,5,7) limit 1; ---领取

select order_no from u_order where order_type=5 limit 1; --- 下单 转单


select * from u_goods_stock_log limit 1;

select * from gb_cort_sub_unit limit 100;

select case a.qty_change>0 when true then '入库' when false then '出库' end  as '操作',b.order_no as '寄存单订单号' ,unit.sub_unit_name as '门店ID', item.BARCODE_1 as '条码' ,a.qty_change as '库存变化',date_format(a.create_time,'%Y%m%d') as '时间' from u_goods_stock_log  a
inner join gb_cort_sub_unit unit on a.sid=unit.sub_unit_num_id
left join gb_share_item item on a.item_num_id=item.item_num_id and item.is_deleted=0
inner join u_order  b on a.id=b.order_no  and b.order_type=5 
where 
#a.create_time>='2018-11-01 00:00:00'
#and 
a.create_time<='2018-10-31 23:59:59'  union all

select '出库' as '操作', b.order_no as '寄存单订单号' ,unit.sub_unit_name as '门店ID', item.BARCODE_1 as '条码' ,a.qty_change as '库存变化',date_format(a.create_time,'%Y%m%d') as '时间' from u_goods_stock_log  a
inner join gb_cort_sub_unit unit on a.sid=unit.sub_unit_num_id
left join gb_share_item item on a.item_num_id=item.item_num_id and item.is_deleted=0
inner join u_order  b on a.id=b.app_order_no and  b.order_type=5 and b.order_state in (0,4,5,7)
where 
#a.create_time>='2018-11-01 00:00:00'
#and 
a.create_time<='2018-10-31 23:59:59' ;


