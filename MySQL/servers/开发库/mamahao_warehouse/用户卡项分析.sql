用户卡项分析
select * from t_crm_asset_count where member_id in (1994072);


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
 WHEN csn.bill_type in (5) THEN
  -csn.bill_value
 ELSE
 csn.bill_value
 END AS billValue
 FROM
 u_card_item_record cir
 INNER JOIN u_card_serial_number csn ON cir.card_item_record_id = csn.card_item_record_id
 WHERE
 cir.mmh_member_id in (1994072)
 AND cir.card_item_type = 0
 AND csn.`bill_type` IN (1, 2, 3, 4, 5, 8, 10)
 ) tt
 GROUP BY
 tt.mmh_member_id
 
 
 
 select * from  u_card_item_record  where  mmh_member_id in (1994072);
 
 select * from u_card_serial_number where card_item_record_id in (4673,4674)