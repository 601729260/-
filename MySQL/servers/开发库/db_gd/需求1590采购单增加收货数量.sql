alter table u_stock_log_detail add `multiple_receipt_time` varchar(1024) DEFAULT NULL COMMENT '储存多次收货时间';
alter table u_stock_log_detail_his add `multiple_receipt_time` varchar(1024) DEFAULT NULL COMMENT '储存多次收货时间';


select * from  u_stock_log_detail_his where id='MMH2019041910026625' order by create_time desc;

