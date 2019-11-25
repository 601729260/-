select * from mamahao_warehouse.t_order where payment_time>'2019-10-01 00:00:00' and payment_time<'2019-10-31 23:59:59' limit 100;



select distinct  concat('{"orderNo":"',a.order_no,'","channelType":',0,',"insertTmpTable":true,"appointPaymentTime":',UNIX_TIMESTAMP('2019-10-31 23:59:59')*1000 ,'},')   from mamahao_warehouse.t_order a where payment_time>='2019-10-01 00:00:00' and payment_time<='2019-10-10 23:59:59' ;
select distinct  concat('{"orderNo":"',a.order_no,'","channelType":',0,',"insertTmpTable":true,"appointPaymentTime":',UNIX_TIMESTAMP('2019-10-31 23:59:59')*1000 ,'},')   from mamahao_warehouse.t_order a where payment_time>='2019-10-11 00:00:00' and payment_time<='2019-10-20 23:59:59' ;
select distinct  concat('{"orderNo":"',a.order_no,'","channelType":',0,',"insertTmpTable":true,"appointPaymentTime":',UNIX_TIMESTAMP('2019-10-31 23:59:59')*1000 ,'},')   from mamahao_warehouse.t_order a where payment_time>='2019-10-21 00:00:00' and payment_time<='2019-10-31 23:59:59' ;





select count(1)  from mamahao_warehouse.t_order a where payment_time>='2019-10-01 00:00:00' and payment_time<='2019-10-10 23:59:59' limit 100;
select count(1)  from mamahao_warehouse.t_order a where payment_time>='2019-10-11 00:00:00' and payment_time<='2019-10-20 23:59:59' limit 100;
select count(1)   from mamahao_warehouse.t_order a where payment_time>='2019-10-21 00:00:00' and payment_time<='2019-10-31 23:59:59' limit 100;


select UNIX_TIMESTAMP('2019-10-31 23:59:59')*1000 from dual;



select * from mamahao_warehouse.t_star_member_sales_detail_tmp where order_no='154100130824931';


select count(1) from mamahao_warehouse.t_star_member_sales_detail_tmp;