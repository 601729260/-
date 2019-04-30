
DROP TABLE IF EXISTS `t_star_member_accumulated_income`;
CREATE TABLE `t_star_member_accumulated_income` (
  `accumulated_income_id` bigint(20) NOT NULL COMMENT '自增序列',
  `sale_type` int(11) NOT NULL DEFAULT '0' COMMENT '销售类型:3我的销售-自购下单，4我的销售-专属会员下单，5团队销售-直属店长自购，6团队销售-间接会员下单 7邀请奖励-直邀好友开店 8邀请奖励-间接邀好友开店',
  `member_id` bigint(20) NOT NULL COMMENT '用户id',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '收益金额',
  `sale_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已入账总销售金额',
  `all_sale_amount` decimal(20,2) DEFAULT '0.00' COMMENT '总销售金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sale_type`,`member_id`),
  KEY `index_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='累计收益分析';

-- ----------------------------
-- Table structure for t_star_member_asset
-- ----------------------------
DROP TABLE IF EXISTS `t_star_member_asset`;
CREATE TABLE `t_star_member_asset` (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `wait_in_account` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '待入账金额',
  `accumulated_income` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '累计收益',
  `upper_one_accumulated_income` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '对上级累计收益',
  `upper_two_accumulated_income` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '对上上级累计收益',
  `order_count` int(11) NOT NULL COMMENT '订单数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `self_accumulated_income` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '对自己的累计收益',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1994576 DEFAULT CHARSET=utf8 COMMENT='星店长资产';

-- ----------------------------
-- Table structure for t_star_member_asset_log
-- ----------------------------
DROP TABLE IF EXISTS `t_star_member_asset_log`;
CREATE TABLE `t_star_member_asset_log` (
  `asset_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `out_serial_number` varchar(64) NOT NULL COMMENT '外部流水号:订单编号、提现编号',
  `member_id` bigint(20) NOT NULL COMMENT '用户id',
  `sale_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售金额',
  `sale_name` varchar(64) DEFAULT NULL COMMENT '销售类型名称',
  `pre_balance` decimal(20,2) NOT NULL COMMENT '更新前余额',
  `change_balance` decimal(20,2) NOT NULL COMMENT '变动金额',
  `out_status` int(11) DEFAULT NULL COMMENT '外部状态1正常订单 2订单部分退货退款 ',
  `operate_type` int(11) NOT NULL COMMENT '操作类型:1申请提现 2提现失败 3我的销售-自购下单，4我的销售-专属会员下单，5团队销售-直属店长自购，6团队销售-间接会员下单 7邀请奖励-直邀好友开店 8邀请奖励-间接邀好友开店 ',
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `order_member_id` bigint(20) DEFAULT NULL COMMENT '订单用户ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`asset_log_id`),
  KEY `index_member_id` (`member_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='销售量统计';

