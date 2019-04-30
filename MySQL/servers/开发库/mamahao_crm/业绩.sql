select * from mamahao_pos.u_achievement_percentage_record limit 100;

select * from mamahao_pos.u_achievement_percentage_record where staff_id=6666687;

update mamahao_pos.u_achievement_percentage_record  set staff_id=6666668   where staff_id=6666687;

select * from mamahao_pos.u_achievement_percentage_record 

select * from mamahao_pos.u_achievement_performance_record  where staff_id=6666687 limit 100;

update mamahao_pos.u_achievement_performance_record set staff_id=6666668  where staff_id=6666687


select * from mamahao_pos.u_achievement_percentage_record where staff_id=6666662;

select * from mamahao_pos.u_achievement_performance_record where staff_id=6666662;

select b.order_type,a.* from  mamahao_pos.u_achievement_percentage_record a inner join db_gd_dev.t_order b on a.order_no=b.order_no where staff_id=6666662;


select b.order_type,a.* from  mamahao_pos.u_achievement_performance_record a inner join db_gd_dev.t_order b on a.order_no=b.order_no where staff_id=6666662;

update  mamahao_pos.u_achievement_performance_record a 
inner join db_gd_dev.t_order b on a.order_no=b.order_no 
set a.order_type=b.order_type
where staff_id=6666662;


update  mamahao_pos.u_achievement_percentage_record a 
inner join db_gd_dev.t_order b on a.order_no=b.order_no 
set a.order_type=b.order_type
where staff_id=6666662;



select * from mamahao_pos.u_achievement_performance_record where staff_id=6666662;

select * from t_member where member_id=1774078;

select * from  mamahao_pos.u_achievement_percentage_record where staff_id=888;
select * from mamahao_pos.u_achievement_performance_record where staff_id=888;

update mamahao_pos.u_achievement_percentage_record set staff_id=888 where staff_id=3;
update mamahao_pos.u_achievement_performance_record set staff_id=888 where staff_id=3;

select * from db_gd_dev.t_order where order_no in (select order_no from mamahao_pos.u_achievement_percentage_record where staff_id=888);

