
#列表查询sql

SELECT
	m.order_no,
	m.created_time,
	m.delivery_way,
	m.order_state,
	m.sub_type,
	m.member_name,
	m.member_phone,
	m.consignee_phone,
	m.platform_source,
	m.deposit_status,
	m.refund_state,
	m.tml_num_id,
	m.delivery_time,
	t.pay_price + t.sub_pay_price pay_price 
FROM
	(
	SELECT 
		o.order_no,
		o.created_time,
		o.delivery_way,
		o.order_state,
		o.sub_type,
		o.member_name,
		tm.member_phone,
		o.consignee_phone,
		o.platform_source,
		o.deposit_status,
		o.refund_state,
		o.tml_num_id,
		o.delivery_time 
	FROM
		`t_order` o
		LEFT JOIN t_ebiz_user tm ON o.member_id = tm.member_id 
	WHERE
		created_time > '2018-09-10 00:00:00' 
		AND o.order_source = 3 
		AND o.order_type = 10 
		AND o.deposit_status IN ( 1, 2, 3 ) 
		AND o.shop_id = 1500000142 
		AND o.parent_order_no IS NOT NULL 
	ORDER BY
		created_time DESC 
		LIMIT 0,
		10 
	) m
	INNER JOIN `t_order_pay` t ON m.order_no = t.order_no 
	
#退货数量查询
	
	       SELECT
        IFNULL(SUM(goods.item_count), 0) count,
        SUM(IF(basic.pick_up_flag=1,goods.item_count,0)) AS receiveCount,
        SUM(IF(basic.pick_up_flag=0,goods.item_count,0)) AS refund_goods_count
        FROM
        u_refund_basic basic
        LEFT JOIN u_refund_goods goods ON basic.refund_no = goods.refund_no
        WHERE
        basic.refund_status = 0
        AND basic.order_no='MPOS153230161134776test' 
				GROUP BY basic.order_no
		
		    SELECT
        IFNULL(SUM(goods.item_count), 0) count,
        SUM(IF(basic.pick_up_flag=1,goods.item_count,0)) AS receiveCount,
        SUM(IF(basic.pick_up_flag=0,goods.item_count,0)) AS refund_goods_count
        FROM
        u_refund_basic basic
        LEFT JOIN u_refund_goods goods ON basic.refund_no = goods.refund_no
        WHERE
        basic.refund_status = 0
        AND basic.order_no='MPOS144240608550389' 
				GROUP BY basic.order_no,
				goods.item_id
				
				
				select * from t_order where order_no='MPOS144240608550389' ;
				
				
				
						       SELECT *
        FROM
        u_refund_basic basic
        LEFT JOIN u_refund_goods goods ON basic.refund_no = goods.refund_no
        WHERE
        basic.refund_status = 0
        AND basic.order_no='MPOS144240608550389' 
				GROUP BY basic.order_no
				
				
				MPOS144240608550389
				
				select * from 
				
				
# 订单行查询

select * from t_order_line where order_no='MPOS152110121999604';



				
select * from gb_share_item where barcode_1=8712045031735;

374464
				
				
				SELECT *
        FROM
        u_refund_basic basic
        LEFT JOIN u_refund_goods goods ON basic.refund_no = goods.refund_no
        WHERE
        basic.refund_status = 0
        AND basic.order_no='MPOS144240608550389' 



# 修复数据
select * from t_order where order_no='MPOS150260115205178';
select * from t_order_line where order_no='MPOS150260115205178';
select * from u_order_deposit where order_no='MPOS150260115205178' ;
select * from  u_refund_basic where order_no='MPOS144240608550389' ;
select * from u_refund_goods where refund_no='TH144310302215097';
update u_refund_basic set pick_up_flag=1 where order_no='MPOS144240608550389' ;
update u_order_deposit set count=1 where id=16873;
update u_order_deposit set count=2 where id=16874;

update u_order_deposit set good_item_id=1000003021 ,order_line_id=3904141,good_item_name='优优马骝特大宽口防胀气母乳奶嘴（V）'  where id=112274;
	
	INSERT INTO `db_gd`.`u_order_deposit`(`order_no`, `order_line_id`, `good_item_id`, `good_item_name`, `receive`, `count`, `created_time`, `operator_id`, `operator_name`) 
	VALUES ('MPOS144240608550389', 2936907, 1000000911, '巴蓓一夜无忧XL44片拉拉裤', 1, 4, '2018-12-24 16:45:11', 229, '赵艳');

select * from t_order_line where order_no='MPOS144240608550389'


#修复数据
INSERT INTO `db_gd`.`u_order_deposit`(`id`, `order_no`, `order_line_id`, `good_item_id`, `good_item_name`, `receive`, `count`, `created_time`, `operator_id`, `operator_name`) 
VALUES (110669, 'MPOS152110121999604', 4094230, 1100007522, '91LALING四季成人绒毛毯', 1, 1, '2019-08-11 20:01:46', 90, '莫静');
delete from u_order_deposit where id=110669;



select * from t_stock_ext where item_num_id=1100007522 and sid=1500000113 limit 100;

update t_stock_ext set deposit_qty=0 where item_num_id=1100007522 and sid=1500000113


update t_stock_ext set deposit_qty=0  where item_num_id=1000003020 and sid=1500000110

1500000113  1100007522

select * from  u_order_deposit b left join t_order a  on a.order_no=b.order_no and b.good_item_id=1100007522 and a.shop_id=1500000113;


select * from t_stock_ext a  where deposit_qty<0;


update t_stock_ext set deposit_qty=0 where seri_num=5187;