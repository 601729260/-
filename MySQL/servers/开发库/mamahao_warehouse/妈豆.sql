select * from t_crm_asset_count where member_id in (1994075)

select b.member_id, sum(a.pay_mbean_count) from t_order_pay a 
left join t_order b on a.order_no=b.order_no
where b.member_id=1994075
group by b.member_id;

麻豆变更类型：0 商品购物，1 评价晒单，2 摇麻豆，3 签到，4 商品抵扣，5 系统赠送，6 退货退款返还，7 其他


select member_id, sum(totalUsedMbean) totalUsedMbean from (select member_id,sum(if(math_operator=0,bean_num,-bean_num)) totalUsedMbean 
from t_member_mbean where bean_type in (1,6)  and member_id in (1994075) group by member_id 
union all select b.member_id, sum(if(d.pay_type=6,0,a.pay_mbean_count)-if(d.pay_type=6,d.offset_price,0)) totalUsedMbean  from t_order_pay a 
 left join t_order b on a.order_no=b.order_no
 left join u_refund_basic c on b.order_no=c.order_no
 left join u_refund_pay d on c.refund_no=d.refund_no
 where b.member_id in (1994108) and b.parent_order_no is not null 
 and b.dealing_type in (4,5) group by b.member_id) a group by member_id
 
 
 
select member_id, sum(totalUsedMbean) totalUsedMbean from (select member_id,sum(if(math_operator=0,bean_num,-bean_num)) totalUsedMbean 
from t_member_mbean where bean_type in (1,6)  and member_id in (1994108) group by member_id 
union all 
select b.member_id, sum(a.pay_mbean_count) totalUsedMbean  from t_order_pay a 
 left join t_order b on a.order_no=b.order_no
 where b.member_id in (1994108) and b.parent_order_no is not null 
 and b.dealing_type in (4,5) group by b.member_id
 union all
  select  c.mmh_member_id,sum(if(d.pay_type=6,-d.offset_price,0)) totalUsedMbean from u_refund_basic  c 
 left join u_refund_pay d on c.refund_no=d.refund_no
 where mmh_member_id in (1994108) group by mmh_member_id
 ) a group by member_id
 
 
 
  left join u_refund_basic c on b.order_no=c.order_no
 left join u_refund_pay d on c.refund_no=d.refund_no
 
 select  c.mmh_member_id,sum(if(d.pay_type=6,-d.offset_price,0)) totalUsedMbean from u_refund_basic  c 
 left join u_refund_pay d on c.refund_no=d.refund_no
 where mmh_member_id in (1994075) group by mmh_member_id  ;
 
 select * from t_order where member_id in (1994075);
 
 select b.member_id, a.pay_mbean_count totalUsedMbean  from t_order_pay a 
 left join t_order b on a.order_no=b.order_no
 left join u_refund_basic c on b.order_no=c.order_no
 left join u_refund_pay d on c.refund_no=d.refund_no
 where b.member_id in (1994075) and b.parent_order_no is not null 
 and b.dealing_type in (4,5) 
 
 
 
 select * from u_refund_basic where order_no='MPOS147040674343949'
 
  select * from u_refund_pay  limit 100;
	
	create or replace view u_refund_pay as select * from db_gd.u_refund_pay;
	
	select * from u_refund_pay where refund_no='MPOS147040674343949'
	
	select * from u_refund_basic where order_no='MPOS147040691550181';
	
	select * from u_refund_pay where refund_no in('TH147040373455819','TH147040318705380');
 
	
	

 select b.member_id, sum(a.pay_mbean_count) totalUsedMbean from t_order_pay a 
 left join t_order b on a.order_no=b.order_no
 where b.member_id in (1619258) and parent_order_no is not null 
 group by b.member_id) a group by member_id
 
 
 select * from t_order b where b.member_id=1619258;
 
 
 
 select * from t_order_pay  
 where order_no in(select * from t_order b where b.member_id in (1994075))
 
 
 
 select distinct bean_type,des from t_member_mbean ;