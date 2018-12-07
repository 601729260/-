

select * from gb_share_item where barcode_1=6931036832614;



select * from gb_share_item where barcode_1=6931036845195;


select * from u_stock_log_detail where id='MMH2018112010006868' and barcode='6935098500436';


select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100003653 order by create_time desc;
select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100003654 order by create_time desc;




select * from u_stock_log where id='MMH2018120210011089';


select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100003653 order by create_time desc;


select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100003653 order by create_time desc;


update t_gb_stock set p_qty=p_qty+24 where storage_id=1800000080 and item_num_id=1100003653 ;
update t_gb_stock set p_qty=p_qty+12 where storage_id=1800000080 and item_num_id=1100003654 ;


