select * from u_stock_log limit 100;

alter table u_stock_log_his drop cancel_time;
alter table u_stock_log drop cancel_time;

alter table u_stock_log add cancel_deliver_time date comment '取消发货时间';
alter table u_stock_log_his add cancel_deliver_time date comment '取消发货时间';

alter table u_stock_log add cancel_apply_time date comment '取消申请时间';
alter table u_stock_log_his add cancel_apply_time date comment '取消申请时间';

