create table t_member_binding_bak20190213 as select * from t_member_binding;

drop table t_member_binding;
create view t_member_binding as select * from db_user.t_member_binding;

select * from db_user.t_member_binding where staff_id=888;
select * from mamahao_pos.u_staff where staff_id=888;
select * from db_user.t_member_binding where shop_id=1500000102 and staff_id=52;
update  db_user.t_member_binding set staff_id=888 where shop_id=1500000102 and staff_id=52;


update mamahao_pos.u_staff set shop_id=1500000102 where staff_id=6666662;
select * from mamahao_pos.u_staff where staff_id=6666662;
select * from db_user.t_member_binding where shop_id=1500000102 and staff_id=19;
update  db_user.t_member_binding set staff_id=6666662 where shop_id=1500000102 and staff_id=19;


select * from mamahao_pos.u_staff  where staff_id=6666668;

select * from db_user.t_member_binding where shop_id=1500000102 and staff_id=54;
update  db_user.t_member_binding set staff_id=6666668 where  shop_id=1500000102 and staff_id=54;


select * from mamahao_warehouse.t_member_binding where member_id=1607280;

select * from mamahao_warehouse.t_member where member_phone='18957159108';



select * from mamahao_warehouse.u_order_pay limit 100;

select * from mamahao_warehouse.u_refund_basic limit 100;