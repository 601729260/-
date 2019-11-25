select * from t_star_shop_goods_bonus_approve_batch limit 100;


select * from t_star_shop_goods_bonus_approve_detail limit 100;


select  * from t_star_shop_goods_bonus_log_ext limit 100;

create index idx_item_num_id  on t_star_shop_goods_bonus_log_ext(item_num_id,update_time);


select * from t_star_shop_goods_bonus_log limit 100;

alter table t_star_shop_goods_bonus_approve_batch add (
suit_type int(20) default 0 comment '配置类型 0 全部门店 1 指定门店',
sids varchar(5000) comment '适用的门店列表',
merchant_id int(20) comment '商户ID',
merchant_name varchar(32) comment '商户名称')
)


alter table t_star_shop_goods_bonus_approve_detail add (
merchant_id int(20) comment '商户ID',
merchant_name varchar(32) comment '商户名称');


alter table t_star_shop_goods_bonus_log_ext add (
suit_type int(20) default 0 comment '配置类型 0 全部门店 1 指定门店',
merchant_id int(20) comment '商户ID' default 0,
merchant_name varchar(32) comment '商户名称' ,
shop_id bigint(20) comment '门店ID',
shop_name varchar(32) comment '门店名称');

alter table t_star_shop_goods_bonus_log add (
suit_type int(20) default 0 comment '配置类型 0 全部门店 1 指定门店',
merchant_id int(20) comment '商户ID' default 0,
merchant_name varchar(32) comment '商户名称',
shop_id bigint(20) comment '门店ID',
shop_name varchar(32) comment '门店名称');



alter table t_star_shop_goods_bonus_log modify  direct_bonus DOUBLE DEFAULT NULL COMMENT '直属佣金10表示10%';
alter table t_star_shop_goods_bonus_log modify    indirect_bonus DOUBLE DEFAULT NULL COMMENT '间接佣金10表示10%';
alter table t_star_shop_goods_bonus_log modify    team_bonus DOUBLE DEFAULT '0' COMMENT '团队佣金10表示10%';
alter table t_star_shop_goods_bonus_log modify    star_adviser_bonus DOUBLE DEFAULT '0' COMMENT '星级顾问佣金10表示10%';



