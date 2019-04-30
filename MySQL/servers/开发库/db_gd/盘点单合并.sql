

#---------------------变更表字段-------------------------------------------

alter table u_stock_log add `group_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后的单据编号';
alter table u_stock_log_his add `group_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后的单据编号';
alter table u_stock_log_detail add `group_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后的单据编号';
alter table u_stock_log_detail_his add `group_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后的单据编号';
 alter table u_stock_log  modify total_different_price decimal(20,2) DEFAULT NULL comment '盈亏金额（零售价），选填';
 alter table u_stock_log modify total_different_purchase_price  decimal(20,2) DEFAULT NULL comment '盈亏金额（进价），选填';
 alter table u_stock_log  modify total_price decimal(20,2) DEFAULT NULL COMMENT '零售金额，选填';
 alter table u_stock_log  modify  total_purchase_price decimal(20,2) DEFAULT NULL comment '进价金额，选填';
 alter table u_stock_log_his  modify total_different_price decimal(20,2) DEFAULT NULL comment '盈亏金额（零售价），选填';
 alter table u_stock_log_his modify total_different_purchase_price  decimal(20,2) DEFAULT NULL comment '盈亏金额（进价），选填';
 alter table u_stock_log_his  modify total_price decimal(20,2) DEFAULT NULL COMMENT '零售金额，选填';
 alter table u_stock_log_his  modify  total_purchase_price decimal(20,2) DEFAULT NULL comment '进价金额，选填';
alter table u_stock_log_detail modify purchase_price decimal(20,2) DEFAULT NULL COMMENT '进价   ';
alter table u_stock_log_detail modify total_purchase_price decimal(20,2) DEFAULT NULL COMMENT '进价金额';
alter table u_stock_log_detail modify total_price decimal(20,2) DEFAULT NULL COMMENT '合计，选填';
 alter table u_stock_log_detail modify total_different_num int(20) default null comment '盈亏数量';
 alter table u_stock_log_detail modify total_different_price decimal(20,2) DEFAULT NULL comment '盈亏金额（零售价），选填';
 alter table u_stock_log_detail modify total_different_purchase_price  decimal(20,2) DEFAULT NULL comment '盈亏金额（进价），选填';
alter table u_stock_log_detail_his modify purchase_price decimal(20,2) DEFAULT NULL COMMENT '进价   ';
alter table u_stock_log_detail_his modify total_purchase_price decimal(20,2) DEFAULT NULL COMMENT '进价金额';
alter table u_stock_log_detail_his modify total_price decimal(20,2) DEFAULT NULL COMMENT '合计，选填';
 alter table u_stock_log_detail_his modify total_different_num int(20) default null comment '盈亏数量';
 alter table u_stock_log_detail_his modify total_different_price decimal(20,2) DEFAULT NULL comment '盈亏金额（零售价），选填';
 alter table u_stock_log_detail_his modify total_different_purchase_price  decimal(20,2) DEFAULT NULL comment '盈亏金额（进价），选填';
alter table u_stock_log modify total_cost_price decimal(20,2) default null comment '成本金额';
alter table u_stock_log_his add total_cost_price decimal(20,2) default null comment '成本金额';
alter table u_stock_log_detail modify cost_price decimal(20,2) default null comment '门店成本价';
alter table u_stock_log_detail modify total_cost_price decimal(20,2) default null comment '成本金额';
alter table u_stock_log_detail_his modify cost_price decimal(20,2) default null comment '门店成本价';
alter table u_stock_log_detail_his modify total_cost_price decimal(20,2) default null comment '成本金额';
alter table u_stock_log add total_different_cost_price decimal(20,2) default null comment '盈亏成本金额';
alter table u_stock_log_his add total_different_cost_price decimal(20,2) default null comment '盈亏成本金额';
alter table u_stock_log_detail add total_different_cost_price decimal(20,2) default null comment '盈亏成本金额';
alter table u_stock_log_detail_his add total_different_cost_price decimal(20,2) default null comment '盈亏成本金额';



#-----------------添加枚举---------------------------
delete from mamahao_pos.u_dictionary where dictionary_name='CHECKBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 0, '待审核', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 8, '已审核', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 9, '待盘点', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 10, '已完成', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 12, '盘点中', 5, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 15, '已合并', 6, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);



select * from mamahao_pos.u_dictionary where dictionary_name='M_C_CHECKBILL_STATUS';
delete from mamahao_pos.u_dictionary where dictionary_name='M_C_CHECKBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('M_C_CHECKBILL_STATUS', '盘点单状态', 0, '待审核', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('M_C_CHECKBILL_STATUS', '盘点单状态', 8, '已审核', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('M_C_CHECKBILL_STATUS', '盘点单状态', 15, '已合并', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);







select count(1) from t_gb_stock;

create table t_gb_stock_20181122 as select * from t_gb_stock ;
create table t_gb_stock_20181123 as select * from t_gb_stock ;
create table t_gb_stock_20181124 as select * from t_gb_stock ;
create table t_gb_stock_20181125 as select * from t_gb_stock ;
create table t_gb_stock_20181126 as select * from t_gb_stock ;
create table t_gb_stock_20181127 as select * from t_gb_stock ;




select  distinct DATE_FORMAT(create_time,'%Y%m%d') , to_sid from u_stock_log  where bill_type=5 ;



#===================数据测试=================================
select * from t_gb_stock_20181127 where item_num_id=1100003851 and shop_id=1500000102;

update t_gb_stock_20181127 set qty=2000 where item_num_id=1100003851 and shop_id=1500000102;



create table t_gb_stock_20181202 as select * from t_gb_stock;


create table t_gb_stock_20181203 as select * from t_gb_stock;


select *   from u_stock_log  where bill_type=5 order by create_time desc limit 100;


select * from u_stock_log where id in ('MMH2018113010007651','MMH2018112710007355');
select * from u_stock_log_detail where id in ('MMH2018112710007354','MMH2018112710007355');

select * from u_stock_log where id in ('MMH2018112710007357');
select * from u_stock_log_detail where id in ('MMH2018112710007357');

select * from t_gb_stock_20181128 where item_num_id=1100003813 and shop_id=1500000106;

select * from t_gb_stock_20181123 where item_num_id=205832 and storage_id=1800000080;


update t_gb_stock set qty=22563  where item_num_id=1100003851 and shop_id=1500000102;

select *  from u_stock_log_detail where id='MMH2018112710007388';


create table t_gb_stock_20181128 as select * from t_gb_stock;


create table t_gb_stock_20181129 as select * from t_gb_stock;


select * from u_stock_log_detail_his where id in ('MMH2018112710007345','MMH2018112710007346');




