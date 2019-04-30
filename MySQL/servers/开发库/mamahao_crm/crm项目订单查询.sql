
select * from db_user.t_member where member_id=1773989 limit 100;

select * from t_order;

drop view t_order;
create view t_order as select * from db_gd_dev.t_order;

drop table t_refund_line;
create view t_refund_line as select * from db_gd_dev.t_refund_line;

select * from t_refund_line limit 1;


drop table u_order;
create view u_order as select * from db_gd_dev.u_order ;

select  * from u_order limit 1;

drop table u_refund_basic;
create view u_refund_basic as select * from db_gd_dev.u_refund_basic;

select * from u_refund_basic;


1774109

#-----------查询订单---------
SELECT
* 
FROM
	t_order 
WHERE
dealing_type <> 5 
		AND order_state IN ( 0, 4, 5, 6 ) 
		AND order_type IN ( 2, 4, 0, 7, 8, -1 ) 
	

select * from t_order  where member_id>100000  and limit 100;

select * from t_order  where member_id=1774109;
update t_order set member_id=1774109  where member_id=874;
select 

