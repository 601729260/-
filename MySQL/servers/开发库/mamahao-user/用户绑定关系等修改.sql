SELECT * FROM   t_tk_order WHERE tk_create_time>'2019-10-17 22:41:00'  
AND trade_parent_id NOT IN
(
 SELECT DISTINCT order_no FROM  t_star_member_sales_detail  WHERE order_no IN 
 (
 SELECT DISTINCT trade_parent_id FROM   t_tk_order WHERE tk_create_time>'2019-10-17 22:41:00'  
 )
)

select * from t_tk_order where trade_id=668900064782161872

select * from t_member_star where member_id=1781683;

select * from t_member_star where higher_member_ids=1781683;

select * from t_member_star

select * from t_member where member_phone=13776339362;