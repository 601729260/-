select * from gb_brand                  limit 1;
select * from gb_share_item             limit 1;
select * from gb_style                  limit 1;
select * from t_goods_type              limit 1;
select * from t_member                  limit 1;
select * from t_member_base_ext         limit 1;
select * from t_order                   limit 1;
select * from t_order_line              limit 1;
select * from t_order_pay               limit 1;
select * from t_refund_line             limit 1;
select * from t_voucher                 limit 1;
select * from u_card_item_detail        limit 1;
select * from u_card_item_record        limit 1;
select * from u_order                   limit 1;
select * from u_order_line              limit 1; 
select * from u_order_pay               limit 1;
select * from u_refund_pay              limit 1;
select * from t_member_mbean            limit 1;

  
alter table db_gd.gb_brand              add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.t_goods_type          add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.t_order               add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.t_order_line          add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.t_voucher             add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.u_card_item_detail    add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.u_card_item_record    add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.u_order_line          add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.u_refund_pay          add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.u_order_pay           add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.t_member_mbean        add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';
alter table db_gd.u_refund_basic        add update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间';




   