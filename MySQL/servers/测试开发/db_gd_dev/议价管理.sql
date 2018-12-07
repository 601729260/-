
select * from t_shop_negotiate_price;
drop table t_shop_negotiate_goods;
create table t_shop_negotiate_goods(
`seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
`STYLE_ID` varchar(30) DEFAULT NULL COMMENT '款式编码',
`style_num_id` bigint(18) DEFAULT NULL COMMENT '商品ID   ',
`style_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称，必填   ',
`barcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条码',
`item_num_id` bigint(18) DEFAULT NULL COMMENT 'skuID，',
  `gt1_id` int(11)  COMMENT '一级类目ID',
  `gt1_name` varchar(20) COMMENT '一级类目名称',
  `gt2_id` int(11)  COMMENT '二级类目ID',
  `gt2_name` varchar(20) COMMENT '二级类目名称',
	`gt3_id` int(11)  COMMENT '三级类目ID',
  `gt3_name` varchar(20)  COMMENT '三级类目名称',
	`SID` int(11)  COMMENT 'type为0时为shopID，1：仓库ID',
  `b_id` int(11) COMMENT '品牌ID',
  `b_name` varchar(60)  COMMENT '品牌名称',
	config_type int(11) comment '配置类型 1 商品ID 2 类目 3 品牌',
	  PRIMARY KEY (`seq_id`)
);

select * from gb_style limit 10;

select * from gb_share_item limit 1;

select c.sid,a.item_num_id 
from gb_share_item a ,
    gb_style b ,
	  t_shop_negotiate_goods  c
where a.style_num_id=b.style_num_id
and c.sid= 111
and a.item_num_id in (1)
and (b.brand_id=c.b_id
or b.STYLE_CATELOG_THIRD=c.gt3_id
or a.ITEM_NUM_ID=c.item_num_id)
limit 10;

select  * from 


select * from u_stock_log where toid = 1500000001
select * from t_gb_stock where shop_id=1500000001;
select * from u_stock_log_detail where item_num_id=31266;



			
			select * from t_goods_type;
			
			CREATE TABLE `t_goods_type` (
  `gt_id` int(11) NOT NULL AUTO_INCREMENT,
  `gt_name` varchar(20) NOT NULL,
  `gt_status` int(1) NOT NULL COMMENT '0为显示,1为隐藏',
  `gt_description` varchar(512) DEFAULT NULL COMMENT '描述',
  `gt_gt_id` int(11) DEFAULT NULL,
  `gt_order_by` int(8) DEFAULT '1' COMMENT '值越大越靠前',
  `show_pic` varchar(128) DEFAULT NULL COMMENT '展示的图片(小图)',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '类名大图',
  `is_big_piece` tinyint(1) DEFAULT '0' COMMENT '（是否大件）0:否，1：是',
  `gt_weights` int(6) NOT NULL DEFAULT '0' COMMENT '权重值默认为0',
  `keyword` varchar(2000) DEFAULT NULL COMMENT '类目关键词',
  PRIMARY KEY (`gt_id`),
  KEY `gt_gt_id` (`gt_gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8;


CREATE TABLE `t_brand` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(60) NOT NULL,
  `b_logo` varchar(255) DEFAULT NULL,
  `b_description` varchar(1024) DEFAULT NULL COMMENT '品牌描述',
  `b_in_time` datetime DEFAULT NULL,
  `b_out_time` datetime DEFAULT NULL,
  `b_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 是 弃用品牌 1 启用品牌',
  `b_is_hot` int(1) DEFAULT '0' COMMENT '是否热门品牌',
  `b_orderby` int(11) DEFAULT NULL COMMENT '排序，值越大越靠前',
  `b_aliase` varchar(40) DEFAULT NULL COMMENT '品牌别名,多个以逗号隔开',
  `b_super_id` tinyint(4) DEFAULT '0' COMMENT '品牌所属的大品牌id，t_super_brand',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;



select * from t_brand;
			
CREATE TABLE `u_stock_log_detail` (
`seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
`id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单据编号，必填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
`style_num_id` bigint(18) DEFAULT NULL COMMENT '商品ID   #AC|显示，必填#AU|显示',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间   |选填|显示',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填   ',
`status` int(10) DEFAULT NULL COMMENT '状态0 待审核    1 待收货 2 已收货 3 部分收货 4 已取消 5 调货中 6 待编辑 7 已拒绝 8已审核 9待盘点 10 已完成  11 待处理 选填#AS|显示  ',
`style_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品货号，必填  ',
`style_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称，必填   #AS|显示#R|显示',
purchase_price decimal(10,2) DEFAULT NULL COMMENT '进价   ',
total_purchase_price decimal(10,2) DEFAULT NULL COMMENT '进价金额',
`price` decimal(10,2) DEFAULT NULL COMMENT '价格，必填',
`num` int(10) DEFAULT NULL COMMENT '本次收货数量 实际收货数量，收货时必填#U|显示',
apply_from_num int(10) DEFAULT NULL COMMENT '申请调拨数量 创建调拨申请单时必填',
from_num int(10) DEFAULT NULL COMMENT '采购数量 实际调拨数量，创建采购单时 盘点单用于存放库存总数量 必填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
to_num int(10) DEFAULT NULL COMMENT '已收货数量 实际调拨数量，选填 #U|显示#AC|显示，必填#AS|显示#AU|显示',
app_to_num int(10) DEFAULT NULL COMMENT 'APP临时保存的收货数量 实际调拨数量，选填',
`from_qty` int(10) DEFAULT NULL COMMENT '发货方库存，必填 #AC|显示，必填',
`to_qty` int(10) DEFAULT NULL COMMENT '收货方库存，必填 #AC|显示，必填',
`qty` int(10) DEFAULT NULL COMMENT '当前门店app库存，必填 #AC|显示，必填',
`total_qty` int(10) DEFAULT NULL COMMENT '当前门店总库存，必填 #AC|显示，必填',
 p_qty int(10) DEFAULT NULL COMMENT '当前门店公共库存，必填 #AC|显示，必填',
`from_p_qty` int(10) DEFAULT NULL COMMENT '发货方公共调拨库存，必填 #AC|显示，必填',
`to_p_qty` int(10) DEFAULT NULL COMMENT '收货方公共调拨库存，必填 #AC|显示，必填',
`total_price` decimal(10,2) DEFAULT NULL COMMENT '合计，选填',
 total_different_num int(10) default null comment '盈亏数量',
 total_different_price decimal(10,2) DEFAULT NULL comment '盈亏金额（零售价），选填',
 total_different_purchase_price  decimal(10,2) DEFAULT NULL comment '盈亏金额（进价），选填',
`unit_id` int(10) DEFAULT NULL COMMENT '单位类型，必填',
`unit` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位名称，必填#AS|显示',
`barcode` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条码，必填#AS|显示#R|显示#U|显示',
`item_num_id` bigint(18) DEFAULT NULL COMMENT '规格ID，必填#U|显示#AC|显示，必填#AS|显示#AU|显示',
`sku_title_one` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第一标题，选填',
`sku_title_two` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规格第二标题，选填',
`shelf_life` int(18) DEFAULT '0' COMMENT '保质期天数,0表示不限制天数，默认值为0，选填',
 produce_date timestamp comment '生产日期，选填',
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
