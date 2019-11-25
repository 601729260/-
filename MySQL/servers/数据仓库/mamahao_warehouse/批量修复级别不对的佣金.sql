
select a.order_no,a.member_id,a.order_created_time,a.star_member_level,b.bak_time,b.star_level,b.member_id,a.indirect_type from t_star_member_sales_detail a 
left join t_member_star_his b on a.member_id=b.member_id and a.order_created_time>=b.bak_time and a.star_member_level<b.star_level
where star_member_level in (6,7,8,9,10)  
and order_created_time>'2019-11-07 00:00:00'
and b.bak_time is not null
and a.order_no='MPOS155120190144427'

select * from t_star_member_sales_detail a where a.order_no='MPOS155120190144427';


select distinct a.order_no,a.order_created_time from t_star_member_sales_detail a 
left join t_member_star_his b on a.member_id=b.member_id and a.order_created_time>=b.bak_time and a.star_member_level<b.star_level
where star_member_level in (6,7,8,9,10) 
and a.channel_type=0
and order_created_time>'2019-11-07 00:00:00'
and b.bak_time is not null
and indirect_type!=9




select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},')  from t_star_member_sales_detail a 
left join t_member_star_his b on a.member_id=b.member_id and a.order_created_time>=b.bak_time and a.star_member_level<b.star_level
where star_member_level in (6,7,8,9,10) 
and a.channel_type=0
and order_created_time>'2019-11-07 00:00:00'
and b.bak_time is not null
and indirect_type!=9

