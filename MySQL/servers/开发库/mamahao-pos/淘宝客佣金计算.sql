select * from t_star_member_sales_detail limit 100;

select * from t_star_member_sales limit 100;

#----------------------  上线步骤
alter table t_star_member_sales_detail add (
item_img varchar(1024) default null comment '商品图片url',
channel_type int(11) default 0 comment '商品渠道类型',
channel_name varchar(16)  default null comment '商品渠道名称',
`order_member_id` bigint(20) NOT NULL COMMENT '订单用户ID',
`order_member_phone` varchar(64) NOT NULL COMMENT '订单用户ID',
`refund_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '退货金额',
refund_cont int(10) DEFAULT NULL COMMENT '退货商品数量',
`indirect_type` int(11) NOT NULL COMMENT '1直接佣金 2 间接佣金',
`order_status` int(11) NOT NULL COMMENT '订单状态1正常订单2订单部分退货退款3订单全部退货',
`order_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
`confirm_good_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单确认收货时间',
`entry_time` datetime DEFAULT null COMMENT '需要入账的时间',
`sale_month` varchar(6) DEFAULT NULL COMMENT '销售月份',
`staff_id` bigint(20)  COMMENT '员工id',
`staff_work_number` varchar(32) COMMENT '员工工号',
`staff_name` varchar(255)  DEFAULT '' COMMENT '员工姓名',
`staff_shop_id` bigint(20) NOT NULL COMMENT '所属店铺id',
`staff_shop_name` varchar(32) NOT NULL COMMENT '所属店铺名称',
real_commission_amount decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '真实的佣金金额',
real_amount decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '用于计算佣金的金额',
`order_pos_status` int(11) NOT NULL COMMENT '订单状态1已付款2已收货3已结算4已失效5已退款',
sale_amount decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售额'
);





alter table t_star_member_sales add (
 channel_type int(11) default 0 comment '商品渠道类型',
 channel_name varchar(16)  default null comment '商品渠道名称',
`staff_id` bigint(20)  default 0 COMMENT '员工id',
`staff_work_number` varchar(32)  DEFAULT ''  COMMENT '员工工号',
`staff_name` varchar(255)  DEFAULT '' COMMENT '员工姓名',
`staff_shop_id` bigint(20) default 0  COMMENT '所属店铺id',
`staff_shop_name` varchar(32)  DEFAULT ''  COMMENT '所属店铺名称',
`entry_time` datetime DEFAULT null COMMENT '需要入账的时间',
);
create index key_sales_id on t_star_member_sales(sales_id);
alter table t_star_member_sales modify   `sales_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列';


alter table t_star_member_asset_log add 
(
item_img varchar(1024) default null comment '商品图片url',
channel_type int(11) default 0 comment '商品渠道类型',
channel_name varchar(16)  default null comment '商品渠道名称',
`item_num_id` bigint(20) DEFAULT NULL COMMENT '商品ID'
);

alter table t_star_member_sales_config 
add(
item_img varchar(1024) default null comment '商品图片url'
);


#---------------------------------------------



alter table t_star_member_sales_detail modify  `entry_time` datetime DEFAULT null COMMENT '需要入账的时间';  
alter table t_star_member_sales modify  channel_name varchar(16)  default null comment '商品渠道名称'      ;  
alter table t_star_member_sales modify `staff_id` bigint(20)  default 0 COMMENT '员工id'                  ;  
alter table t_star_member_sales modify `staff_work_number` varchar(32)  DEFAULT ''  COMMENT '员工工号'   ;  
alter table t_star_member_sales modify `staff_name` varchar(255)  DEFAULT '' COMMENT '员工姓名'          ;  
alter table t_star_member_sales modify `staff_shop_id` bigint(20) default 0  COMMENT '所属店铺id'           ;  
alter table t_star_member_sales modify `staff_shop_name` varchar(32)  DEFAULT ''  COMMENT '所属店铺名称'   ;  


alter table t_star_member_sales_detail add (
sale_amount decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售额'
);

alter table t_star_member_sales add (
`entry_time` datetime DEFAULT null COMMENT '需要入账的时间'
);



alter table t_star_member_sales_detail modify channel_type int(11) default 0 comment '商品渠道类型:0 自营 1 天猫 2 淘宝';
alter table t_star_member_sales_detail modify item_img varchar(1024) default null comment '商品图片url';



select * from t_star_member_asset_log limit 100;


select * from t_star_member_sales_config 



select * from u_staff limit 100;



select * from t



