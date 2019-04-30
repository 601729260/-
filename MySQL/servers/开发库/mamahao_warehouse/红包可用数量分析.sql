select * from t_crm_asset_count where member_id=1994072;


  `status` int(3) DEFAULT '0' COMMENT '0=未领取(不会出现),1=已领取,2=取消使用(同1),3=已使用',

#====红包可用数量分析
select v1.member_id,sum(if(v1.voucher_amount is null,0,v1.voucher_amount))/100 voucher_amount,
sum(if(v1.voucher_left_amount is null ,0,v1.voucher_left_amount))/100 voucher_left_amount,
count(1) as count 
from t_voucher v1 
 where v1.member_id in (1619258,1994101,1994102,1994072,1994103) 
 and v1.status in (1) and v1.voucher_type in (4,10) 
and v1 and end_time>=CURRENT_DATE group by v1.member_id
 
 
 