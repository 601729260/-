select * from mamahao_warehouse.t_star_member_sales_detail where order_no='615078657647358408';

select * from mamahao_warehouse.t_tk_order where trade_parent_id='615078657647358408';

select DATE_ADD(DATE_ADD(order_time,INTERVAL 1 month),interval -day(curdate())+21 day),order_time from mamahao_warehouse.t_star_member_sales where order_no='615078657647358408';




select DATE_ADD(DATE_ADD(order_time,INTERVAL 1 month),interval -day(curdate())+21 day),order_time from mamahao_warehouse.t_star_member_sales 
where channel_type in (1,2,3) limit 1000



select * from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-08-01 00:00:00' and order_time<='2019-08-31 23:59:59' limit 1000 
select * from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-09-01 00:00:00' and order_time<='2019-09-30 23:59:59' limit 1000 

select * from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-10-01 00:00:00' and order_time<='2019-10-31 23:59:59'



select * from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-08-01 00:00:00' and order_time<='2019-08-31 23:59:59' limit 1000 ;
select * from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-09-01 00:00:00' and order_time<='2019-09-30 23:59:59' limit 1000 ;
select * from t_star_member_sales_detail where channel_type in (1,2,3) and order_time>='2019-08-01 00:00:00' and order_time<='2019-08-31 23:59:59' limit 1000 ;
select * from t_star_member_sales_detail where channel_type in (1,2,3) and order_time>='2019-09-01 00:00:00' and order_time<='2019-09-30 23:59:59' limit 1000 ;


update t_star_member_sales_detail set entry_time='2019-09-25 00:00:00' where channel_type in (1,2,3) and order_time>='2019-08-01 00:00:00' and order_time<='2019-08-31 23:59:59'  ;
update t_star_member_sales_detail set entry_time='2019-10-25 00:00:00' where channel_type in (1,2,3) and order_time>='2019-09-01 00:00:00' and order_time<='2019-09-30 23:59:59'  ;
update t_star_member_sales        set entry_time='2019-09-25 00:00:00' where channel_type in (1,2,3) and order_time>='2019-08-01 00:00:00' and order_time<='2019-08-31 23:59:59'  ;
update t_star_member_sales        set entry_time='2019-10-25 00:00:00' where channel_type in (1,2,3) and order_time>='2019-09-01 00:00:00' and order_time<='2019-09-30 23:59:59'  ;



select * from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-10-01 00:00:00' and order_time<='2019-10-31 23:59:59' limit 1000 ;



select count(1) from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-10-01 00:00:00' and order_time<='2019-10-31 23:59:59';  -- 19046

select count(1) from t_star_member_sales where channel_type in (1,2,3) and order_time>='2019-10-01 00:00:00' and order_time<='2019-10-31 23:59:59' and entry_time is null;-- 17836



