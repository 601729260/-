select * from  t_crm_member_label;

delete from t_crm_member_label where member_id=1773989;

select * from  t_crm_member_label where member_id=1773989;


select * from t_staff_label_his;

delete from t_staff_label_his where staff_id=888;

create table t_member_bak20190215 as select * from t_member ;

drop table t_member;
create view t_member as select * from db_user.t_member;

select *  from t_member limit 10;


