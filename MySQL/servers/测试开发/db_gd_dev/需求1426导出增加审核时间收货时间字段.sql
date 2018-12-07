

alter table u_stock_log  add `audit_time` datetime DEFAULT NULL COMMENT '审核时间';
alter table u_stock_log_his  add `audit_time` datetime DEFAULT NULL COMMENT '审核时间';

