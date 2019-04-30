select * from t_crm_asset_count where member_id in (1994101,1994103,1994072)

delete from t_crm_asset_count where member_id=1619258;

select * from t_member where member_phone='18957159108';

select * from t_voucher where  member_id=1619258;


select v1.member_id,sum(if(v1.voucher_amount is null,0 ,v1.voucher_amount))/100 voucher_amount,count(1) as count 
from t_voucher v1 
where v1.member_id in (1619258 )
and v1.status in (1,2) and v1.voucher_type != 4 and v1.voucher_type != 10 
and v1.end_time>=CURRENT_DATE group by v1.member_id

select current_date;
select * from  t_voucher v1 where v1.member_id in (1619258 )


select * from t_voucher where  member_id=1619258;


select v1.member_id,count(1) as count 
from t_voucher v1 
where v1.member_id in (1619258 )
 and v1.voucher_type in (0,4,10) group by v1.member_id
 
 
 select * from t_voucher  where voucher_type=4 and status=1 limit 100;
 
  select * from t_voucher where member_id=1466452;
 
 update t_voucher set  member_id=1994076 where  member_id=1466452;
 
 select * from t_voucher where  member_id=1994076 ;
 
 update t_voucher set end_time='2019-06-04 23:59:59' where  member_id=1994076
 
 update t_voucher set decrease_type=8 where  member_id=1994076
 
  SELECT count(1) "count", IFNULL(sum(voucher_amount), 0) "amount" FROM t_voucher WHERE decrease_type = 8 AND member_id = ? AND `status` = 1 and end_time >= now()



 SELECT count(1) "count", IFNULL(sum(voucher_amount), 0) "amount" 
 FROM t_voucher WHERE decrease_type = 8 AND member_id = 1994076 AND `status` = 1 and end_time >= now() 
 
 
 
2019-03-01 19:33:40.078 DEBUG 3032 --- [nio-8080-exec-9] n.queryRedpacketSimCharts                : ==> Parameters: 1994076(Long)
2019-03-01 19:33:40.081 DEBUG 3032 --- [nio-8080-exec-9] n.queryRedpacketSimCharts                : <==      Total: 1


