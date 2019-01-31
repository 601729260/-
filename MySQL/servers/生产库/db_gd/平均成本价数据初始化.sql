drop table t_average_cost_price_log;
CREATE TABLE `t_average_cost_price_log` (
 `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
	`id` varchar(32)  DEFAULT NULL COMMENT '单据编号',
	`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间   |选填|显示',
	`bill_type` int(10) DEFAULT NULL COMMENT '单据类型枚举',
   operate_type int(2) DEFAULT NULL comment '操作类型',	
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
	 sid_type int(10) DEFAULT NULL COMMENT '仓库类型',
	 change_num bigint(18) DEFAULT 0 COMMENT '库存变化' ,
  `item_num_id` bigint(18) NOT NULL DEFAULT 0 COMMENT 'sku id',
  `barcode` varchar(32)  DEFAULT NUll COMMENT '条码',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku 名称',
	`cost_price` decimal(20,2) DEFAULT '0.00' COMMENT '本次成本价',
  `purchase_price` decimal(20,2) DEFAULT '0.00' COMMENT '本次进价',
  `pre_total_cost_price` decimal(20,2) DEFAULT '0.00' COMMENT '门店成本总价',
  `pre_total_num` bigint(18) DEFAULT '0' COMMENT '商品数量',
	`pre_total_purchase_price` decimal(20,2) DEFAULT '0.00' COMMENT '总部成本价',
  `pre_total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量',
  `pre_avarage_cost_price` decimal(20,2) DEFAULT 0 COMMENT '门店平均成本价',
  `pre_avarage_purchase_price` decimal(20,2) DEFAULT 0 COMMENT '总部平均成本价',
	PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


alter table u_goods_stock_log add cost_price decimal(20,2) DEFAULT 0 comment '门店成本价'; 
alter table u_goods_stock_log add  purchase_price decimal(20,2) DEFAULT 0 COMMENT '进价';
alter table t_average_cost_price add 	`sid_type` int(10) DEFAULT NULL COMMENT '仓库类型';
alter table t_average_cost_price add 	create_time timestamp  COMMENT '创建时间';
alter table t_average_cost_price add 	update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间';

alter table t_average_cost_price modify   `total_cost_price` decimal(20,2) DEFAULT '0.00' COMMENT '门店成本总价';
alter table t_average_cost_price modify 	`barcode` varchar(32)  DEFAULT NULL COMMENT '条码';
alter table t_average_cost_price modify   `total_purchase_price` decimal(20,2) DEFAULT '0.00' COMMENT '总部成本价';
alter table t_average_cost_price modify   `total_num` bigint(18) DEFAULT '0' COMMENT '商品数量';
alter table t_average_cost_price modify   `total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量';
alter table t_average_cost_price modify   `avarage_cost_price` decimal(20,2) DEFAULT 0 COMMENT '门店平均成本价';
alter table t_average_cost_price modify   `avarage_purchase_price` decimal(20,2) DEFAULT 0 COMMENT '总部平均成本价';


alter table t_average_cost_price drop  PRIMARY KEY;
alter table t_average_cost_price add  PRIMARY KEY(sid,item_num_id);

alter table  t_average_cost_price modify `barcode` varchar(32)  DEFAULT NUll COMMENT '条码';
alter table  t_average_cost_price_log modify `barcode` varchar(32)  DEFAULT NUll COMMENT '条码';

drop table u_stock_log_detail;
CREATE TABLE `u_stock_log_detail` (
  `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
  `id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单据编号，必填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
  `style_num_id` bigint(18) DEFAULT NULL COMMENT '商品ID   #AC|显示，必填#AU|显示',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间   |选填|显示',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填   ',
  `status` int(10) DEFAULT NULL COMMENT '状态0 待审核 待处理 1 待收货 2 已收货 3 部分收货 4 已取消 5 调货中 6 待编辑 7 已拒绝 8已审核 9带盘点 选填  ',
  `style_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品货号，必填  ',
  `style_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称，必填   #AS|显示#R|显示',
  `purchase_price` decimal(20,2) DEFAULT NULL COMMENT '进价   ',
  `total_purchase_price` decimal(20,2) DEFAULT NULL COMMENT '进价金额',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格，必填',
  `num` int(10) DEFAULT NULL COMMENT '本次收货数量 实际收货数量，收货时必填#U|显示',
  `apply_from_num` int(10) DEFAULT NULL COMMENT '申请调拨数量 创建调拨申请单时必填',
  `from_num` int(10) DEFAULT NULL COMMENT '采购数量 实际调拨数量，创建采购单时 盘点单用于存放库存总数量 必填 #U|显示#AC|显示，必填#AS|显示#AU|显示#R|显示',
  `to_num` int(10) DEFAULT NULL COMMENT '已收货数量 实际调拨数量，选填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
  `from_qty` int(10) DEFAULT NULL COMMENT '发货方库存，必填 #AC|显示，必填',
  `to_qty` int(10) DEFAULT NULL COMMENT '收货方库存，必填 #AC|显示，必填',
  `qty` int(10) DEFAULT NULL COMMENT '当前门店app库存，必填 #AC|显示，必填',
  `total_qty` int(10) DEFAULT NULL COMMENT '当前门店总库存，必填 #AC|显示，必填',
  `p_qty` int(10) DEFAULT NULL COMMENT '当前门店公共库存，必填 #AC|显示，必填',
  `from_p_qty` int(10) DEFAULT NULL COMMENT '发货方公共调拨库存，必填 #AC|显示，必填',
  `to_p_qty` int(10) DEFAULT NULL COMMENT '收货方公共调拨库存，必填 #AC|显示，必填',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '合计，选填',
  `total_different_num` int(20) DEFAULT NULL COMMENT '盈亏数量',
  `total_different_price` decimal(20,2) DEFAULT NULL COMMENT '盈亏金额（零售价），选填',
  `total_different_purchase_price` decimal(20,2) DEFAULT NULL COMMENT '盈亏金额（进价），选填',
  `unit_id` int(10) DEFAULT NULL COMMENT '单位类型，必填',
  `unit` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位名称，必填#AS|显示',
  `barcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条码，必填#AS|显示#R|显示#U|显示',
  `item_num_id` bigint(18) DEFAULT NULL COMMENT '规格ID，必填#U|显示#AC|显示，必填#AS|显示#AU|显示',
  `sku_title_one` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第一标题，选填',
  `sku_title_two` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第二标题，选填',
  `shelf_life` int(18) DEFAULT '0' COMMENT '保质期天数,0表示不限制天数，默认值为0，选填',
  `produce_date` datetime DEFAULT NULL COMMENT '生产日期，选填',
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
  `check_result` int(2) DEFAULT NULL COMMENT '盘点状态：0 盘亏 1 盘盈#U|显示',
  `operate_type` int(2) DEFAULT NULL COMMENT '操作类型：0 采购 1 收货 2 盘点 3 保存 4 申请  5 同意 6 拒绝 7取消 8创建 9验货 10 部分收货 11扫码收货 13扫码保存 12扫码盘点  19 扫码验货 20 删除 #AC|显示，必填#AU|显示',
  `check_status` int(10) DEFAULT '0' COMMENT '验货状态0 未验货 1已验货 选填#AS|显示',
  `check_num` int(10) DEFAULT NULL COMMENT '已验货数量、盘点数量 选填#U|显示#AC|显示，必填#AU|显示',
  `src_type` int(10) DEFAULT NULL COMMENT '数据来源',
  `app_to_num` int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填',
  `box_num` int(10) DEFAULT NULL COMMENT '整箱数量',
  `cost_price` decimal(20,2) DEFAULT NULL COMMENT '门店成本价',
  `total_cost_price` decimal(20,2) DEFAULT NULL COMMENT '成本金额',
  `from_virtual_stock_type` int(10) DEFAULT NULL COMMENT '虚拟仓类型',
  `from_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称',
  `to_virtual_stock_type` int(10) DEFAULT NULL COMMENT '虚拟仓类型',
  `to_virtual_stock_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '虚拟仓名称',
  `tax_rate` decimal(10,2) DEFAULT NULL COMMENT '税率',
  `group_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后的单据编号',
  `total_different_cost_price` decimal(20,2) DEFAULT NULL COMMENT '盈亏成本金额',
  PRIMARY KEY (`seq_id`),
  KEY `u_stock_log_detail_idx_id` (`id`),
  KEY `u_stock_log_detail_idx_2` (`to_sid`,`bill_type`),
  KEY `u_stock_log_detail_idx_3` (`from_sid`,`bill_type`)
) ENGINE=InnoDB AUTO_INCREMENT=47557874 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单据记录明细表#U#AC#AS#AU#R';

drop table t_average_cost_price;
CREATE TABLE `t_average_cost_price` (
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
  `item_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'sku id',
  `sku_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sku 名称',
  `total_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '门店成本总价',
  `total_num` bigint(18) DEFAULT '0' COMMENT '商品数量',
  `avarage_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '门店平均成本价',
  `avarage_purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '总部平均成本价',
  `total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量',
  `total_purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '总部成本价',
  `sid_type` int(10) DEFAULT NULL COMMENT '仓库类型',
  `barcode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sid`,`item_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

drop table t_average_cost_price_log;
CREATE TABLE `t_average_cost_price_log` (
  `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
  `id` varchar(32) DEFAULT NULL COMMENT '单据编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间   |选填|显示',
  `bill_type` int(10) DEFAULT NULL COMMENT '单据类型枚举',
  `operate_type` int(2) DEFAULT NULL COMMENT '操作类型',
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
  `sid_type` int(10) DEFAULT NULL COMMENT '仓库类型',
  `change_num` bigint(18) DEFAULT '0' COMMENT '库存变化',
  `item_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'sku id',
  `barcode` varchar(32) DEFAULT NULL COMMENT '条码',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku 名称',
  `pre_total_cost_price` decimal(20,2) DEFAULT '0.00' COMMENT '门店成本总价',
  `pre_total_num` bigint(18) DEFAULT '0' COMMENT '商品数量',
  `pre_total_purchase_price` decimal(20,2) DEFAULT '0.00' COMMENT '总部成本价',
  `pre_total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量',
  `pre_avarage_cost_price` decimal(20,2) DEFAULT '0.00' COMMENT '门店平均成本价',
  `pre_avarage_purchase_price` decimal(20,2) DEFAULT '0.00' COMMENT '总部平均成本价',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;




alter table t_average_cost_price modify   `total_cost_price` decimal(20,2) DEFAULT '0.00' COMMENT '门店成本总价';
alter table t_average_cost_price modify 	`barcode` varchar(32)  DEFAULT NULL COMMENT '条码';
alter table t_average_cost_price modify   `total_purchase_price` decimal(20,2) DEFAULT '0.00' COMMENT '总部成本价';
alter table t_average_cost_price modify   `total_num` bigint(18) DEFAULT '0' COMMENT '商品数量';
alter table t_average_cost_price modify   `total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量';
alter table t_average_cost_price modify   `avarage_cost_price` decimal(20,2) DEFAULT 0 COMMENT '门店平均成本价';
alter table t_average_cost_price modify   `avarage_purchase_price` decimal(20,2) DEFAULT 0 COMMENT '总部平均成本价';




select count(1) from u_goods_stock_log;

select count(1) from  u_stock_log_detail ;

select count(1) from  u_stock_log_detail where cost_price is not null ;


select count(1) from  u_stock_log_detail where purchase_price is not null ;

select a.sid,a.item_num_id,a.cost_price,a.purchase_price,b.cost_price,b.purchase_price from u_goods_stock_log a 
left join u_stock_log_detail b on  a.id=b.id and a.item_num_id=b.item_num_id limit 100;

create table wgn_init_average_price(
seq_id bigint(18),
average_cost_price Decimal(10,2),
sid_name varchar(32),
barcode varchar(32),
sku_name varchar(255),
qty bigint(18),
total_cost_price decimal(10,2),
sid bigint(18)
	);
	
	truncate table wgn_init_average_price;
	
	select * from wgn_init_average_price;
	
insert into wgn_init_average_price (seq_id,average_cost_price,sid_name,barcode,sku_name ,qty ,total_cost_price ,sid ) values(%d,'%s','%s','%s',%d,%d,%d);
	
select * from wgn_init_average_price;


select count(1) from wgn_init_average_price;

select * from wgn_init_average_price limit 100;
alter table wgn_init_average_price add item_num_id bigint(18);

select count(1) from gb_share_item;





select  average_cost_price as 平均成本价,sid_name as 门店名称 ,barcode as 条码 , qty as 库存  ,sid as 门店ID from wgn_init_average_price where item_num_id is null;

---------------------------------------------------------------------------------------------------------

#create index index_barcode on wgn_init_average_price(barcode);
#create index index_barcode on gb_share_item(barcode_1);


create table  wgn_init_average_price_result as select * from wgn_init_average_price where item_num_id is not null;

create index index_item_sid on wgn_init_average_price_result(item_num_id,sid);
create index index_item_sid on u_goods_stock_log(item_num_id,sid);


#将单据上的进价金额 成本金额更新到日志表
update u_goods_stock_log a  
left join u_stock_log_detail b on  a.id=b.id and a.item_num_id=b.item_num_id
set a.cost_price=b.cost_price,a.purchase_price=b.purchase_price;

#将item_num_id 更新上去
update wgn_init_average_price  a 
left join gb_share_item b on a.barcode=b.barcode_1 
set a.item_num_id=b.item_num_id
where b.is_deleted=0;



update u_goods_stock_log a 
inner join wgn_init_average_price_result  b on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.cost_price=b.average_cost_price
where a.cost_price is null 
and a.sid!=1800000080;

update u_goods_stock_log a 
inner join wgn_init_average_price_result  b on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.purchase_price=b.average_cost_price
where a.purchase_price is null 
and a.sid=1800000080;

update u_goods_stock_log b 
inner join gb_share_item_ext a on a.item_num_id=b.item_num_id
set b.cost_price=a.cost_price/100
where b.cost_price is null;


update u_goods_stock_log b 
inner join gb_share_item_ext a on a.item_num_id=b.item_num_id
set b.purchase_price=a.purchase_price/100
where b.purchase_price is null;



update  u_goods_stock_log set cost_price=0 where cost_price is null;


update u_goods_stock_log set purchase_price=0 where purchase_price is null;

update u_goods_stock_log set sid_type=3 where sid in (1800000080,1800000088);




update  u_goods_stock_log set bill_type=300001 where bill_type is null;




truncate table t_average_cost_price;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,avarage_cost_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,2 from wgn_init_average_price_result b where b.sid!=1800000080;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,avarage_purchase_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,3 from wgn_init_average_price_result b where b.sid=1800000080;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b where b.sid!=1800000080 group by item_num_id;

update t_average_cost_price a 
inner join 
(select 1 as sid,item_num_id,sum(total_cost_price) as total_purchase_price,sum(qty) as total_purchase_num from wgn_init_average_price_result b where b.sid=1800000080 group by item_num_id) b
on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.total_purchase_price=b.total_purchase_price ,a.total_purchase_num=b.total_purchase_num 
where a.sid=1;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b
where b.sid=1800000080  and not exists(select 1 from t_average_cost_price  a where a.sid=1 and a.item_num_id=b.item_num_id) group by item_num_id;

update t_average_cost_price a  set avarage_cost_price=total_cost_price/total_num where total_num!=0 and sid=1;
update t_average_cost_price a set avarage_purchase_price=total_purchase_price/total_purchase_num where total_purchase_num!=0 and sid=1;

update  t_average_cost_price set avarage_cost_price=0 where avarage_cost_price is null;

update  t_average_cost_price set avarage_purchase_price=0 where avarage_purchase_price is null;

truncate table t_average_cost_price_log;
#----------------------------
select * from t_average_cost_price limit 10;

select count(1) from t_average_cost_price limit 10;

select count(1) from t_average_cost_price_log limit 100;
select * from t_average_cost_price where item_num_id=1000001813 and sid=1500000111;

select * from u_goods_stock_log where cost_price is null;

select count(1) from u_goods_stock_log;
select * from u_goods_stock_log where purchase_price is null;

select * from u_goods_stock_log where qty_change is null;



select * from  wgn_init_average_price_result limit 10001,10002;

select * from t_average_cost_price where item_num_id=1000001858 and sid=1500000111;

select * from t_average_cost_price_log where item_num_id=1000001858 and sid=1500000111;

select * from  wgn_init_average_price_result  where item_num_id=1000001858 and sid=1500000111;


select * from wgn_init_average_price_result where sid=1800000080 limit 100;

select * from t_average_cost_price where item_num_id=1000011120 and sid=1800000080;

select * from t_average_cost_price_log where item_num_id=1000011120 and sid=1800000080;



select * from t_average_cost_price_log  limit 100;








