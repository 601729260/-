INSERT INTO `mamahao-pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) VALUES (888, 'wgnfd', 'wgn分店', '15570012306', '5a74eaaf73b080a883d9dbfe3e553cde', 1, 45, 1500000102, 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2019-02-25 18:02:09', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', '2276e0eae8f163728becc1e0ba73f545');
INSERT INTO `mamahao-pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) VALUES (999, 'wgnzd', 'wgn总店', '15570012345', 'a84d92caaaea25644909730d550f4233', 1, 44, 1, 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2019-02-25 18:01:25', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);
INSERT INTO `mamahao-pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) VALUES (666666, 'wgnck', '王冠楠仓库', '15570012305', '37b980c9c85259ff7889ebcd5022c3c1', 1, 49, 2, 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2019-02-25 18:03:02', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', '0fd3882792abd2963340125a426d9dd1');


select * from u_sys_permission where permission_identity=1 and permission_url in (1,2,3,4,5,6,7,8,9,10);




select * from u_sys_permission where permission_identity=4 and permission_url in (1,2,3,4,5,6,7,8,9,10);


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


select * from u_sys_role_permission;