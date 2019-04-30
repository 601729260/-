
select * from u_sys_role_permission ;

select * from u_sys_role limit 1;

select * from u_sys_permission where permission_url in (1,2,3,4,5,6,7,8,9,10);

select * from u_sys_role where role_identity in ;


insert into u_sys_role_permission(sys_role_id,sys_permission_id)
select b.role_id,a.permission_id from u_sys_permission  a left join u_sys_role b on a.permission_identity=b.role_identity
where permission_url in (1,2,3,4,5,6,8,9,10)
and b.role_identity=1;

insert into u_sys_role_permission(sys_role_id,sys_permission_id)
select b.role_id,a.permission_id from u_sys_permission  a left join u_sys_role b on a.permission_identity=b.role_identity
where permission_url in (1,2,3,4,5,6,7,8,9,10)
and b.role_identity=2;


insert into u_sys_role_permission(sys_role_id,sys_permission_id)
select b.role_id,a.permission_id from u_sys_permission  a left join u_sys_role b on a.permission_identity=b.role_identity
where permission_url in (1,2,3,4,5,6,8,9,10)
and b.role_identity=4;


insert into u_sys_role_permission(sys_role_id,sys_permission_id)
select b.role_id,a.permission_id from u_sys_permission  a left join u_sys_role b on a.permission_identity=b.role_identity
where permission_url in (1,2,3,4,5,6,8,9,10)
and b.role_identity=5;