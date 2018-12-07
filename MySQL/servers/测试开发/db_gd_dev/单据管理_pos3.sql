
#------------------上线脚本-------------------------------

供应商信息表

drop table t_provider_info;
create table t_provider_info(
  seq_id bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键',
	provider_id bigint(18) comment '供应商ID, 必填#S|显示',
	provider_name varchar(32) comment '供应商名称, 必填#S|显示',
	linkman_name varchar(32) comment '联系人姓名，必填#S|显示',
	contact_number varchar(32) comment '联系电话，必填#S|显示',
	bussiness_model_type bigint(2) comment '经营方式：1 购销 2代销 3联营 必填#S|显示',
	opening_bank_name varchar(32) comment '开户行，选填',
	bank_account varchar(32) comment '开户账号，选填',
	bank_account_name varchar(32) comment '户名，选填',
	clearing_type bigint(2) comment '结算方式：1 预存款 2月结 3实销月结 4票到 5货到 #S|显示',
	clearng_cycle bigint(18) comment '结算周期，选填',
	create_time timestamp  comment '创建时间',
	update_time timestamp  comment '更新时间',
	tax_account varchar(32) comment '税务登记号,选填',
	provider_prv bigint(18) comment '供应商省份ID',
	provider_prv_name varchar(32) comment '供应商省份名称',	
	provider_city bigint(18) comment '供应商城市ID',
	provider_city_name varchar(32) comment '供应商城市名称',		
	provider_area bigint(18) comment '供应商区域ID',
	provider_area_name varchar(32) comment '供应商区域名称',	
	provider_add varchar(32) comment '供应商详细地址',
	user_id      		int(10)            comment '操作员ID，选填',               
	user         		varchar(50)        comment '操作员，选填',
	pre_seq_id bigint(18)   COMMENT '上条数据的主键',
PRIMARY KEY (`seq_id`)  
 ) comment '供应商信息表#S';


 
drop table t_provider_info_his;
create table t_provider_info_his comment '供应商信息历史表' as select * from t_provider_info where 1=2;

alter table t_provider_info_his modify seq_id bigint(18) NOT NULL AUTO_INCREMENT comment '默认自增主键';
alter table t_provider_info_his add to_his_time timestamp  comment '移历史时间';
alter table t_provider_info_his add to_his_user_id      		int(10)            comment '移历史操作员ID，选填';
alter table t_provider_info_his add to_his_user         		varchar(50)        comment '移历史操作员，选填';

