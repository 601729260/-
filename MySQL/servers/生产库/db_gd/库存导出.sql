需要：门店、条码、品名、商品类别、库存数量、采购进价、门店平均成本价，采购金额、门店成本金额

select c.sub_unit_name as 门店,b.barcode_1 as 条码,d.sku_name as 品名,f.pty3_name as 类别,a.qty as 库存数量,d.cost_price/100 as 门店成本价,d.purchase_price/100 as 采购进价 ,a.qty*d.cost_price/100 as 门店成本金额,a.qty*d.purchase_price/100 as 采购金额 from t_gb_stock_20181231 a 
inner join gb_share_item b on a.item_num_id=b.item_num_id
inner join gb_share_item_ext d on a.item_num_id=d.item_num_id
inner join gb_cort_sub_unit c on a.shop_id=c.sub_unit_num_id
left join gb_style e on b.style_num_id=e.style_num_id
left join gb_catelog_pty3 f on e.style_catelog_third=f.pty3_num_id
where a.shop_id!=0;


select * from gb_cort_sub_unit limit 1;

select * from gb_share_item limit 1;

select * from gb_style limit 1;

select * from gb_catelog_pty1 limit 1; 

select * from gb_catelog_pty3 limit 1; 