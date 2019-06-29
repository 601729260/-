//初始化条形码
select * from t_order_line limit 100;

update t_order_line a left join gb_share_item b on a.good_item_id=b.item_num_id and b.IS_DELETED=0
set a.barcode=b.BARCODE_1;


select count(1) from  gb_share_item;、

create table t_virtual_stock_2019190629 as select * from t_virtual_stock;