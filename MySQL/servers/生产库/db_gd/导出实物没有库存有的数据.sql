select * from u_stock_log  where bill_type=5 limit 10;

;

select * from gb_cort_sub_unit  limit 10;

select * from gb_share_item limit 10;





select shop.sub_unit_name as 门店,item_name as 品名 ,gb1.barcode_1 as 条码,a.qty as 库存 from t_gb_stock a 
left join gb_share_item gb1 on a.item_num_id=gb1.item_num_id
left join gb_cort_sub_unit shop on a.shop_id=shop.sub_unit_num_id
where gb1.IS_DELETED=0
and not exists(select 1 from u_stock_log_detail b where a.item_num_id=b.item_num_id and a.shop_id=b.to_sid
and b.id in('MMH2018120310011326',
'MMH2018120310011343',
'MMH2018120310011240',
'MMH2018120310011267') )
and a.shop_id in (
select to_sid  from u_stock_log where id in ('MMH2018120310011326',
'MMH2018120310011343',
'MMH2018120310011240',
'MMH2018120310011267')
) ;



wadesen 2018/12/04 下午8:12
唯小宝苏州黄桥店：MMH2018120410011551

wadesen 2018/12/04 下午8:13
唯小宝无锡硕放店：MMH2018120410011547

wadesen 2018/12/04 下午8:13
唯小宝苏州木渎店：MMH2018120410011564



select shop.sub_unit_name as 门店,item_name as 品名 ,gb1.barcode_1 as 条码,a.qty as 库存 from t_gb_stock a 
left join gb_share_item gb1 on a.item_num_id=gb1.item_num_id
left join gb_cort_sub_unit shop on a.shop_id=shop.sub_unit_num_id
where gb1.IS_DELETED=0
and a.qty<>0
and not exists(select 1 from u_stock_log_detail b where a.item_num_id=b.item_num_id and a.shop_id=b.to_sid
and b.id in('MMH2018120410011551',
'MMH2018120410011547',
'MMH2018120410011564') )
and a.shop_id in (
select to_sid  from u_stock_log where id in ('MMH2018120410011551',
'MMH2018120410011547',
'MMH2018120410011564')
) ;



MMH2018120510011952
MMH2018120510011953
MMH2018120510011924





select shop.sub_unit_name as 门店,item_name as 品名 ,gb1.barcode_1 as 条码,a.qty as 库存 from t_gb_stock a 
left join gb_share_item gb1 on a.item_num_id=gb1.item_num_id
left join gb_cort_sub_unit shop on a.shop_id=shop.sub_unit_num_id
where gb1.IS_DELETED=0
and a.qty<>0
and not exists(select 1 from u_stock_log_detail b where a.item_num_id=b.item_num_id and a.shop_id=b.to_sid
and b.id in('MMH2018120510011952',
'MMH2018120510011953',
'MMH2018120510011924') )
and a.shop_id in (
select to_sid  from u_stock_log where id in ('MMH2018120510011952',
'MMH2018120510011953',
'MMH2018120510011924')
) ;





