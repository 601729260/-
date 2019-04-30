select * from u_card_item_record;

  `card_item_type` tinyint(4) DEFAULT NULL COMMENT '卡项类型（0=储值卡，1=次数卡，2=时间卡，3=综合卡，4=赠送卡）',
 

select * from t_crm_asset_count where member_id in (1994104);


create view u_card_serial_number as select * from db_gd.u_card_serial_number;


SELECT
 tt.mmh_member_id member_id,
 SUM(tt.billValue) totalUsedPrice
 FROM
 (
 SELECT
 cir.`mmh_member_id`,
 CASE
 WHEN csn.`bill_type` IN (1, 4) THEN
 csn.bill_value
 ELSE
 csn.bill_value
 END AS billValue
 FROM
 u_card_item_record cir
 INNER JOIN u_card_serial_number csn ON cir.card_item_record_id = csn.card_item_record_id
 WHERE
 cir.mmh_member_id in (1994104)
 AND cir.card_item_type = 0
 AND csn.`bill_type` IN (1, 2, 3, 4, 5, 8, 10)
 ) tt
 GROUP BY
 tt.mmh_member_id