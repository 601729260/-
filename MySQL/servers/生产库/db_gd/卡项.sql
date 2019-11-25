select * from u_card_item_record where  member_phone=13045658221 limit 100;




update u_card_item_record set valid_time='2020-10-30 17:16:02' where  member_phone=15250379596

select * from u_card_item_detail where card_item_record_id=3437;

update u_card_item_detail set rest_value=0 where card_item_record_id=3437;

select * from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=2
and a.valid_time<'2019-11-13 00:00:00';



select a.valid_time,DATE_ADD(a.valid_time,INTERVAL 1 year)
from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=1;

update u_card_item_record a  inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id  and rest_value>0
set a.valid_time=DATE_ADD(a.valid_time,INTERVAL 1 year)
where a.publish_owner=1;

select * from gb_cort_sub_unit  where sub_unit_num_id>1500000000 limit 100;


select * from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=2
and  member_phone not in ('18551258902','17312314875')
and s_id!=1500000157
;

///有效期增加一年
update u_card_item_record a  inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id  and rest_value>0
set a.valid_time=DATE_ADD(a.valid_time,INTERVAL 1 year)
where a.publish_owner=2
and  member_phone not in ('18551258902','17312314875')
and s_id!=1500000157;

select * from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=2
and  member_phone not in ('18551258902','17312314875')
and s_id!=1500000157
;

select * from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
where s_id=1500000157 and rest_value>0 limit 100;

update u_card_item_record a  inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id  and rest_value>0
set a.valid_time=DATE_ADD(a.valid_time,INTERVAL 1 year)
where a.publish_owner=1;




select distinct a.card_item_record_id from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=1;

select * from  u_card_item_record where member_id=15250379596





#------------------------------------------

卡项消费明细查询



         SELECT
	        *
           FROM
	        (
		      SELECT
					r.order_line_id,
			    r.card_item_type AS "cardType",
			    r.card_item_record_id "recordId",
			    r.card_item_template_id "cardTemplateId",
			    l.item_id AS "consumeId",
			    l.item_name AS "consumeName",
			    l.order_no AS "orderNo",
			    l.cashier_emp_name AS "cashierName",
			    p.pay_time AS "payTime",
			    p.pay_type AS "payType",
			    SUM(p.offset_price) / 100 AS "cost",
			    s.`status` AS "cardItemStatus",
			    r.status AS "refundStatus"
		      FROM
			    u_card_item_record r
		      LEFT JOIN u_order_line l ON r.order_line_id = l.order_line_id
		      LEFT JOIN u_order_line_pay p ON r.order_line_id = p.order_line_id
		      LEFT JOIN u_card_item_template_status s ON r.card_item_template_id = s.card_item_template_id
		      WHERE
			    r.mmh_member_id =1781991
		      #AND p.pay_time IS NOT NULL
		      GROUP BY
			    r.order_line_id
	        ) t
          LEFT JOIN (
	        SELECT
		      r.card_item_record_id,
		      SUM(d.ori_value) AS "cardValue"
	        FROM
		      u_card_item_record r
	        LEFT JOIN u_card_item_detail d ON r.card_item_record_id = d.card_item_record_id
	        WHERE
		      r.mmh_member_id =1781991
	        GROUP BY
		      r.card_item_record_id
                    ) d ON t.recordId = d.card_item_record_id
          ORDER BY payTime DESC





select  * from  u_card_item_record where mmh_member_id =1781991


select  * from  u_card_item_record where order_line_id is null;


select * from   u_card_item_record b left join u_order_line a  on a.mmh_member_id=b.mmh_member_id 
where a.item_type in (2) 
and b.order_line_id is null;