-- ----------------------------
-- Table structure for t_star_member_sales
-- ----------------------------
DROP TABLE IF EXISTS `t_star_member_sales`;
CREATE TABLE `t_star_member_sales` (
  `sales_id` bigint(20) NOT NULL COMMENT '自增序列',
  `order_no` varchar(64) NOT NULL COMMENT '订单编号',
  `member_id` bigint(20) NOT NULL COMMENT '用户id',
  `member_phone` varchar(64) NOT NULL COMMENT '用户手机',
  `order_member_id` bigint(20) NOT NULL COMMENT '订单用户ID',
  `order_member_phone` varchar(64) NOT NULL COMMENT '订单用户ID',
  `sale_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售金额',
  `refund_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '退货金额',
  `commission_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型:3我的销售-自购下单，4我的销售-专属会员下单，5团队销售-直属店长自购，6团队销售-间接会员下单 7邀请奖励-直邀好友开店 8邀请奖励-间接邀好友开店',
  `indirect_type` int(11) NOT NULL COMMENT '1直接佣金 2 间接佣金',
  `sale_name` varchar(64) DEFAULT NULL COMMENT '销售类型名称',
  `sale_month` varchar(6) DEFAULT NULL COMMENT '销售月份',
  `sale_status` int(11) NOT NULL COMMENT '当前状态:1可以提现2等待入账3冻结',
  `order_status` int(11) NOT NULL COMMENT '订单状态1正常订单2订单部分退货退款3订单全部退货',
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `confirm_good_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '订单确认收货时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`order_no`,`member_id`),
  KEY `index_member_id` (`member_id`) USING BTREE,
  KEY `index_update_time` (`update_time`) USING BTREE,
  KEY `index_confirm_good_time` (`confirm_good_time`) USING BTREE,
  KEY `index_order_no` (`order_no`),
  KEY `index_order_member` (`order_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售量及邀请奖励统计';

-- ----------------------------
-- Table structure for t_star_member_sales_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_star_member_sales_detail`;
CREATE TABLE `t_star_member_sales_detail` (
  `sales_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增序列',
  `member_id` bigint(20) NOT NULL COMMENT '用户id',
  `order_no` varchar(64) NOT NULL COMMENT '订单编号',
  `sale_type` int(11) DEFAULT NULL COMMENT '销售类型:3我的销售-自购下单，4我的销售-专属会员下单，5团队销售-直属店长自购，6团队销售-间接会员下单 7邀请奖励-直邀好友开店 8邀请奖励-间接邀好友开店',
  `operate_type` int(11) NOT NULL COMMENT '1增加佣金 2扣除佣金',
  `item_num_id` bigint(20) NOT NULL COMMENT '商品ID',
  `rate` decimal(20,5) DEFAULT NULL COMMENT '商品比例',
  `amount` decimal(20,5) NOT NULL COMMENT '金额',
  `commission_amount` decimal(20,5) NOT NULL COMMENT '佣金金额',
  `good_count` int(10) NOT NULL COMMENT '商品数量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `member_phone` varchar(64) DEFAULT NULL COMMENT '用户手机',
  `barcode` varchar(64) DEFAULT NULL COMMENT '条形码',
  `sale_name` varchar(64) DEFAULT NULL COMMENT '销售类型名称',
  `star_member_name` varchar(64) DEFAULT NULL COMMENT '星店长级别名称',
  `star_member_level` int(11) DEFAULT NULL COMMENT '星店长级别',
  `inviteAmount` decimal(20,2) DEFAULT NULL COMMENT '邀请奖励金额',
  PRIMARY KEY (`sales_detail_id`),
  KEY `index_order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8;
select nextval(varchar str) from dual;

drop function nextval;
CREATE  FUNCTION nextval(str varchar(50)) RETURNS int(11)
begin
	declare j int ;
	declare i int;
	select now_value ,max_value into i,j from t_seq where name=str for update;
	if i=j then 
		update t_seq set now_value=start_value where name=str;
	else 
	update t_seq
		set now_value=i+increment_value
	where name=str;
	end if;
 return i;
end


INSERT INTO `mamahao-pos`.`t_seq`(`name`, `start_value`, `now_value`, `increment_value`, `max_value`) VALUES 
('sales_id', 10000, 1, 1, 9999999999);
INSERT INTO `mamahao-pos`.`t_seq`(`name`, `start_value`, `now_value`, `increment_value`, `max_value`) VALUES 
('sales_detail_id', 10000, 1, 1, 9999999999);
INSERT INTO `mamahao-pos`.`t_seq`(`name`, `start_value`, `now_value`, `increment_value`, `max_value`) VALUES 
('accumulated_income_id', 10000, 1, 1, 9999999999);



/*******  线下订单计算星店长项目********************/


alter table t_star_member_sales_detail add order_line_id bigint(20) comment '线上订单商品行ID';
alter table t_star_member_sales_detail add u_order_line_id bigint(20) comment '线下订单商品行ID';
alter table t_star_member_sales_detail add refund_no varchar(64)  COMMENT '逆向订单编号';
alter table t_star_member_sales_detail add `sale_status` int(11) NOT NULL COMMENT '当前状态:1可以提现2等待入账3冻结';
alter table t_star_member_sales add  `order_type` int(11) DEFAULT '1' COMMENT '订单类型';





