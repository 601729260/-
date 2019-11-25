select * from t_star_member_sales_detail where star_member_level in (6,7,8,9,10)  
and order_time>'2019-10-29 00:00:00'
limit 100;

select * from t_member_star 

select * from t_star_member_sales_detail a 
left join t_member_star_his b on a.member_id=b.member_id and a.order_created_time>=b.bak_time and a.star_member_level<b.star_level
where star_member_level in (6,7,8,9,10)  
and order_time>'2019-10-22 00:00:00'
limit 100;



select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,',"insertTmpTable":true},')  from t_star_member_sales_detail a 
left join t_member_star_his b on a.member_id=b.member_id and a.order_created_time>=b.bak_time and a.star_member_level<b.star_level
where star_member_level in (6,7,8,9,10)  
and order_time>'2019-10-22 00:00:00'
and order_time<'2019-11-15 23:59:59'
limit 100;


select * from t_star_member_sales_detail limit 100;




select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},')  from t_star_member_sales_detail a 
left join t_member_star_his b on a.member_id=b.member_id and a.order_created_time>=b.bak_time and a.star_member_level<b.star_level
where star_member_level in (6,7,8,9,10) 
and a.channel_type=0
and order_created_time>'2019-11-07 00:00:00'
and b.bak_time is not null