drop table t_provider_goods;
create table t_provider_goods(
`seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键',
`style_num_id` bigint(18) DEFAULT NULL COMMENT '商品ID',
	provider_id bigint(18) comment '供应商ID, 必填',
	provider_name varchar(32) comment '供应商名称, 必填#S|显示',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间，选填',
PRIMARY KEY (`seq_id`)  
)comment '供应商商品信息表#S';

drop table t_provider_goods_his;
create table t_provider_goods_his as select * from t_provider_goods;
alter table t_provider_goods_his add to_his_time timestamp  comment '移历史时间';

select * from t_provider_goods;



drop table u_stock_log;
CREATE TABLE `u_stock_log` (
`seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键',
`id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单据编号，必填  #AC|显示，必填#AS|显示',
`style_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称，选填',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间，选填',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填#AS|显示',
`status` int(10) DEFAULT NULL COMMENT '状态0 待审核    1 待收货 2 已收货 3 部分收货 4 已取消 5 调货中 6 待编辑 7 已拒绝 8已审核 9待盘点 10 已完成  11 待处理 选填#AS|显示',
`user_id` int(10) DEFAULT NULL COMMENT '操作员ID，选填',
`user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作员，选填',
`pay_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '付款方式，0现金1银行卡2欠款,多选时逗号分隔，单据类型为0时必填',
`from_sid` bigint(10) DEFAULT NULL COMMENT '发出仓库或门店（包含入库仓库、发往店铺），操作发货时必填#AS|显示',
`from_sid_name` varchar(32)  DEFAULT NULL COMMENT '发出仓库或门店名称（包含入库仓库、发往店铺）|必填#AS|显示',
`from_sid_type` int(10) DEFAULT NULL COMMENT '发出仓库类型，操作发货时必填',
`from_staff_id` int(10) DEFAULT NULL COMMENT '发货方责任人ID，操作发货时必填',
`from_staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发货方责任人名称、采购人名称，操作发货时必填#AS|显示',
`delivery_time` datetime DEFAULT NULL COMMENT '发货时间，操作发货时必填',
`to_sid` bigint(10) DEFAULT NULL COMMENT '发往仓库货门店、盘点门店，操作发货时必填 #AC|显示，必填#AS|显示',
`to_sid_type` int(10) DEFAULT NULL COMMENT '发往仓库类型，操作发货时必填 #AC|显示，必填',
 to_sid_name  varchar(32)  DEFAULT NULL COMMENT '发往仓库名称，操作发货时必填 #AC|显示，必填#AS|显示',
 `apply_sid` bigint(10) DEFAULT NULL COMMENT '创建门店 #AC|显示，必填',
`apply_sid_type` int(10) DEFAULT NULL COMMENT '创建门店类型  #AC|显示，必填',
 apply_sid_name  varchar(32)  DEFAULT NULL COMMENT '创建门店名称 #AC|显示，必填',
`to_staff_id` int(10) DEFAULT NULL COMMENT '收货方责任人ID，操作收货时必填',
`to_staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货方责任人名称，操作收货时必填',
`apply_staff_id` int(10) DEFAULT NULL COMMENT '调拨入库单申请员工ID',
`apply_staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '调拨入库单申请员工名称AS|显示',
`audit_staff_id` int(10) DEFAULT NULL COMMENT '审核人ID|隐藏',
`audit_staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核人名称',
`receipt_time` datetime DEFAULT NULL COMMENT '收货时间，操作收货时必填',
`apply_time` datetime DEFAULT NULL COMMENT '调拨入库单申请时间，新建调拨入库单时必填',
 total_different_num int(10) default null comment '盈亏数量',
 total_different_price decimal(20,2) DEFAULT NULL comment '盈亏金额（零售价），选填',
 total_different_purchase_price  decimal(20,2) DEFAULT NULL comment '盈亏金额（进价），选填',
`provider_id` int(10) DEFAULT NULL COMMENT '供应商ID 选填',
`provider_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供应商名称，选填',
`remark` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注，选填#AS|显示',
`bill_type` int(10) DEFAULT NULL COMMENT '单据类型枚举： 0采购单 1调拨出库单 2调拨入库单 3退货单 4门店领用单 5 盘点单 20 APP查询入库传参  必填 #AC|显示，必填#AS|显示',
`total_from_num` int(10) DEFAULT NULL COMMENT '采购总数量，发货总数量，选填#AS|显示',
`total_price` decimal(20,2) DEFAULT NULL COMMENT '零售金额，选填',
total_purchase_price decimal(20,2) DEFAULT NULL comment '进价金额，选填',
 operate_type int(2) DEFAULT NULL comment '操作类型：0 采购 1 收货 2 盘点 3 保存 4 申请  5 同意 6 拒绝 7取消 8创建 9验货 10 部分收货  11扫码收货 13扫码保存 19 扫码验货 20 删除 #AC|显示，必填',
 check_status  int(10) DEFAULT 0 COMMENT '验货状态0 未验货 1已验货 选填#AS|显示',
 total_check_num int(10) DEFAULT NULL COMMENT '已验货数量 选填#',
 detail_num int(10) DEFAULT NULL COMMENT 'sku数量 选填#AS|显示',
 total_apply_from_num int(10) DEFAULT NULL COMMENT '申请调拨数量汇总 创建调拨申请单时必填',
 total_to_num int(10) DEFAULT NULL COMMENT '已验收数量 收货数量 选填',
 total_app_to_num int(10) DEFAULT NULL COMMENT 'App临时保存的验收数量 收货数量 选填',
 src_type int(10) DEFAULT NULL COMMENT ' 数据来源 ',
PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci comment '单据记录表 #AC#AS';

create index u_stock_log_idx_id on u_stock_log(id);
create index u_stock_log_detail_idx_2 on u_stock_log_detail(to_sid,bill_type);
create index u_stock_log_detail_idx_3 on u_stock_log_detail(from_sid,bill_type);


drop  table u_stock_log_his;
CREATE TABLE `u_stock_log_his` comment '单据记录表' as select * from u_stock_log where 1=2;
alter table u_stock_log_his add `pre_seq_id` bigint(18) DEFAULT NULL COMMENT '操作前记录的主键';
alter table u_stock_log_his add move_time timestamp  COMMENT '移入历史表的时间';

select * from u_stock_log_his;


drop table u_stock_log_detail;
CREATE TABLE `u_stock_log_detail` (
`seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
`id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单据编号，必填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
`style_num_id` bigint(18) DEFAULT NULL COMMENT '商品ID   #AC|显示，必填#AU|显示',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间   |选填|显示',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填   ',
`status` int(10) DEFAULT NULL COMMENT '状态0 待审核    1 待收货 2 已收货 3 部分收货 4 已取消 5 调货中 6 待编辑 7 已拒绝 8已审核 9待盘点 10 已完成  11 待处理 选填#AS|显示  ',
`style_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品货号，必填  ',
`style_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称，必填   #AS|显示#R|显示',
purchase_price decimal(20,2) DEFAULT NULL COMMENT '进价   ',
total_purchase_price decimal(20,2) DEFAULT NULL COMMENT '进价金额',
`price` decimal(10,2) DEFAULT NULL COMMENT '价格，必填',
`num` int(10) DEFAULT NULL COMMENT '本次收货数量 实际收货数量，收货时必填#U|显示',
apply_from_num int(10) DEFAULT NULL COMMENT '申请调拨数量 创建调拨申请单时必填',
from_num int(10) DEFAULT NULL COMMENT '采购数量 实际调拨数量，创建采购单时 盘点单用于存放库存总数量 必填 #U|显示#AC|显示，必填#AS|显示#AU|显示#R|显示',
to_num int(10) DEFAULT NULL COMMENT '已收货数量 实际调拨数量，选填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
app_to_num int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填',
`from_qty` int(10) DEFAULT NULL COMMENT '发货方库存，必填 #AC|显示，必填',
`to_qty` int(10) DEFAULT NULL COMMENT '收货方库存，必填 #AC|显示，必填',
`qty` int(10) DEFAULT NULL COMMENT '当前门店app库存，必填 #AC|显示，必填',
`total_qty` int(10) DEFAULT NULL COMMENT '当前门店总库存，必填 #AC|显示，必填',
 p_qty int(10) DEFAULT NULL COMMENT '当前门店公共库存，必填 #AC|显示，必填',
`from_p_qty` int(10) DEFAULT NULL COMMENT '发货方公共调拨库存，必填 #AC|显示，必填',
`to_p_qty` int(10) DEFAULT NULL COMMENT '收货方公共调拨库存，必填 #AC|显示，必填',
`total_price` decimal(20,2) DEFAULT NULL COMMENT '合计，选填',
 total_different_num int(20) default null comment '盈亏数量',
 total_different_price decimal(20,2) DEFAULT NULL comment '盈亏金额（零售价），选填',
 total_different_purchase_price  decimal(20,2) DEFAULT NULL comment '盈亏金额（进价），选填',
`unit_id` int(10) DEFAULT NULL COMMENT '单位类型，必填',
`unit` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位名称，必填#AS|显示',
`barcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条码，必填#AS|显示#R|显示',
`item_num_id` bigint(18) DEFAULT NULL COMMENT '规格ID，必填#U|显示#AC|显示，必填#AS|显示#AU|显示',
`sku_title_one` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第一标题，选填',
`sku_title_two` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第二标题，选填',
`shelf_life` int(18) DEFAULT '0' COMMENT '保质期天数,0表示不限制天数，默认值为0，选填',
 produce_date timestamp default null comment '生产日期，选填',
`one_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第一标题对应的值，必填#AS|显示',
`goods_brand_id` int(10) DEFAULT NULL COMMENT '品牌类型',
`goods_brand_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称',
`goods_type` int(10) DEFAULT NULL COMMENT '商品类型',
`to_sid` bigint(10) DEFAULT NULL COMMENT '发往仓库货门店，操作发货时必填#AU|显示',
`to_sid_type` int(10) DEFAULT NULL COMMENT '发往仓库类型，操作发货时必填',
 `apply_sid` bigint(10) DEFAULT NULL COMMENT '创建门店 #AC|显示，必填',
`apply_sid_type` int(10) DEFAULT NULL COMMENT '创建门店类型  #AC|显示，必填',
`from_sid` bigint(10) DEFAULT NULL COMMENT '发出仓库或门店（包含入库仓库、发往店铺），操作发货时必填',
`from_sid_type` int(10) DEFAULT NULL COMMENT '发出仓库类型，操作发货时必填',
`to_staff_id` int(10) DEFAULT NULL COMMENT '收货方责任人ID，操作收货时必填#U|显示',
`to_staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货方责任人名称，操作收货时必填#U|显示',
`from_staff_id` int(10) DEFAULT NULL COMMENT '发货方责任人ID，操作发货时必填',
`from_staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发货方责任人名称、采购人名称，操作发货时必填',
`bill_type` int(10) DEFAULT NULL COMMENT '单据类型枚举： 0采购单 1调拨出库单 2调拨入库单 3退货单 4门店领用单 5 盘点单 20 APP查询入库传参 必填#U|显示#AS|显示#AU|显示',
 check_result int(2) DEFAULT NULL comment '盘点状态：0 盘亏 1 盘盈#U|显示',
 operate_type int(2) DEFAULT NULL comment '操作类型：0 采购 1 收货 2 盘点 3 保存 4 申请  5 同意 6 拒绝 7取消 8创建 9验货 10 部分收货 11扫码收货 13扫码保存 12扫码盘点  19 扫码验货 20 删除 #AC|显示，必填#AU|显示',
 check_status  int(10) DEFAULT 0 COMMENT '验货状态0 未验货 1已验货 选填#U|显示#AU|显示',
 check_num int(10) DEFAULT NULL COMMENT '已验货数量、盘点数量 选填#U|显示#AC|显示，必填#AU|显示',
  src_type int(10) DEFAULT NULL COMMENT ' 数据来源 ',
PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci comment '单据记录明细表#U#AC#AS#AU#R';

alter table u_stock_log_detail modify from_num int(10) DEFAULT NULL COMMENT '采购数量 实际调拨数量，创建采购单时 盘点单用于存放库存总数量 必填 #U|显示#AC|显示，必填#AS|显示#AU|显示#R|显示';

 alter table u_stock_log_detail modify  produce_date timestamp default null comment '生产日期，选填';

create index u_stock_log_detail_idx_id on u_stock_log_detail(id);


drop table u_stock_log_detail_his;
create table u_stock_log_detail_his as select * from u_stock_log_detail;
alter table u_stock_log_detail_his add pre_seq_id bigint(18) DEFAULT NULL COMMENT '操作前记录的主键';
alter table u_stock_log_detail_his add move_time timestamp  COMMENT '移入历史表的时间';


#----------------20181107  采购订单增加 门店成本价 成本金额------------------------------------

alter table u_stock_log add total_cost_price decimal(10,2) default null comment '成本金额';

alter table u_stock_log_detail add box_num int(10) default null comment '整箱数量';
alter table u_stock_log_detail add cost_price decimal(10,2) default null comment '门店成本价';
alter table u_stock_log_detail add total_cost_price decimal(10,2) default null comment '成本金额';


alter table u_stock_log_detail_his add box_num int(10) default null comment '整箱数量';
alter table u_stock_log_detail_his add cost_price decimal(10,2) default null comment '门店成本价';
alter table u_stock_log_detail_his add total_cost_price decimal(10,2) default null comment '成本金额';


==========================
CREATE TABLE `t_gb_stock` (
  `src` varchar(4) NOT NULL DEFAULT '',
  `shop_id` bigint(20) NOT NULL,
  `storage_id` bigint(20) NOT NULL,
  `item_num_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '支持app售卖的 库存',
  `p_qty` int(11) NOT NULL DEFAULT '0' COMMENT '公共仓库库存',
  `in_qty` int(11) NOT NULL DEFAULT '0' COMMENT '入库途中的库存数量',
  `out_qty` int(11) NOT NULL DEFAULT '0' COMMENT '出库途中的库存数量',
  `gb_update_time` datetime DEFAULT NULL,
  `mmh_update_time` timestamp NULL DEFAULT NULL,
  `loc_pty_num_id` bigint(20) NOT NULL,
  `scan_status` int(2) DEFAULT '0' COMMENT '0待扫描，1已扫描，2失败',
  `scan_update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`src`,`shop_id`,`storage_id`,`item_num_id`,`loc_pty_num_id`),
  KEY `idex_gb_stock_shop_id` (`shop_id`),
  KEY `idex_gb_stock_storage_id` (`storage_id`),
  KEY `idex_gb_stock_item_id` (`item_num_id`),
  KEY `idex_gb_stock_mmh_update_time` (`mmh_update_time`),
  KEY `idex_gb_stock_src` (`src`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


alter table t_gb_stock modify   shop_id bigint(20) NOT NULL comment '门店ID' ;
alter table t_gb_stock modify   `storage_id` bigint(20) NOT NULL  comment '仓库ID' ;
 alter table t_gb_stock modify  `item_num_id` bigint(20) NOT NULL  comment 'skuId' ;

  alter table t_gb_stock modify produce_date timestamp default null comment '生产日期，选填',

==================
alter table u_stock_log_detail add src_type int(10) DEFAULT NULL COMMENT '数据来源';
alter table u_stock_log_detail add app_to_num int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填';

alter table u_stock_log_detail_his add src_type int(10) DEFAULT NULL COMMENT ' 数据来源 ';
alter table u_stock_log_detail_his add app_to_num int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填';


alter table u_stock_log add src_type int(10) DEFAULT NULL COMMENT '数据来源';
alter table u_stock_log add total_app_to_num int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填';

alter table u_stock_log_his add src_type int(10) DEFAULT NULL COMMENT ' 数据来源 ';
alter table u_stock_log_his add total_app_to_num int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填';

======================

select * from t_gb_stock limit 100;

drop table u_goods_stock_log;
create table u_goods_stock_log(
seq_id          bigint(18) NOT NULL AUTO_INCREMENT  COMMENT '默认自增主键',
id              varchar(32)        comment '单据编号' ,      
item_num_id     bigint(18)        comment '规格ID',
style_num_id  	bigint(18)         comment '商品ID',  
create_time  		TIMESTAMP   DEFAULT CURRENT_TIMESTAMP   comment '制单时间',  
style_code      varchar(32)        comment '商品货号',
style_title    	varchar(255)       comment '商品名称',                
price        		decimal(10,2)        comment '价格',  
total_price  		decimal(10,2)        comment '总金额', 
sid             int(10)               comment '仓库货门店',  
sid_name     varchar(32)          comment '门店名称',
sid_type     int(10)               comment '仓库类型',
pre_qty   int(10)               comment '变化前售卖库存',
pre_p_qty int(10)            comment '变化前公共库存',
qty_change   int(10)     default 0          comment '售卖库存变化',
p_qty_change int(10)   default 0         comment '公共库存变化',
staff_id     int(10)            comment '责任人ID',
staff_name   varchar(32)        comment '责任人名称',
user_id      		int(10)            comment '操作员ID',               
user         		varchar(50)        comment '操作员',  
operate_type     int(10)            comment '操作类型', 
pre_seq_id     bigint(18)          comment '引起变化的单据主键',
one_value       varchar(32)        comment '规格第一标题对应的值，必填',
bill_type       int(10)            comment '单据类型枚举： 0总部进货单 1总部发货单 2门店入库单 3门店退货单 4门店领用单，必填',
PRIMARY KEY (`seq_id`)
);
alter table u_goods_stock_log modify total_price decimal(10,2) comment '合计，选填';
alter table u_goods_stock_log modify price decimal(10,2) comment  '价格，必填';


select  * from u_goods_stock_log;


drop table u_goods_stock_log;
CREATE TABLE `u_goods_stock_log` (
`seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键',
`id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单据编号',
`item_num_id` bigint(18) DEFAULT NULL COMMENT '规格ID',
`style_num_id` bigint(18) DEFAULT NULL COMMENT '商品ID',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间',
`style_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品货号',
`style_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
`price` decimal(10,2) DEFAULT NULL COMMENT '价格，必填',
`total_price` decimal(10,2) DEFAULT NULL COMMENT '合计，选填',
`sid` int(10) DEFAULT NULL COMMENT '仓库货门店',
`sid_type` int(10) DEFAULT NULL COMMENT '仓库类型',
`qty_change` int(10) DEFAULT NULL COMMENT '货品变化',
`staff_id` int(10) DEFAULT NULL COMMENT '责任人ID',
`staff_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '责任人名称',
`user_id` int(10) DEFAULT NULL COMMENT '操作员ID',
`user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作员',
`pre_seq_id` bigint(18) DEFAULT NULL COMMENT '引起变化的单据主键',
`one_value` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第一标题对应的值，必填',
`bill_type` int(10) DEFAULT NULL COMMENT '单据类型枚举： 0采购单 1调拨出库单 2调拨入库单 3退货单 4门店领用单 5 盘点单 必填',
`before_update_qty` int(10) DEFAULT NULL COMMENT '更新前库存',
 operate_type int(2) DEFAULT NULL comment '操作类型：0 采购 1 收货 2 盘点 3 保存 4 申请  5 同意 6 拒绝 7取消',
PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=745 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci comment '库存变化日志表';

------------------添加枚举表-------------------
 
 select * from u_dictionary where dictionary_name='CHECKBILL_STATUS';
 
 
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) VALUES ('CHECKBILL_STATUS', '状态', 0, '待审核', 1, NULL, '', NULL, NULL, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) VALUES ('CHECKBILL_STATUS', '状态', 8, '已审核', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 
  delete from  `mamahao_pos`.`u_dictionary` where dictionary_name='BUSSINESS_MODEL_TYPE';
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
 VALUES ('BUSSINESS_MODEL_TYPE', '经营方式', 1, '购销', 1, NULL, '', NULL, NULL, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('BUSSINESS_MODEL_TYPE', '经营方式', 2, '代销', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('BUSSINESS_MODEL_TYPE', '经营方式', 3, '联营', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 
   delete from  `mamahao_pos`.`u_dictionary` where dictionary_name='CLEARING_TYPE';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CLEARING_TYPE', '结算方式', 1, '预付款', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CLEARING_TYPE', '结算方式', 2, '月结', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CLEARING_TYPE', '结算方式', 3, '实销月结', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CLEARING_TYPE', '结算方式', 4, '票到', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CLEARING_TYPE', '结算方式', 5, '货到', 5, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);


1 待收货 2 已收货 3 部分收货

INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('RECEIPT_STATUS', '收货状态', 1, '未收货', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('RECEIPT_STATUS', '收货状态', 2, '全部收货', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('RECEIPT_STATUS', '收货状态', 3, '部分收货', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);

 REFUNDBILL_STATUS
 delete from mamahao_pos.u_dictionary where dictionary_name='REFUNDBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 0, '待处理', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 1, '待收货', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
  
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 2, '已收货', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 4, '已取消', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);

 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('REFUNDBILL_STATUS', '退货单状态', 6, '待编辑', 5, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);


 STOCKINBILL_STATUS
 select * from `mamahao_pos`.`u_dictionary` where dictionary_name='STOCKINBILL_STATUS';
 delete from  `mamahao_pos`.`u_dictionary` where dictionary_name='STOCKINBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('STOCKINBILL_STATUS', '调拨入库单状态', 11, '待处理', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('STOCKINBILL_STATUS', '调拨入库单状态', 5, '调货中', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('STOCKINBILL_STATUS', '调拨入库单状态', 2, '已收货', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('STOCKINBILL_STATUS', '调拨入库单状态', 4, '已取消', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('STOCKINBILL_STATUS', '调拨入库单状态', 6, '待编辑', 5, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('STOCKINBILL_STATUS', '调拨入库单状态', 7, '已拒绝', 6, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);


DELIVERBILL_STATUS
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

CHECKBILL_STATUS


select * from mamahao_pos.u_dictionary where dictionary_name='CHECKBILL_STATUS';
delete from mamahao_pos.u_dictionary where dictionary_name='CHECKBILL_STATUS';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 0, '待审核', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 8, '已审核', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 9, '待盘点', 3, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
 INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('CHECKBILL_STATUS', '盘点单状态', 10, '已完成', 4, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);


select * from mamahao_pos.u_dictionary where dictionary_name='M_C_CHECKBILL_STATUS';
delete from mamahao_pos.u_dictionary where dictionary_name='MCOND_CHECKBILL_STAT';
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('M_C_CHECKBILL_STATUS', '盘点单状态', 0, '待审核', 1, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);
INSERT INTO `mamahao_pos`.`u_dictionary`( `dictionary_name`, `dictionary_desc`, `dictionary_value`, `dictionary_comment`, `dictionary_value_order`, `dictionary_parent_name`, `dictionary_parent_value`, `dictionary_redundant_name`, `dictionary_redundant_value`, `create_time`, `update_time`, `available`) 
VALUES ('M_C_CHECKBILL_STATUS', '盘点单状态', 8, '已审核', 2, '', '', NULL, 0, '2018-07-19 12:45:55', '2018-07-19 12:45:55', 1);



 	bussiness_model_type bigint(2) comment '经营方式：0 购销 1代销 2联营 必填#S|显示',

	clearing_type bigint(2) comment '结算方式：0 预存款 1月结 2实销月结 3票到 4货到 #S|显示',
	
	#----------------添加自增序列----------------------------
	insert into t_seq values('stock_log_id',10000000,10000000,1,99999999);
	insert into t_seq values('provider_id',10000,10000,1,99999999);

#-----------------自增序列---------------------------------

alter table t_seq modify start_value bigint(18) not null;
alter table t_seq modify now_value bigint(18) not null;
alter table t_seq modify increment_value bigint(18) not null;
alter table t_seq modify max_value bigint(18) not null;
#-----------------

drop table t_seq;
create table t_seq (
	name varchar(50) not null primary key,
	start_value int not null,
	now_value int not null,
	increment_value int not null default 1,
	max_value int not null
);

delete from t_seq;
insert into t_seq values('stock_log_id',100000,100000,1,999999);
select * from t_seq;

drop function  nextval;

create function nextval(str varchar(50)) returns integer
begin
	declare j int ;
	declare i int;
	select now_value ,max_value into i,j from u_seq where name=str for update;
	if i=j then 
		update u_seq set now_value=start_value where name=str;
	else 
	update u_seq
		set now_value=i+increment_value
	where name=str;
	end if;
 return i;
end;



select nextval('stock_log_id');
#-----------------字典表----------------------------------
select * from u_dictionary;

#------------------测试------------------------------------

insert into u_stock_log(id,style_num_id)values('MMH20170801001',12345);

insert into u_seq values('stock_log_id',#自增序列名称
10000, #开始值
10000,#当前值
1, #每次增加多少
99999#最大值
);

insert into u_seq values('stock_id',#自增序列名称
10000, #开始值
10000,#当前值
1, #每次增加多少
99999#最大值
);
select nextval('stock_log_id') from dual;



update u_stock_log set style_num_id=1234 where seq_id=1;


#delete from u_stock_log;
select  * from mamahao_pos.u_staff where staff_phone=15532123123;
select * from u_stock_log where id='MMH2018101611459';



delete  from u_stock_log;
delete from u_stock_log_detail;




delete from u_goods_stock;

select * from u_stock_log;
select * from U_stock_log_his;
select * from u_stock_log_detail;
select * from u_goods_stock;
select * from u_goods_stock_log;
select * from u_style_goods;

#----------------------------插入需要的商品--------------------------
INSERT INTO `mamahao_pos`.`u_style_goods`(`style_num_id`, `style_code`, `goods_type`, `style_unit_id`, `style_unit_name`, `goods_brand_id`, `good_supplier`, `style_title`, `style_pic`, `online`, `shelf_life`, `qty_warn`, `day_warn`, `sku_title_one`, `sku_title_two`, `create_time`, `update_time`) VALUES 
(123456, 'styleCode1111', 1, 1, '个', 1, 1, '测试插入实体1111', 'tttttttttttt,mmmmmmmmmmmmmm.asdfpj', 1, 10, 12, 11, '测试颜色', '测试尺码', '2018-07-10 17:24:05', '2018-07-17 22:39:28');
INSERT INTO `mamahao_pos`.`u_style_goods`(`style_num_id`, `style_code`, `goods_type`, `style_unit_id`, `style_unit_name`, `goods_brand_id`, `good_supplier`, `style_title`, `style_pic`, `online`, `shelf_life`, `qty_warn`, `day_warn`, `sku_title_one`, `sku_title_two`, `create_time`, `update_time`) VALUES 
(123457, 'styleCode1111', 1, 1, '个', 1, 1, '测试插入实体1111', 'tttttttttttt,mmmmmmmmmmmmmm.asdfpj', 1, 10, 12, 11, '测试颜色', '测试尺码', '2018-07-10 17:24:05', '2018-07-17 22:39:28');

#------------------------创建测试环境--------------------------

select * from mamahao_pos.u_staff;
select * from mamahao_pos.u_staff where staff_id=6;
select * from mamahao_pos.u_staff where staff_work_number in (13100929,13100928);

update mamahao_pos.u_staff set shop_id=1800000001 where staff_work_number=13100929;

wgnzd:----------->a84d92caaaea25644909730d550f4233
wgnfd:----------->5a74eaaf73b080a883d9dbfe3e553cde
wgnck:----------->37b980c9c85259ff7889ebcd5022c3c1
-----------------------------------------------------
wgnzd1:----------->cb817d52e83130382e9e470643ad7099
wgnfd1:----------->08937b505875c7f5ceb2b3c047c4b819
wgnck1:----------->d2f096603deb4c6dea8eba55114a73c3


delete from `mamahao_pos`.`u_staff` where staff_id=666;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (666, 'flc', 'flc', '15570012345', 'ab3696b69ef54f7be1e3c23d345f8474', 1, 1,1500000001 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);

delete from `mamahao_pos`.`u_staff` where staff_id=1000133;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (1000133, 'flc', 'flc', '15570012345', 'ab3696b69ef54f7be1e3c23d345f8474', 1, 1,1500000001 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);

delete from `mamahao_pos`.`u_staff` where staff_id=888;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (888, 'wgnfd', 'wgn分店', '15570012306', '5a74eaaf73b080a883d9dbfe3e553cde', 1, 5,1500000001 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);

delete from `mamahao_pos`.`u_staff` where staff_id=999;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (999, 'wgnzd', 'wgn总店', '15570012345', 'a84d92caaaea25644909730d550f4233', 1, 1,1 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);


delete from `mamahao_pos`.`u_staff` where staff_id=666666;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (666666, 'wgnck', '王冠楠仓库', '15570012305', '37b980c9c85259ff7889ebcd5022c3c1', 1, 47,1800000001 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);



delete from `mamahao_pos`.`u_staff` where staff_id=9991;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (9991, 'wgnzd1', 'wgn1总店', '15570012345', 'cb817d52e83130382e9e470643ad7099', 1, 1,1 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);


delete from `mamahao_pos`.`u_staff` where staff_id=6666661;
select * from `mamahao_pos`.`u_staff`  where staff_id=6666661;
INSERT INTO `mamahao_pos`.`u_staff`(`staff_id`, `staff_work_number`, `staff_name`, `staff_phone`, `staff_pwd`, `staff_sex`, `role_type`, `shop_id`, `state`, `remark`, `offer_date`, `create_time`, `update_time`, `staff_birthday`, `staff_pic`, `staff_tags`, `dispatch_password`) 
VALUES (6666661, 'wgnck1', 'wgn1仓库', '15570012345', 'd2f096603deb4c6dea8eba55114a73c3', 1, 47,1800000001 , 1, 'aaa', '2018-07-08', '2018-08-14 16:52:16', '2018-08-21 14:45:32', '1990-08-14', 'https://img.mamahao.com/s/m/images/bd_touxiang.png', '人好,漂亮,手法好', NULL);




select * from mamahao_pos.u_staff where staff_id=6;


select * from mamahao_pos.u_staff where staff_id=888 for update;
commit;

update mamahao_pos.u_staff set shop_id=2100000001 where staff_id=6666666 ;


update mamahao_pos.u_staff set shop_id=2100000001 where staff_id=6666669;



update mamahao_pos.u_staff set shop_id=2100000001 where staff_id=6;

select staff.staff_id as userId, staff.staff_name as userName, staff.state as userState, staff.shop_id as shopId, shop.shop_status as shopState 
from mamahao_pos.u_staff staff, mamahao_pos.u_shop shop where staff.shop_id = shop.shop_id and staff.staff_work_number = 'wgn' and staff.staff_pwd = 'ab3696b69ef54f7be1e3c23d345f8474' ;

update  mamahao_pos.u_shop set shop_id=2100000001 where shop_id=143 ;



update mamahao_pos.u_staff set shop_id=1500000001 where shop_id=2100000001;
update mamahao_pos.u_staff set shop_id=1500000002 where shop_id=2100000002;
update mamahao_pos.u_staff set shop_id=1500000003 where shop_id=2100000003;
update mamahao_pos.u_staff set shop_id=1500000004 where shop_id=2100000004;
update mamahao_pos.u_staff set shop_id=1500000005 where shop_id=2100000005;
update mamahao_pos.u_staff set shop_id=1500000006 where shop_id=2100000006;
update mamahao_pos.u_staff set shop_id=1500000007 where shop_id=2100000007;
update mamahao_pos.u_staff set shop_id=1500000008 where shop_id=2100000008;
update mamahao_pos.u_staff set shop_id=1500000009 where shop_id=2100000009;


update mamahao_pos.u_staff set shop_id=1800000001 where shop_id=3100000001;
update mamahao_pos.u_staff set shop_id=1800000002 where shop_id=3100000002;
update mamahao_pos.u_staff set shop_id=1800000003 where shop_id=3100000003;
update mamahao_pos.u_staff set shop_id=1800000004 where shop_id=3100000004;
update mamahao_pos.u_staff set shop_id=1800000005 where shop_id=3100000005;
update mamahao_pos.u_staff set shop_id=1800000006 where shop_id=3100000006;
update mamahao_pos.u_staff set shop_id=1800000007 where shop_id=3100000007;
update mamahao_pos.u_staff set shop_id=1800000008 where shop_id=3100000008;
update mamahao_pos.u_staff set shop_id=1800000009 where shop_id=3100000009;



#---------------清除所有数据-----------------------

delete from u_stock_log;
delete from U_stock_log_his;
delete from u_stock_log_detail;
delete from u_goods_stock;
delete from u_goods_stock_log;

#---------------测试取消收货---------------------------
delete from u_stock_log;
INSERT INTO `mamahao_pos`.`u_stock_log`(`seq_id`, `id`, `style_title`, `create_time`, `update_time`, `status`, `user_id`, `user`, `pay_type`, `from_sid`, `from_sid_type`, `from_staff_id`, `from_staff_name`, `delivery_time`, `to_sid`, `to_sid_type`, `to_staff_id`, `to_staff_name`, `receipt_time`, `provider_id`, `provider_name`, `remark`, `bill_type`, `total_num`, `total_price`) VALUES (1, 'MMH2018071710050', '洗衣机..', '2018-07-17 17:18:37', '2018-07-17 17:38:16', 1, 1, '张三', 0, 98, 0, 123, '张三', '2018-07-11 11:00:00', 89, 1, NULL, NULL, '2018-07-11 23:00:00', 23, '', 'string', 1, 20, 2);

delete from u_stock_log_his;
INSERT INTO `mamahao_pos`.`u_stock_log_his`(`seq_id`, `id`, `create_time`, `update_time`, `status`, `user_id`, `user`, `pay_type`, `from_sid`, `from_sid_type`, `from_staff_id`, `from_staff_name`, `deliveryTime`, `to_sid`, `to_sid_type`, `to_staff_id`, `to_staff_name`, `provider_id`, `provider_name`, `receipt_time`, `remark`, `bill_type`, `pre_seq_id`) VALUES (1, 'MMH2018071710050', '2018-07-17 17:18:37', '2018-07-17 17:18:37', 0, 1, '张三', 0, 98, 0, 123, '张三', NULL, 89, 1, NULL, NULL, 23, '', '2018-07-11 23:00:00', '哈哈哈', 1, 1);
INSERT INTO `mamahao_pos`.`u_stock_log_his`(`seq_id`, `id`, `create_time`, `update_time`, `status`, `user_id`, `user`, `pay_type`, `from_sid`, `from_sid_type`, `from_staff_id`, `from_staff_name`, `deliveryTime`, `to_sid`, `to_sid_type`, `to_staff_id`, `to_staff_name`, `provider_id`, `provider_name`, `receipt_time`, `remark`, `bill_type`, `pre_seq_id`) VALUES (2, 'MMH2018071710050', '2018-07-17 17:18:37', '2018-07-17 00:00:00', 0, 1, '张三', 0, 98, 0, 123, '张三', NULL, 89, 1, NULL, NULL, 23, '', '2018-07-11 23:00:00', 'string', 1, 1);

delete from u_goods_stock;
INSERT INTO `mamahao_pos`.`u_goods_stock`(`id`, `style_num_id`, `item_num_id`, `shop_id`, `qty`, `create_time`, `update_time`) VALUES (6, 123456, 222222, 98, 240, '2018-07-16 20:52:16', '2018-07-17 17:18:59');
INSERT INTO `mamahao_pos`.`u_goods_stock`(`id`, `style_num_id`, `item_num_id`, `shop_id`, `qty`, `create_time`, `update_time`) VALUES (7, 123457, 111111, 98, 30, '2018-07-16 22:14:20', '2018-07-17 17:18:59');
INSERT INTO `mamahao_pos`.`u_goods_stock`(`id`, `style_num_id`, `item_num_id`, `shop_id`, `qty`, `create_time`, `update_time`) VALUES (8, 123456, 222222, 89, 200, '2018-07-17 10:20:46', '2018-07-17 17:38:38');
INSERT INTO `mamahao_pos`.`u_goods_stock`(`id`, `style_num_id`, `item_num_id`, `shop_id`, `qty`, `create_time`, `update_time`) VALUES (9, 123457, 111111, 89, 200, '2018-07-17 10:20:46', '2018-07-17 17:38:38');

select UNIX_TIMESTAMP("2018-07-11 23:00:00") FROM dual;

select * from u_stock_log;
select * from U_stock_log_his;
select * from u_stock_log_detail;
select * from u_goods_stock;
select * from u_goods_stock_log;

#--------------------作废进货单失败----------------------------
update u_goods_stock set qty=0;



select UNIX_TIMESTAMP(current_date()) from dual;

1532151598
1532151609
1532102400

select unix_timestamp(now()) ;
select current_timestamp from dual;


select LOCALTIMESTAMP(now());

select UNIX_TIMESTAMP();

SELECT count(0) FROM u_stock_log WHERE bill_type = 2 AND style_title LIKE '%洗衣机%' AND status = 0;

 SELECT id FROM u_stock_log_detail WHERE ( style_code = 346 and id =  and style_title like ?）
 
 select * from u_goods_stock ORDER BY create_time desc;
 
 #-----------------------------关联查询sql及测试-------------------------------------
 
 select * from u_stock_log t1 where exists(select 1 from u_stock_log_detail t2 where t1.id=t2.id );
 
 
 
select * from u_stock_log where  id='MMH2018072610547';
select * from u_stock_log_detail where  id='MMH2018072610547';
select * from u_goods_stock;
select * from u_goods_stock_log;

 
 
 
 ----------------
 # 供应商管理测试
 
 select * from t_provider_info ;
 select * from t_provider_info_his;
 
 select * from t_provider_goods;
 
 insert into db_gd_dev.t_provider_goods (style_num_id,provider_id)values(123456,10005);
 
 #delete from t_provider_info where provider_id is null;
 #delete from t_provider_info_his;
 

 ####————————————————————————————————————测试盘点单-------------------------------------------
 
 select * from u_stock_log_detail;
 
 #delete from u_stock_log_detail;
 #delete from u_stock_log;
 
  select * from u_stock_log ;
	
  select * from u_stock_log_detail;
 
  select * from u_stock_log where id='MMH2018091410113';
 select * from u_stock_log_detail where id='MMH2018091410113';
 
 
 update u_stock_log set check_status=1 , remark="哈哈" , status=8 where id='MMH2018091710118';
 
 delete from u_stock_log where seq_id=4;
delete from u_stock_log_detail where seq_id=2;
 
 update u_stock_log set status=9 where id='MMH2018091410113';
 
 
  update u_stock_log set status=9 where id='MMH2018091710133';
 
 #-----------------------加库存---------------------------
 
 select  * from t_gb_stock where storage_id="1800000073";
 
 select * from gb_storage where online_storage_name like '%sjm%';
 
  select  * from t_gb_stock where shop_id="1500000001" or storage_id=1800000001;
	
	
	  select  * from t_gb_stock where (shop_id="1500000001" or storage_id=1800000001 ) and item_num_id=2;
	
	  update t_gb_stock set qty=1000 where shop_id="1500000001" or storage_id=1800000001;
		
		delete from  t_gb_stock where shop_id="1500000001" or storage_id=1800000001;
		
				delete from  t_gb_stock where shop_id="1500000001" and item_num_id=2;
		
#------------------------库存变化记录----------------------------

select * from u_goods_stock_log where id='MMH2018100810821';


select * from u_goods_stock_log where id='MMH2018100911007';

select * from u_goods_stock_log where item_num_id=2;

delete from  u_goods_stock_log where item_num_id=2;

delete from  u_goods_stock_log 

# 清除有id 但是没有billType的数据

select * from u_goods_stock_log where id is not null and bill_type is null;

delete from u_goods_stock_log where id is not null and bill_type is null;


select * from u_goods_stock_log where id is  null;

#-----------------------店铺--------------------------
select * from gb_cort_sub_unit where sub_unit_num_id=1500000001;

select * from gb_storage where STORAGE_NUM_ID=1800000001;

	
	
 #----------------------- 采购单--------------------------
  select * from u_stock_log where bill_type=0 and status=7;
  select * from u_stock_log_detail where bill_type=0;
	
	  select * from u_stock_log_detail_his where bill_type=0;
   select * from u_stock_log order by update_time desc;
	
	  select * from u_stock_log_detail_his where id="MMH2018101811597" and operate_type=10 and item_num_id=1000313096;
	select * from u_stock_log where id="MMH2018101611486";
	select * from u_stock_log_detail where id="MMH2018101811597";
	
	
	update u_stock_log set audit_staff_name='wgn总店(首次),zengli(第二次),wgn总店(第三次),wgn总店(第四次)'  where id="MMH2018101611486";
	
	
	delete from u_stock_log where bill_type=0;
  delete from u_stock_log_detail where bill_type=0;
	
#------------------------盘点单---------------------------------
   select * from u_stock_log where bill_type=5;
  select * from u_stock_log_detail where bill_type=5;
	
	
		delete from u_stock_log where bill_type=5;
  delete from u_stock_log_detail where bill_type=5;
 
  delete from u_stock_log where id="MMH2018091910177";
delete from u_stock_log_detail where id="MMH2018091910177";


  select *  from u_stock_log where id="MMH2018101611438";
select * from u_stock_log_detail where id="MMH2018101611435";

delete from u_stock_log_detail where barcode='取消' and id="MMH2018092610431";


  update  u_stock_log  set status=9 where id="MMH2018092610430";
  update u_stock_log_detail set status=9 where id="MMH2018092610430";
 
 
 select * from u_goods_stock_log  where id='MMH2018111110001886';
  select * from u_goods_stock_log where item_num_id=2 and sid=1800000001  order by create_time desc;
 
 select * from t_gb_stock where item_num_id=2 and storage_id=1800000001;
 
  update t_gb_stock set qty=80 ,p_qty=20 where item_num_id=2 and storage_id=1800000001;
 
#---------------------直调出库单------------------------------
 
    select * from u_stock_log where bill_type=1;
  select * from u_stock_log_detail where bill_type=1;


  select *  from u_stock_log where id="MMH2018100911000";
select * from u_stock_log_detail where id="MMH2018100911000";
 
  delete from u_stock_log where bill_type=1;
  delete from u_stock_log_detail where bill_type=1;
	#--------------------领用单----------------------------------
	
	select * from u_stock_log where bill_type=4;
	
	#---------------------调拨入库单------------------------------
	
	select * from u_stock_log_detail where id='MMH2018102211740';
 
    select * from u_stock_log where bill_type=2;
  select * from u_stock_log_detail where bill_type=2;

  delete from u_stock_log where bill_type=2;
  delete from u_stock_log_detail where bill_type=2;
	
	select * from u_stock_log_detail where id='MMH2018100910963';
	
 #---------------------退货出库单-------------------------------
 
  
    select * from u_stock_log where bill_type=3;
  select * from u_stock_log_detail where bill_type=3;
	
	
	  
    select  from u_stock_log where bill_type=3;
 
 
   delete from u_stock_log where bill_type=3;
  delete from u_stock_log_detail where bill_type=3;
 
   update  u_stock_log  set status=1 where id="MMH2018092510410";
  update u_stock_log_detail set status=1 where id="MMH2018092510410";
	
	#----------------清理错误单据--------------------------------------
	
		 delete from u_stock_log_detail where status is null;
	 delete from u_stock_log  where status is null;
	 

	
    select distinct bill_type from u_stock_log where apply_staff_id is null;
		
		  select distinct bill_type from u_stock_log where apply_staff_id is not null;
			
				
	select * from t_gb_stock  where  storage_id=1800000080 and ( p_qty<0 or  qty<0);
	
	
	
#------------
1540007580
			
			
				select * from GB_CORT_SUB_UNIT order by update_time desc;
			
	
	select * from u_stock_deatil;
	
	
  create index `u_stock_log_idx_2` on u_stock_log (`to_sid`,`bill_type`);
  create index `u_stock_log_idx_3`  on u_stock_log (`from_sid`,`bill_type`);
			
					
		select * from u_stock_log where id='MMH2018110710001163';
		
		select * from u_stock_log_his where id='MMH2018110710001163';
		
		select * from u_goods_stock_log where id='MMH2018110710001163';
		
		
		
		