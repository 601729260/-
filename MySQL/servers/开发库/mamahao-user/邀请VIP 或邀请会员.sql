drop table t_member_invite_log;
CREATE TABLE `t_member_invite_log` (
  `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键',
  `member_id` bigint(18) NOT NULL COMMENT '用户ID',
  `member_phone` varchar(30) NOT NULL COMMENT '用户手机号',
  `down_member_id` bigint(18) NOT NULL DEFAULT '0' COMMENT '被邀请人ID',
	`down_member_phone`  varchar(30) NOT NULL COMMENT '冗余用户手机号',
	`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `order_no` varchar(64) NOT NULL COMMENT '订单编号',
	`invite_amount` decimal(20,2) DEFAULT NULL COMMENT '邀请奖励金额',
  invite_type int(18) NOT NULL COMMENT '邀请类型 1 邀请会员 2 邀请vip',
  KEY `index_create_time` (create_time,member_id),
	key index_key(seq_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

explain select member_id,count(1) as count,sum(invite from t_member_invite_log 
where create_time>'2019-10-01 00:00:00' and create_time<='2019-10-31 00:00:00' 
group by member_id order by count


