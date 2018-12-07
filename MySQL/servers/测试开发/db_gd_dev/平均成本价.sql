create table t_average_cost_price(
sid bigint(18) comment '门店或仓库ID,1为总部',
item_num_id bigint(18) comment 'sku id',
barcode varchar(32) comment '条码',
sku_name varchar(32) comment 'sku 名称',
total_cost_price decimal(10,2) comment '成本总价',
total_num  bigint(18)  comment '商品数量',
avarage_cost_price decimal(10,2) comment '平均成本价',
primary key(sid,item_num_id,barcode)
);

alter table t_average_cost_price add primary key(sid,item_num_id,barcode);


select  * from  t_average_cost_price;

