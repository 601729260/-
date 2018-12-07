SELECT o.order_batch_no, o.logic_relative_no, o.order_no, o.serial_number, o.order_state, o.order_type, o.sub_type, o.order_source, o.relation_type, o.parent_order_no, o.split_from_no, o.split_flag, o.member_id, o.member_name, o.shop_id, o.shop_name, o.shop_province, o.shop_city, o.shop_county, o.company_id, o.warehouse_type, o.warehouse_id, o.warehouse_name, o.address, o.province, o.city, o.county, o.dealing_type, o.consignee_name, o.consignee_phone, o.delivery_way, o.created_time, o.payment_time, o.modified_time, o.delivery_time, o.confirm_good_time, o.delay_receipt_time, o.delay_receipt_day, o.finish_time, o.cancel_time, o.expire_time, o.invoice_type, o.invoice_title, o.remark, o.tml_num_id, o.virtual_store_id, o.pick_type, o.pick_shop_id, o.platform_source, o.deliver_prv_id, o.receipt_prv_id, o.refund_state, o.shift_status, o.addrId, o.cust_store_id, o.`pay_lock_type`, o.inspect_refuse_type, o.old_order_no, o.choose_home, o.buyer_remark, o.cancel_remark, op.pay_total_price, op.pay_price, op.pay_freight_price, op.redu_pay_freight_price, op.install_price, op.redu_install_price, op.pay_coupon_price, op.pay_mbean_price, op.pay_mbean_count, op.pay_mothercare_price, op.pay_mothercare_count, op.pay_gb_price, op.pay_gb_count, op.get_integral, op.coupon_id, op.pay_type_id, op.pay_account, op.pay_shop_price, op.distribution_section, op.pmt_all_reduce_price, op.pmt_part_reduce_price, op.pmt_group_price, op.pmt_buy_more_price, op.pmt_sale_price, op.pay_wechat_card_coupon_qrcode, op.pay_vip_reduce_price, op.refund_amount, op.pay_group_coupon_price, op.pay_mmh_coupon_price, op.pmt_purchase_price, op.pmt_random_reduce_cost, op.pmt_random_reduce_price FROM t_order as o LEFT JOIN t_order_pay op ON op.order_no = o.order_no WHERE 1=1 AND o.parent_order_no IS NOT NULL AND (o.order_no = ? OR parent_order_no in (SELECT temp.order_no FROM t_order AS temp WHERE temp.parent_order_no IS NULL AND temp.order_batch_no = ? )) ORDER BY o.created_time DESC limit ?,? 
2018-08-22 17:26:48.526 DEBUG 9280 --- [tp2138104388-57] nsOrderOptimizing.queryChildOrderList    : ==> Parameters: 140220177360458(String), 140220177360458(String), 0(Integer), 10(Integer)
2018-08-22 17:26:48.641 DEBUG 9280 --- [tp2138104388-57] nsOrderOptimizing.queryChildOrderList    : <==      Total: 1


SELECT
	*
FROM
	t_order AS o
	LEFT JOIN t_order_pay op ON op.order_no = o.order_no 
WHERE
	1 = 1 
	AND o.parent_order_no IS NOT NULL 
	AND (
		o.order_no = 140220177360458 
		OR parent_order_no IN ( SELECT temp.order_no FROM t_order AS temp WHERE temp.parent_order_no IS NULL AND temp.order_batch_no = 140220177360458 ) 
	) 
ORDER BY
	o.created_time DESC ；
	
	 SELECT
*
FROM
	t_order o
	LEFT JOIN t_order_pay op ON o.order_no = op.order_no 
WHERE
	o.order_no = 140220177360458  ;

	
	SELECT
	*
FROM
	t_order_line ol 
WHERE
	ol.order_no = 140220177360458 ;

 
 SELECT
	rl.* 
FROM
	t_refund_line rl 
WHERE
	rl.real_order_line_id = 2335502 
	AND ( rl.refund_type IN ( 1, 4 ) OR ( rl.refund_type = 2 AND rl.STATUS != 10 ) ) 
	AND rl.refused_flag IN ( 0, 1 ) 
ORDER BY
	rl.refund_line_id DESC ;
	
	

	SELECT
*
FROM
	GB_CORT_SUB_UNIT AS sub
	LEFT JOIN gb_div AS tdiv ON sub.MG_UNIT_NUM_ID = tdiv.DIV_NUM_ID 
WHERE
	sub.SUB_UNIT_NUM_ID = 38948 ;
	
	SELECT
	po.order_batch_no 
FROM
	t_order co
	LEFT JOIN t_order po ON co.parent_order_no = po.order_no 
WHERE
	co.order_no = 140220177360458;

SELECT
*
FROM
	t_compensate 
WHERE
	c_order_no = 140220177360458
ORDER BY
	c_id DESC ;
	
	
	SELECT
	* 
FROM
	t_order_invoice 
WHERE
	order_no = ? 
	LIMIT 1 
SELECT
*
FROM
	t_order_transfer 
WHERE
	tr_order_no = 140220177360458;


SELECT
*
FROM
	t_distribution AS distribution
	LEFT JOIN t_goods_distribution AS goods ON distribution.distribution_id = goods.distribution_id
	LEFT JOIN t_order AS o ON o.order_no = distribution.order_no
	LEFT JOIN t_order_line ol ON ol.good_item_id = goods.item_id 
	AND ol.order_no = distribution.order_no 
WHERE
	1 = 1 
	AND distribution.order_no =140220177360458 
	AND distribution.distribution_type =1 ;
	

	SELECT
	* 
FROM
	`t_invoice_logistics` t 
WHERE
	t.il_order_no = 140220177360458;
	
	
