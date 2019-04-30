CREATE TABLE `t_jpush` (
  `jpush_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `query_type` int(2) DEFAULT NULL,
  `order_state` int(2) DEFAULT NULL,
  `h5_url` varchar(255) DEFAULT NULL,
  `push_type` int(2) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `account` varchar(30) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `groupType` int(1) DEFAULT NULL COMMENT '1 通知消息 2 订单助手 3 我的资产 4 妈妈好活动  5员工通知',
  `pic` varchar(255) DEFAULT NULL COMMENT '封面图',
  `linkType` varchar(255) DEFAULT NULL COMMENT '落地类型  H5连接 3 ;商品id   2; 品牌商品列表   8 ; 门店id  10',
  PRIMARY KEY (`jpush_id`),
  KEY `index_memberid` (`member_id`) USING BTREE,
  KEY `index_tags` (`tags`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6839406 DEFAULT CHARSET=utf8;

drop table t_push_job;

create view t_push_job as select * from db_gd_dev.t_push_job;


select * from t_push_job;


CREATE TABLE `t_push_job` (
  `push_job_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(32) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `push_time` datetime DEFAULT NULL,
  `push_create_time` datetime DEFAULT NULL,
  `push_type` int(1) NOT NULL DEFAULT '0' COMMENT '消息类型',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0 : 未发送  1：发送中  2：已发送',
  `page_url` varchar(255) DEFAULT NULL COMMENT 'APP页面（点击推送内容要跳转的页面地址）',
  `platform_type` int(1) DEFAULT NULL COMMENT '平台类型（0：全部 1:IOS 2: android）',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `file_name` varchar(255) DEFAULT NULL COMMENT 'specMemberType为3的时候  上传的文件名称(目前没有使用)',
  `sms_channel` int(1) DEFAULT NULL COMMENT '推送通道 发短信（0：false  1:ture）',
  `push_channel` int(1) DEFAULT NULL COMMENT '推送通道 站内信（0：false 1:true）',
  `channel` varchar(10) DEFAULT NULL COMMENT '推送通道',
  `spec_member_type` int(1) DEFAULT NULL COMMENT '0 : 全部， 1：会员分组 2：单人用户  3:上传文件  ',
  `memberTag` varchar(255) DEFAULT NULL COMMENT '当选择会员分组的适合提供,目前没有使用',
  `memberIds` text COMMENT '当指定单人用户时候,用户id以，分隔',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `groupType` int(1) DEFAULT NULL COMMENT '1 通知消息 2 订单助手 3 我的资产 4 妈妈好活动 5员工通知',
  `pic` varchar(255) DEFAULT NULL COMMENT '封面图',
  `push_message` int(1) DEFAULT NULL COMMENT '是否是push消息 0否 1是',
  `linkType` varchar(255) DEFAULT NULL COMMENT '落地类型  H5连接 3 ;商品id   2; 品牌商品列表   8 ; 门店id  10',
  `memberPhones` text COMMENT '当指定单人用户时候,用户手机号以，分隔',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`push_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;


create view t_push_job as select * from db_gd_dev.t_push_job;

select *  from t_push_job;

CREATE TABLE `t_push_tag_job` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL COMMENT '推送活动id',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容文案',
  `status` int(1) DEFAULT '0' COMMENT '发送状态 0 : 未发送 1：发送中 2：已发送 3：发送取消 ',
  `failMsg` varchar(1024) DEFAULT NULL COMMENT '失败原因',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `push_time` datetime DEFAULT NULL COMMENT '推送时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `isdeleted` int(11) DEFAULT '0' COMMENT '删除,0 未删除 ， 1 已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1199 DEFAULT CHARSET=utf8;


select * from  u_stock_log where id='MMH2019012510010835';

select * from  u_goods_stock_log  where barcode='6970101015668' and id='';

select * from t_crm_promotion;



