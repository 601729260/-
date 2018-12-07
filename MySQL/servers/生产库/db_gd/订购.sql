select * from t_order limit 100;


select count(1) from t_order limit 100;

select sum(pay_total_price)/100 from t_order ;

select DATE_FORMAT(created_time,"%Y"),sum(pay_total_price)/100 from t_order  group  by DATE_FORMAT(created_time,"%Y");

select * from t_order order by created_time desc;

select * from t_order_pay limit 100;

select * from t_order_payment limit 100;

select a.created_time,b.pay_total_price from t_order  a ,t_order_pay b where a.order_no=b.order_no order by a.created_time desc limit 100;

select DATE_FORMAT(a.created_time,"%Y"),sum(b.pay_total_price)/100 from t_order  a ,t_order_pay b where a.order_no=b.order_no group  by DATE_FORMAT(a.created_time,"%Y");



select DATE_FORMAT(created_time,"%Y"),count(1) from t_order  group  by DATE_FORMAT(created_time,"%Y");