select * from t_gb_stock_20181130;

select * from gb_cort_sub_unit limit 1;



select c.sub_unit_name as '门店',a.shop_id as '门店ID',b.BARCODE_1 as '条形码',ext.sku_name as '品名',a.qty as '库存' from t_gb_stock_20181122 a 
left join gb_share_item b on a.item_num_id=b.item_num_id
left join gb_share_item_ext ext on a.item_num_id=ext.item_num_id
left join gb_cort_sub_unit c on a.shop_id=c.SUB_UNIT_NUM_ID 
where a.shop_id!=0 union all 
select c.storage_name as '门店',a.storage_id as '门店ID',b.BARCODE_1 as '条形码',ext.sku_name as '品名',a.qty as '库存' from t_gb_stock_20181122 a 
left join gb_share_item b on a.item_num_id=b.item_num_id
left join gb_share_item_ext ext on a.item_num_id=ext.item_num_id
left join gb_storage c on a.storage_id=c.storage_num_id 
where a.storage_id!=0 ;


select * from gb_storage;