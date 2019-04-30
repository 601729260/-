
select * from gb_share_item where item_num_id=432195;



select * from u_sys_permission;

select * from mamahao_crm.t_crm_permission;

update u_sys_permission set permission_url=4 where permission_id=363;

select * from  u_staff limit 1;


select * from u_staff where staff_work_number like 'wgn%';

update u_staff set shop_id=1800000080 where staff_id=666666;

select  * from t_gb_stock where storage_id=1800000080;

delete from `mamahao-pos`.`u_sys_permission` where permission_url in (1,2,3,4,5,6,7,8,9,10);

INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '推广中心', '1', '妈妈好工作台,推广中心', '推广中心', '', 1, NULL, '2019-02-25 20:59:44');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '充值中心', '2', '妈妈好工作台,充值中心', '充值中心', '', 1, NULL, '2019-02-25 21:08:19');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '业绩提成', '3', '妈妈好工作台,业绩提成', '业绩提成', '', 1, NULL, '2019-02-25 21:08:30');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '会员管理', '4', '妈妈好工作台,会员管理', '会员管理', '', 1, NULL, '2019-02-25 21:08:41');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '收货入库', '5', '妈妈好工作台,收货入库', '收货入库', '', 1, NULL, '2019-02-25 21:08:55');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '调拨出库', '6', '妈妈好工作台,调拨出库', '调拨出库', '', 1, NULL, '2019-02-25 21:09:09');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '退货出库', '7', '妈妈好工作台,退货出库', '退货出库', '', 1, NULL, '2019-02-25 21:09:20');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '库存盘点', '8', '妈妈好工作台,库存盘点', '库存盘点', '', 1, NULL, '2019-02-25 21:09:36');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '货架管理', '9', '妈妈好工作台,货架管理', '货架管理', '', 1, NULL, '2019-02-25 21:09:49');        
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 1, '配送服务', '10', '妈妈好工作台,配送服务', '配送服务', '', 1, NULL, '2019-02-25 21:10:03');     





INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '推广中心', '1', '妈妈好工作台,推广中心', '推广中心', '', 1, NULL, '2019-02-25 20:59:44');             
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '充值中心', '2', '妈妈好工作台,充值中心', '充值中心', '', 1, NULL, '2019-02-25 21:08:19');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '业绩提成', '3', '妈妈好工作台,业绩提成', '业绩提成', '', 1, NULL, '2019-02-25 21:08:30');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '会员管理', '4', '妈妈好工作台,会员管理', '会员管理', '', 1, NULL, '2019-02-25 21:08:41');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '收货入库', '5', '妈妈好工作台,收货入库', '收货入库', '', 1, NULL, '2019-02-25 21:08:55');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '调拨出库', '6', '妈妈好工作台,调拨出库', '调拨出库', '', 1, NULL, '2019-02-25 21:09:09');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '退货出库', '7', '妈妈好工作台,退货出库', '退货出库', '', 1, NULL, '2019-02-25 21:09:20');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '库存盘点', '8', '妈妈好工作台,库存盘点', '库存盘点', '', 1, NULL, '2019-02-25 21:09:36');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '货架管理', '9', '妈妈好工作台,货架管理', '货架管理', '', 1, NULL, '2019-02-25 21:09:49');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 2, '配送服务', '10', '妈妈好工作台,配送服务', '配送服务', '', 1, NULL, '2019-02-25 21:10:03');    



INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '推广中心', '1', '妈妈好工作台,推广中心', '推广中心', '', 1, NULL, '2019-02-25 20:59:44');                 
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '充值中心', '2', '妈妈好工作台,充值中心', '充值中心', '', 1, NULL, '2019-02-25 21:08:19');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '业绩提成', '3', '妈妈好工作台,业绩提成', '业绩提成', '', 1, NULL, '2019-02-25 21:08:30');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '会员管理', '4', '妈妈好工作台,会员管理', '会员管理', '', 1, NULL, '2019-02-25 21:08:41');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '收货入库', '5', '妈妈好工作台,收货入库', '收货入库', '', 1, NULL, '2019-02-25 21:08:55');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '调拨出库', '6', '妈妈好工作台,调拨出库', '调拨出库', '', 1, NULL, '2019-02-25 21:09:09');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '退货出库', '7', '妈妈好工作台,退货出库', '退货出库', '', 1, NULL, '2019-02-25 21:09:20');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '库存盘点', '8', '妈妈好工作台,库存盘点', '库存盘点', '', 1, NULL, '2019-02-25 21:09:36');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '货架管理', '9', '妈妈好工作台,货架管理', '货架管理', '', 1, NULL, '2019-02-25 21:09:49');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 4, '配送服务', '10', '妈妈好工作台,配送服务', '配送服务', '', 1, NULL, '2019-02-25 21:10:03');  


INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '推广中心', '1', '妈妈好工作台,推广中心', '推广中心', '', 1, NULL, '2019-02-25 20:59:44');                 
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '充值中心', '2', '妈妈好工作台,充值中心', '充值中心', '', 1, NULL, '2019-02-25 21:08:19');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '业绩提成', '3', '妈妈好工作台,业绩提成', '业绩提成', '', 1, NULL, '2019-02-25 21:08:30');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '会员管理', '4', '妈妈好工作台,会员管理', '会员管理', '', 1, NULL, '2019-02-25 21:08:41');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '收货入库', '5', '妈妈好工作台,收货入库', '收货入库', '', 1, NULL, '2019-02-25 21:08:55');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '调拨出库', '6', '妈妈好工作台,调拨出库', '调拨出库', '', 1, NULL, '2019-02-25 21:09:09');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '退货出库', '7', '妈妈好工作台,退货出库', '退货出库', '', 1, NULL, '2019-02-25 21:09:20');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '库存盘点', '8', '妈妈好工作台,库存盘点', '库存盘点', '', 1, NULL, '2019-02-25 21:09:36');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '货架管理', '9', '妈妈好工作台,货架管理', '货架管理', '', 1, NULL, '2019-02-25 21:09:49');           
INSERT INTO `mamahao-pos`.`u_sys_permission`( `permission_identity`, `permission_name`, `permission_url`, `permission_menu`, `permission_comment`, `permission_server_path`, `visible`, `create_time`, `update_time`) VALUES ( 5, '配送服务', '10', '妈妈好工作台,配送服务', '配送服务', '', 1, NULL, '2019-02-25 21:10:03'); 





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