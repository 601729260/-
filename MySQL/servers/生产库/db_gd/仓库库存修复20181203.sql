


#----------------已收货数量不显示的问题
MMH2018120210011163

select * from u_goods_stock_log where id='MMH2018120210011163' and item_num_id=1100003843;


select * from t_gb_stock  where item_num_id=1100003843 and storage_id=1800000080;

#--------------库存为-64的问题

select * from t_gb_stock  where item_num_id=1100003842 and storage_id=1800000080;

select * from u_goods_stock_log   where item_num_id=1100003842 and sid=1800000080 order by create_time  desc;





#-------------修复

update t_gb_stock set p_qty=p_qty+64  where item_num_id=1100003842 and storage_id=1800000080;
update  t_gb_stock  set p_qty=p_qty-50 where item_num_id=1100003843 and storage_id=1800000080;


#-------------20181204----库存修复

select * from gb_share_item where barcode_1='6931036832539'
select * from u_goods_stock_log   where item_num_id=1100001028 and sid=1800000080 order by create_time  desc;

update  t_gb_stock  set p_qty=p_qty+6 where item_num_id=1100001028 and storage_id=1800000080;

#-------------20181204------库存修复

select * from gb_share_item where barcode_1='6922151300423'
select * from u_goods_stock_log   where item_num_id=1000022130 and sid=1800000080 order by create_time  desc;


select * from t_gb_stock_20181122 where item_num_id=1000022130 and storage_id=1800000080;


select * from u_stock_log limit 1;


