
select distinct order_no from (
(select a.order_no from t_order a 
 inner join t_member_star b on a.member_id=b.member_id 
 left join t_star_member_sales c on a.order_no=c.order_no
where a.dealing_type not in (4,5) 
and a.order_type in (1,6) 
and a.order_state in (0,4,5,6,9)
and a.parent_order_no is not null
and a.update_time>ifnull(c.update_time,'2015-01-01 00:00:00')
and a.update_time>='2019-04-13 09:52:06.487'
and a.update_time<='2019-04-16 10:32:06.487'
and c.sale_status!=1
limit 10000)
union all 
( select a.order_no from t_order a 
 inner join t_member_star b on a.member_id=b.member_id 
 inner join t_star_member_sales c on a.order_no=c.order_no
 inner join t_refund_line d on a.order_no=d.order_no 
where a.dealing_type not in (4,5) 
and a.order_type in (1,6) 
and a.order_state in (0,4,5,6,9)
and d.status in (1,2,3,4,7,9,11)
and a.parent_order_no is not null
and d.update_time>c.update_time
and a.update_time>='2019-04-13 09:52:06.487'
and a.update_time<='2019-04-16 10:32:06.487'
and c.sale_status!=1
limit 10000)) x


