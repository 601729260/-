
select * from t_virtual_stock where item_num_id=1100003813  and virtual_stock_type=2;

select * from t_virtual_stock_member where sid=1800000080;

select * from t_virtual_stock_log where item_num_id=1100003813  and virtual_stock_type=2;



CREATE TABLE `t_virtual_stock` (
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `item_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'sku编码',
  `virtual_stock_type` int(10) NOT NULL DEFAULT '0' COMMENT '虚拟仓类型',
  `virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称',
  `qty` bigint(18) DEFAULT NULL COMMENT '库存',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间，选填',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填',
  PRIMARY KEY (`sid`,`item_num_id`,`virtual_stock_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `t_virtual_stock_log` (
  `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sid` bigint(18) DEFAULT NULL COMMENT '仓库ID',
  `id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转仓记录ID',
  `item_num_id` bigint(18) DEFAULT NULL COMMENT 'sku编码',
  `virtual_stock_type` int(10) DEFAULT NULL COMMENT '虚拟仓类型',
  `virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称',
  `change_qty` bigint(18) DEFAULT NULL COMMENT '变更库存',
  `pre_qty` bigint(18) DEFAULT NULL COMMENT '变更前库存',
  `staff_id` int(10) DEFAULT NULL COMMENT '操作员ID',
  `staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作员名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间，选填',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填#AS|显示',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `t_virtual_stock_member` (
  `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sid` bigint(18) DEFAULT NULL COMMENT '仓库ID',
  `virtual_stock_type` int(10) DEFAULT NULL COMMENT '虚拟仓类型',
  `virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间，选填',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `t_virtual_stock_member`(`seq_id`, `sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1, 1800000080, 2, '次品仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO `t_virtual_stock_member`(`seq_id`, `sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (2, 1800000080, 3, '待退仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO `t_virtual_stock_member`(`seq_id`, `sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (3, 1800000080, 4, '棉品仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`seq_id`, `sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (4, 1800000080, 5, '格林仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`seq_id`, `sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (5, 1800000080, 6, '积分仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`seq_id`, `sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (6, 1800000080, 7, '中转仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');




INSERT INTO `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000088, 2, '次品仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000088, 3, '待退仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000088, 4, '棉品仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000088, 5, '格林仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000088, 6, '积分仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000088, 7, '中转仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');


INSERT INTO `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000089, 2, '次品仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000089, 3, '待退仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000089, 4, '棉品仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000089, 5, '格林仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000089, 6, '积分仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');
INSERT INTO  `t_virtual_stock_member`(`sid`, `virtual_stock_type`, `virtual_stock_name`, `create_time`, `update_time`) VALUES (1800000089, 7, '中转仓', '2018-11-16 13:49:26', '2018-11-16 13:49:26');




CREATE TABLE `t_virtual_stock_trans_log` (
  `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sid` bigint(18) DEFAULT NULL COMMENT '仓库ID',
  `id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转仓记录ID',
  `item_num_id` bigint(18) DEFAULT NULL COMMENT 'sku编码',
  `from_vitural_stock_type` int(10) DEFAULT NULL COMMENT '转出虚拟仓类型',
  `from_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转出虚拟仓名称',
  `to_vitural_stock_type` int(10) DEFAULT NULL COMMENT '转入虚拟仓类型',
  `to_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '转入虚拟仓名称',
  `staff_id` int(10) DEFAULT NULL COMMENT '操作员ID',
  `staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作员名称',
  `trans_num` bigint(18) DEFAULT NULL COMMENT '转仓数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间，选填',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `t_seq`(`name`, `start_value`, `now_value`, `increment_value`, `max_value`) 
VALUES ('virtual_stock_trans_log_id', 1000000, 1000112, 1, 9999999);
