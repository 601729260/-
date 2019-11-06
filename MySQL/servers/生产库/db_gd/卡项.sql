select * from u_card_item_record where  member_phone=15250379596 limit 100;


update u_card_item_record set valid_time='2020-10-30 17:16:02' where  member_phone=15250379596


select * from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=1;



select a.valid_time,DATE_ADD(a.valid_time,INTERVAL 1 year)
from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=1;

update u_card_item_record a  inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id  and rest_value>0
set a.valid_time=DATE_ADD(a.valid_time,INTERVAL 1 year)
where a.publish_owner=1;






select distinct a.card_item_record_id from u_card_item_record a inner join u_card_item_detail b on a.card_item_record_id=b.card_item_record_id 
and rest_value>0
where a.publish_owner=1;

select * from  u_card_item_record where member_id=15250379596



