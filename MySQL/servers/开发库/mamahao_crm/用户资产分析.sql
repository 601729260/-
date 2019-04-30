select * from t_crm_asset_count where member_id=1619258 ;

select * from mamahao_warehouse.u_card_item_detail ;
select * from mamahao_warehouse.u_card_item_record where mmh_member_id=1619258;

select * from mamahao_warehouse.u_card_item_record where mmh_member_id=1619258;
select * from mamahao_warehouse.u_card_item_detail where card_item_record_id=4525;




	
SELECT
	cir.mmh_member_id member_id,
	SUM(cir.face_value) totalRechargePrice
FROM
	u_card_item_record cir
LEFT JOIN u_order o ON cir.order_no = o.order_no
WHERE
	cir.update_time >= '2019-02-27 09:08:31'
AND cir.card_item_type = 0
AND cir.upgrade_from_id IS NULL
AND cir.`card_from_record_id` IS NULL
AND o.order_type != 3
GROUP BY
	cir.mmh_member_id
	
	
alter table t_crm_asset_count rename  total_red_packet_lef_left_num to total_red_packet_left_num;

  `total_red_packet_lef_left_num` int(11) DEFAULT NULL COMMENT '红包剩余数量',

	