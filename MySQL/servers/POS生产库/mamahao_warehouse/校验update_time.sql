select * from update_time from t_order;
select * from update_time from u_order;
select * from update_time from  t_voucher ;
select update_time from  t_member_mbean limit 10;
select * from update_time from   u_card_item_record;
select * from update_time from   u_card_item_detail;


alter table t_order add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table  u_order add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table  t_voucher add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter  table t_member_mbean add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter  table u_card_item_record add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter  table u_card_item_detail add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';


create index index_time on t_order(update_time);
create index index_time on u_order(update_time);            
create index index_time on t_voucher(update_time);          
create index index_time on t_member_mbean(update_time);     
create index index_time on u_card_item_record(update_time); 
create index index_time on u_card_item_detail(update_time); 




