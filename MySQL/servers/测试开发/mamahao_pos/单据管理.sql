
#------------------上线脚本-------------------------------

drop table u_stock_log;
create table u_stock_log(
seq_id          bigint(18) NOT NULL AUTO_INCREMENT  COMMENT '默认自增主键',
id              varchar(32)        comment '单据编号，必填' ,       
style_title    	varchar(255)       comment '商品名称，选填', 
create_time  	 TIMESTAMP  DEFAULT CURRENT_TIMESTAMP   comment '制单时间，选填',  
update_time    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填',              
status       		int(10)            comment '状态0 未收货1 已收货 2已作废，选填',              
user_id      		int(10)            comment '操作员ID，选填',               
user         		varchar(50)        comment '操作员，选填',                 
pay_type     		varchar(32)        comment '付款方式，0现金1银行卡2欠款,多选时逗号分隔，单据类型为0时必填',                
from_sid     		int(10)            comment '发出仓库或门店（包含入库仓库、发往店铺），操作发货时必填',
from_sid_type   int(10)            comment '发出仓库类型，操作发货时必填',  
from_staff_id   int(10)            comment '发货方责任人ID，操作发货时必填',
from_staff_name varchar(32)        comment '发货方责任人名称，操作发货时必填',
delivery_time    TIMESTAMP           comment '发货时间，操作发货时必填',
to_sid          int(10)            comment '发往仓库货门店，操作发货时必填',             
to_sid_type     int(10)            comment '发往仓库类型，操作发货时必填',  
to_staff_id     int(10)            comment '收货方责任人ID，操作收货时必填',
to_staff_name   varchar(32)        comment '收货方责任人名称，操作收货时必填',
receipt_time     TIMESTAMP          comment '收货时间，操作收货时必填',
provider_id     int(10)            comment '供应商ID 选填',               
provider_name   varchar(32)        comment '供应商名称，选填',                        
remark          varchar(225)       comment '备注，选填',                  
bill_type       int(10)            comment '单据类型枚举： 0总部进货单 1总部发货单 2门店入库单 3门店退货单 4门店领用单，必填',
total_num    int(10)               comment '货品总数量，选填',
total_price    decimal(10,2)         comment '合计，选填',
PRIMARY KEY (`seq_id`)
);
alter table u_stock_log modify total_price decimal(10,2) comment '合计，选填';
alter table u_stock_log modify price decimal(10,2) ;

alter tabl e u_stock_log modify price decimal(10,2) ;
alter table u_stock_log modify delivery_time    datetime   comment '发货时间，操作发货时必填';
alter table u_stock_log modify receipt_time     datetime   comment '收货时间，操作收货时必填';

drop table u_stock_log_detail;
create table u_stock_log_detail(
seq_id          bigint(18) NOT NULL AUTO_INCREMENT  COMMENT '默认自增主键',
id              varchar(32)        comment '单据编号，必填' ,                
style_num_id  	bigint(18)         comment '商品ID，必填',    
create_time  		TIMESTAMP   DEFAULT CURRENT_TIMESTAMP   comment '制单时间，选填',  
update_time    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间，选填',   
style_code      varchar(32)        comment '商品货号，必填',
style_title    	varchar(255)       comment '商品名称，必填',                
price        		decimal(10,2)        comment '价格，必填',                  
num          		int(10)            comment '数量，必填',
qty             int(10)            comment '库存，必填',
total_price  		decimal(10,2)        comment '总金额，必填',                 
unit_id  		int(10)            comment '单位类型，必填',                
unit   		varchar(32)        comment '单位名称，必填',                
barcode    		  varchar(20)        comment '条码，必填',     
item_num_id     bigint(18)        comment '规格ID，必填',
sku_title_one   varchar(32)        comment '规格第一标题，选填',   
sku_title_two   varchar(32)        comment '规格第二标题，选填', 
shelf_life      int(18)  DEFAULT '0' COMMENT '保质期天数,0表示不限制天数，默认值为0，选填',
one_value       varchar(32)        comment '规格第一标题对应的值，必填',
goods_brand_id  int(10)           comment '品牌类型',
goods_brand_name varchar(32)      comment '品牌名称',
PRIMARY KEY (`seq_id`)
);

alter table u_stock_log_detail modify total_price decimal(10,2) comment '合计，选填';
alter table u_stock_log_detail modify price decimal(10,2)  comment '价格，必填';

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
sid_type     int(10)               comment '仓库类型',
qty_change   int(10)               comment '货品变化',
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

drop  table u_stock_log_his;
create table u_stock_log_his(
seq_id          bigint(18) NOT NULL AUTO_INCREMENT  COMMENT '默认自增主键',
id              varchar(32)        comment '单据编号' ,                   
create_time  		TIMESTAMP   DEFAULT CURRENT_TIMESTAMP   comment '制单时间',  
update_time    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',              
status       		int(10)            comment '状态0 未收货1 已收货 2已作废',                
user_id      		int(10)            comment '操作员ID',               
user         		varchar(50)        comment '操作员',                 
pay_type     		Int(10)            comment '付款方式',                
from_sid     		int(10)            comment '发出仓库或门店（包含入库仓库、发往店铺）',
from_sid_type   int(10)            comment '发出仓库类型',  
from_staff_id   int(10)            comment '发货方责任人ID',
from_staff_name varchar(32)        comment '发货方责任人名称',
deliveryTime    TIMESTAMP           comment '发货时间',
to_sid          int(10)            comment '发往仓库货门店',             
to_sid_type     int(10)            comment '发往仓库类型',  
to_staff_id     int(10)            comment '收货方责任人ID',
to_staff_name   varchar(32)        comment '收货方责任人名称',
provider_id     int(10)            comment '供应商ID',               
provider_name   varchar(32)        comment '供应商名称',               
receipt_time   TIMESTAMP           comment '操作日期（发货、进货）',         
remark          varchar(225)       comment '备注',                  
bill_type       int(10)            comment '单据类型枚举：0总部进货单 1总部发货单 2门店入库单 3门店退货单 4门店领用单',             
pre_seq_id     bigint(18)          comment '操作前记录的主键',
PRIMARY KEY (`seq_id`)
);


drop table u_goods_stock;
CREATE TABLE `u_goods_stock` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键',
  `style_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'Ucan商品款式ID',
  `item_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'ucan商品skuID',
  `shop_id` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店ID,为0的时候表示总部仓库',
  `qtyWarn` bigint(18) DEFAULT '0' COMMENT '该款式预警库存',
  `qty` int(13) UNSIGNED  NOT NULL DEFAULT '0' COMMENT '库存数量',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `item_idx` (`item_num_id`) USING BTREE,
  KEY `style_idx` (`style_num_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='u_goods_stock 商品库存表';

#-----------------自增序列---------------------------------


drop table u_seq;
create table u_seq (
	name varchar(50) not null primary key,
	start_value int not null,
	now_value int not null,
	increment_value int not null default 1,
	max_value int not null
);

delete from u_seq;
insert into u_seq values('stock_log_id',10000,10000,1,99999);
select * from u_seq;

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
select  * from u_staff;



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

select * from u_staff;


update u_staff set shop_id=1 where staff_id=6;



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

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 