select * from mamahao_pos.u_sys_permission where permission_menu is null;

update mamahao_pos.u_sys_permission set permission_menu=CONCAT('妈妈好服务APP,',permission_name),permission_comment=permission_name  where permission_menu is null;

select * from mamahao_pos.u_sys_permission ;
select * from mamahao_pos.u_sys_role;
select * from mamahao_pos.u_sys_role_permission;
select * from mamahao_pos.

select * from t_crm_permission;

select * from mamahao_pos.u_sys_permission  where permission_url='update';

update mamahao_pos.u_sys_permission a  inner join t_crm_permission b 
on a.permission_name=CONVERT(b.permission_name USING utf8) COLLATE utf8_unicode_ci
set a.permission_url=b.permission_url
where a.permission_url='update';



select * from t_crm_permission;
select * from mamahao_pos.u_
select * from mamahao_pos.u_sys_permission where permission_identity=1;



select * from mamahao_pos.u_sys_permission where permission_id>556 and permission_id<565;

delete from  mamahao_pos.u_sys_permission where permission_id>556 and permission_id<565;



select * from t_crm_permission;


update mamahao_pos.u_sys_permission a  inner join t_crm_permission b 
on a.permission_name=CONVERT(b.permission_name USING utf8) COLLATE utf8_unicode_ci
set a.permission_url=b.permission_url
where a.permission_url='update';


select a.* ,b.* from  mamahao_pos.u_sys_permission a  inner join t_crm_permission b 
on a.permission_name=CONVERT(b.permission_name USING utf8) COLLATE utf8_unicode_ci

delete from   mamahao_pos.u_sys_permission  where permission_id in (556,565);

select * from mamahao_pos.u_staff where staff_id=888;
select * from mamahao_pos.u_sys_role ;

select * from mamahao_pos.u_sys_permission   where permission_id in 
(select sys_permission_id from mamahao_pos.u_sys_role_permission where sys_role_id=5 and role_permission_id>12959);
select * from t_crm_permission;





select * from  mamahao_pos.u_sys_permission where permission_identity=2 and permission_menu like '妈妈好工作台%';

--delete from mamahao_pos.u_sys_permission where permission_url in (1,2,3,4,5,6,7,8,9,10) and permission_name!=1;

INSERT INTO `mamahao_pos`.`u_sys_permission`(`permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`) 
select 2,permission_name,permission_url,concat('妈妈好工作台,',permission_name),permission_name,'',1 from t_crm_permission;

INSERT INTO `mamahao_pos`.`u_sys_permission`(`permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`) 
select 1,permission_name,permission_url,concat('妈妈好工作台,',permission_name),permission_name,'',1 from t_crm_permission;


INSERT INTO `mamahao_pos`.`u_sys_permission`(`permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`) 
select 4,permission_name,permission_url,concat('妈妈好工作台,',permission_name),permission_name,'',1 from t_crm_permission;

select * from mamahao_pos.u_staff where staff_work_number='admin';

select * from  mamahao_pos.u_sys_permission where permission_identity=1;


select * from mamahao_pos.u_sys_permission where permission_url in (1,2,3,4,5,6,7,8,9,10) and  permission_identity in (2,4);

select * from mamahao_pos.u_sys_permission where permission_url in (1,2,3,4,5,6,7,8,9,10) and  permission_identity in (1);

delete from mamahao_pos.u_sys_permission where permission_url in (1,2,3,4,5,6,7,8,9,10) and  permission_identity in (2,4);

INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '推广中心', '1', '妈妈好工作台,推广中心', '推广中心', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '充值中心', '2', '妈妈好工作台,充值中心', '充值中心', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '业绩提成', '3', '妈妈好工作台,业绩提成', '业绩提成', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '会员管理', '4', '妈妈好工作台,会员管理', '会员管理', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '收货入库', '5', '妈妈好工作台,收货入库', '收货入库', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '调拨出库', '6', '妈妈好工作台,调拨出库', '调拨出库', '', 1, '2019-02-22 22:19:30', '2019-02-22 22:19:30');
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '退货出库', '7', '妈妈好工作台,退货出库', '退货出库', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '库存盘点', '8', '妈妈好工作台,库存盘点', '库存盘点', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '货架管理', '9', '妈妈好工作台,货架管理', '货架管理', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (4, '配送服务', '10', '妈妈好工作台,配送服务', '配送服务', '', 1, NULL, NULL);


INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '推广中心', '1', '妈妈好工作台,推广中心', '推广中心', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '充值中心', '2', '妈妈好工作台,充值中心', '充值中心', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '业绩提成', '3', '妈妈好工作台,业绩提成', '业绩提成', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '会员管理', '4', '妈妈好工作台,会员管理', '会员管理', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '收货入库', '5', '妈妈好工作台,收货入库', '收货入库', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '调拨出库', '6', '妈妈好工作台,调拨出库', '调拨出库', '', 1, '2019-02-22 22:19:30', '2019-02-22 22:19:30');
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '退货出库', '7', '妈妈好工作台,退货出库', '退货出库', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '库存盘点', '8', '妈妈好工作台,库存盘点', '库存盘点', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '货架管理', '9', '妈妈好工作台,货架管理', '货架管理', '', 1, NULL, NULL);
INSERT INTO `mamahao_pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES (2, '配送服务', '10', '妈妈好工作台,配送服务', '配送服务', '', 1, NULL, NULL);








#----------------------------查询权限------

select * from mamahao_pos.u_staff where staff_phone=17357257085 ;

select * from mamahao_pos.u_sys_role_permission where sys_role_id=47;
















