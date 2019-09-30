

alter table t_star_member_sales_detail add (
item_img varchar(1024) default null comment '商品图片url',
channel_type int(11) default 0 comment '商品渠道类型',
channel_name varchar(16) default null comment '商品渠道名称',
`order_member_id` bigint(20) COMMENT '订单用户ID',
`order_member_phone` varchar(64) COMMENT '订单用户ID',
`refund_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '退货金额',
refund_cont int(10) DEFAULT NULL COMMENT '退货商品数量',
`indirect_type` int(11) COMMENT '1直接佣金 2 间接佣金',
`order_status` int(11) COMMENT '订单状态1正常订单2订单部分退货退款3订单全部退货',
`order_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
`confirm_good_time` datetime DEFAULT null COMMENT '订单确认收货时间',
`entry_time` datetime DEFAULT null COMMENT '需要入账的时间',
`sale_month` varchar(6) DEFAULT NULL COMMENT '销售月份',
`staff_id` bigint(20) COMMENT '员工id',
`staff_work_number` varchar(32) COMMENT '员工工号',
`staff_name` varchar(255) DEFAULT '' COMMENT '员工姓名',
`staff_shop_id` bigint(20) COMMENT '所属店铺id',
`staff_shop_name` varchar(32) COMMENT '所属店铺名称',
real_commission_amount decimal(20,2) DEFAULT '0.00' COMMENT '真实的佣金金额',
real_amount decimal(20,2) DEFAULT '0.00' COMMENT '用于计算佣金的金额',
`order_pos_status` int(11) COMMENT '订单状态1已付款2已收货3已结算4已失效5已退款',
sale_amount decimal(20,2) DEFAULT '0.00' COMMENT '销售额',
`order_type` int(11) DEFAULT '1' COMMENT '订单类型'
);


alter table t_star_member_sales add (
channel_type int(11) default 0 comment '商品渠道类型',
channel_name varchar(16) default null comment '商品渠道名称',
`staff_id` bigint(20) default 0 COMMENT '员工id',
`staff_work_number` varchar(32) DEFAULT '' COMMENT '员工工号',
`staff_name` varchar(255) DEFAULT '' COMMENT '员工姓名',
`staff_shop_id` bigint(20) default 0 COMMENT '所属店铺id',
`staff_shop_name` varchar(32) DEFAULT '' COMMENT '所属店铺名称',
`entry_time` datetime DEFAULT null COMMENT '需要入账的时间'
);
create index key_sales_id on t_star_member_sales(sales_id);
alter table t_star_member_sales modify `sales_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列';



alter table t_star_member_asset_log add 
(
item_img varchar(1024) default null comment '商品图片url',
channel_type int(11) default 0 comment '商品渠道类型',
channel_name varchar(16) default null comment '商品渠道名称',
`item_num_id` bigint(20) DEFAULT NULL COMMENT '商品ID'
);




# 补充总表数据
update t_star_member_sales set channel_type=0,channel_name='自营',entry_time=date_add(confirm_good_time,interval 7 day) ;
#补充月份
update t_star_member_sales_detail a left join t_star_member_sales b on a.order_no=b.order_no and a.member_id=b.member_id set a.sale_month=b.sale_month;
#退货明细amount 修改为负数
update t_star_member_sales_detail a set a.amount=-a.amount where operate_type=2;

# 单独处理邀请奖励
update t_star_member_sales_detail a 
left join t_star_member_sales b on a.order_no=b.order_no
set a.sale_amount=b.sale_amount,a.real_commission_amount=a.commission_amount,a.order_pos_status=2
where a.sale_type in (7,8) and b.sale_type in (7,8);

# 更新金额和入账时间
update t_star_member_sales_detail set amount=amount*good_count,entry_time=date_add(confirm_good_time,interval 7 day) ;
#更新金额
update t_star_member_sales_detail a left join 
(select member_id,order_no,item_num_id,sum(amount) as sale_amount,sum(commission_amount) as real_commission_amount from t_star_member_sales_detail group by member_id,order_no,item_num_id ) b
on a.member_id=b.member_id and a.order_no=b.order_no and a.item_num_id=b.item_num_id
set a.sale_amount=b.sale_amount,a.real_commission_amount=b.real_commission_amount
where a.sale_type not in (7,8) ;
# 更新商品图片
update t_star_member_sales_detail a left join 
(select item_num_id,item_pic,concat('http://image.mamhao.cn/',e.STYLE_ID,'/',item_pic) as item_img 
from wgn_tmp.gb_share_item d 
left join wgn_tmp.gb_style e 
on d.style_num_id=e.style_num_id  
where d.is_deleted=0 and e.is_deleted=0 ) b
on a.item_num_id=b.item_num_id set a.item_img=b.item_img;
update t_star_member_sales_detail a set channel_type=0 ,channel_name='自营';




update t_star_member_asset_log set channel_type=0 ,channel_name='自营';
update t_star_member_asset_log a left join t_star_member_sales_detail b on a.out_serial_number=b.order_no
set a.item_img=b.item_img,a.item_num_id=b.item_num_id;

#补充pos状态
update t_star_member_sales_detail a  
left join t_star_member_sales b on a.order_no=b.order_no and a.member_id=b.member_id
set a.order_pos_status= (case b.order_status when 1 then 2 else 5 end),a.order_status=b.order_status;



select concat('update t_star_member_sales_detail set sid=',shop_id,' ,sname=''',shop_name,''' where order_no=',order_no,';') from t_order  where order_no in (
select order_no from t_star_member_sales_detail where sid is null )
and  shop_id is not null union all
select concat('update t_star_member_sales_detail set sid=',warehouse_id,' ,sname=''',warehouse_name,''' where order_no=',order_no,';') from t_order where order_no in (
select order_no from t_star_member_sales_detail where sid is null )
and  warehouse_id is not null ;



select a.order_pos_status, t_star_member_sales_detail a 
left join t_star_member_sales b on a.order_no=b.order_no and a.member_id=b.member_id;


select * from t_star_member_sales_detail where sid is null ;


select * from wgn_tmp.gb_share_item where barcode_1=3760170400037 and is_deleted=0;
select  * from  t_star_member_sales_detail where  order_no=149310121780447;


select * from t_star_member_sales limit 100;


select * from t_star_member_sales_detail where order_no='MPOS151250195264799';

select order_no,item_num_id,item_img from t_star_member_sales_detail where item_img is not null ;

