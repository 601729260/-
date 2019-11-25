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




select * from u_goods_stock_log where id='MPOS153220122277160';
delete from  u_goods_stock_log where seq_id=2750713;
delete from u_order_deposit where id=128451;

INSERT INTO `db_gd`.`u_goods_stock_log`(`seq_id`, `id`, `item_num_id`, `style_num_id`, `create_time`, `style_code`, `style_title`, `price`, `total_price`, `sid`, `sid_name`, `sid_type`, `pre_qty`, `pre_p_qty`, `qty_change`, `p_qty_change`, `staff_id`, `staff_name`, `user_id`, `user`, `operate_type`, `pre_seq_id`, `one_value`, `bill_type`, `cost_price`, `purchase_price`)
VALUES (2750713, 'MPOS153220122277160', 1000000165, NULL, '2019-09-22 16:02:38', NULL, NULL, NULL, NULL, 1500000106, '唯小宝苏州甪直店', 2, 4, 0, -3, 0, NULL, '彭为', NULL, NULL, 3, NULL, NULL, 200005, 328.19, NULL);


INSERT INTO `db_gd`.`u_order_deposit`(`id`, `order_no`, `order_line_id`, `good_item_id`, `good_item_name`, `receive`, `count`, `created_time`, `operator_id`, `operator_name`)
VALUES (128451, 'MPOS153220122277160', 4283643, 1000000165, '卡洛塔妮2段900g-羊奶', 1, 3, '2019-09-22 16:02:38', 134, '彭为');

select * from u_order where order_no='MPOS153220122277160';


update u_goods_stock_log set item_num_id=1000003021 where seq_id=2338637;

select  * from t_deposit_order  where member_id='1792801' limit 100;

SELECT * FROM u_order_deposit WHERE order_no = 'MPOS153220122277160' order by created_time desc

select * from u_order_line where order_no='MPOS153220122277160';


select * from t_order where order_no='MPOS153220122277160';
select * from t_order_line where order_no='MPOS153220122277160';
select * from u_order_deposit where order_no='MPOS153220122277160' ;
select * from  u_refund_basic where order_no='MPOS153220122277160' ;
select * from u_refund_goods where refund_no='MPOS153220122277160';


        SELECT t.order_no,t.order_line_id,t.good_item_name,t.good_item_id,t.pre_allocated_count count ,t.is_gift is_gift ,t.u_order_line_id u_order_line_id, u.counts receiveCount,u.created_time created_time FROM (
          (SELECT ol.order_no,ol.order_line_id,ol.good_item_id,ol.good_item_name,ol.pre_allocated_count,ol.is_gift,u_order_line_id FROM t_order_line ol
           WHERE  ol.order_no ='MPOS153220122277160' AND ol.item_type=3) t LEFT JOIN
          (SELECT order_line_id,SUM(COUNT) counts,created_time FROM u_order_deposit WHERE order_no ='MPOS153220122277160' GROUP BY order_line_id) u ON t.order_line_id =u.order_line_id
          );
		
SELECT * FROM u_order_deposit WHERE order_no ='MPOS153220122277160';


update u_order_deposit set order_line_id=4283642 where id=128452;




