select a.member_id,a.order_no from t_star_member_sales_detail_tmp a left join  t_star_member_sales_detail b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null
--and a.order_created_time>'2019-10-11 00:00:00'
--and a.order_created_time<'2019-10-22 00:40:00';


select * from t_star_member_sales_detail_tmp where order_no='669083424923517036';



select distinct a.member_id from t_star_member_sales_detail_tmp a left join  t_star_member_sales_detail b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null


select  distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},') from t_star_member_sales_detail_tmp a left join  t_star_member_sales_detail b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null
#and a.order_created_time>'2019-10-11 00:00:00'
#and a.order_created_time<'2019-10-22 00:40:00'
and a.sale_type!=9;



select a.member_id,a.order_no from t_star_member_sales_detail_tmp a left join  t_star_member_sales_detail b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null
#and a.order_created_time>'2019-10-11 00:00:00'
#and a.order_created_time<'2019-10-22 00:40:00'
and a.sale_type!=9;
