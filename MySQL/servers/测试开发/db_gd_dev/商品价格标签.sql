drop table price_label;
create table price_label(
sid bigint(18) comment '门店ID',
style_Num_Id bigint(18) comment '款式ID',
unit varchar(32) comment '单位',
sku_name varchar(225) comment 'sku 名称',
item_num_id bigint(18) comment 'sku id',
barcode varchar(32) comment '条形码',
one_value varchar(32) comment '规格',
standard_price decimal(20,2) comment '吊牌价',
price decimal(20,2)  comment '会员价',
direct_drop_price decimal(20,2) comment '促销价',
have_direct_drop int(8) comment '是否有促销价',
have_member_discount int(8) comment '是否有会员价',
num bigint(8) comment '打印数量' ,
attr_brand_location int(8) comment '产地编码',
location_name varchar(32) comment '产地名称'
);

create index index_sid_barcode on price_label(sid,barcode);

select * from price_label;


select * from price_label;
 
 
 delete from price_label;