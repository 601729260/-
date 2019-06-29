select * from t_virtual_stock where  limit 1;

select * from t_virtual_stock_member ;

select b.BARCODE_1 as '条形码',c.sku_name as '品名',a.qty as '库存' from t_virtual_stock a
left join gb_share_item b on a.item_num_id=b.item_num_id
left join gb_share_item_ext c on a.item_num_id=c.item_num_id
where sid=1800000080 and virtual_stock_type=7;

select * from t_virtual_stock limit 100;

create table t_virtual_stock_20190629 as select * from t_virtual_stock;
update t_virtual_stock set qty=0;