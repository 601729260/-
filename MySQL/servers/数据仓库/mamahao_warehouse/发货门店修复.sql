select a.delivery_sid ,a.sid,a.staff_shop_id,b.shop_id ,b.achievement_owner_id from t_star_member_sales_detail a inner join t_order b
on a.order_no=b.order_no
where a.delivery_sid!=b.shop_id
and b.shop_id>0 and b.shop_id!=90255008
and a.order_created_time>'2019-10-01 00:00:00';

select concat("update t_star_member_sales_detail set  delivery_sid=",b.shop_id,",delivery_sid_name='" ,b.shop_name,"' where order_no='",a.order_no,"';")
from t_star_member_sales_detail a inner join t_order b on a.order_no=b.order_no
where a.delivery_sid!=b.shop_id
and b.shop_id>0 and b.shop_id!=90255008
and a.order_created_time>'2019-10-01 00:00:00';



select concat("update t_star_member_sales_detail set  delivery_sid=",b.warehouse_id,",delivery_sid_name='" ,b.warehouse_name,"' where order_no='",a.order_no,"';")
 from t_star_member_sales_detail a inner join t_order b
on a.order_no=b.order_no
where a.delivery_sid!=b.warehouse_id
and b.warehouse_id>0
and a.order_created_time>'2019-10-01 00:00:00';