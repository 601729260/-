create table t_average_cost_price(
sid bigint(18) comment '门店或仓库ID,1为总部',
item_num_id bigint(18) comment 'sku id',
barcode varchar(32) comment '条码',
sku_name varchar(32) comment 'sku 名称',
total_cost_price decimal(10,2) default 0 comment '门店成本总价',
total_purchase_price decimal(10,2) default 0 comment '总部成本价',
total_num  bigint(18) default 0 comment '商品数量',
total_purchase_num  bigint(18)  default 0 comment '采购数量',
avarage_cost_price decimal(10,2) comment '门店平均成本价',
avarage_purchase_price decimal(10,2) comment '总部平均成本价',
primary key(sid,item_num_id,barcode)
);

alter table u_stock_log_detail add   `tax_rate` decimal(10,2) default null COMMENT '税率';
alter table u_stock_log_detail_his add   `tax_rate` decimal(10,2) default null COMMENT '税率';


delete from `mamahao_pos`.`u_dictionary` where dictionary_name='DELIVERBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 11, '待处理', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 5, '调货中', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 2, '已收货', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 4, '已取消', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 6, '待编辑', 5, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 7, '已拒绝', 6, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('DELIVERBILL_STATUS', '调拨出库单状态', 0, '待审核', 7, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);




 delete from mamahao_pos.u_dictionary where dictionary_name='REFUNDBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 0, '待审核', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 1, '待收货', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
  
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 2, '已收货', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 4, '已取消', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);

 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 6, '待编辑', 5, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 7, '已拒绝', 6, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);



INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('TUANGOU_VIRTUAL_TYPE', '团购虚拟仓类型', 0, '公共仓', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('TUANGOU_VIRTUAL_TYPE', '团购虚拟仓类型', 6, '积分仓', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
  


#-----------------------------------调拨管理增加虚拟仓的支持-----------------

alter table u_stock_log add   `from_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log add   `from_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
alter table u_stock_log_his add   `from_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log_his add   `from_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
 
 
 
alter table u_stock_log_detail add   `from_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log_detail add   `from_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
alter table u_stock_log_detail_his add   `from_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log_detail_his add   `from_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
 
 
 
 alter table u_stock_log add   `to_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log add   `to_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
alter table u_stock_log_his add   `to_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log_his add   `to_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
 
 
 
alter table u_stock_log_detail add   `to_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log_detail add   `to_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
alter table u_stock_log_detail_his add   `to_virtual_stock_type` int(10) default null COMMENT '虚拟仓类型';
alter table u_stock_log_detail_his add   `to_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称';
 
 
 
 
 