select * from gb_cort_sub_unit where sale_status=1 limit 100;

	select * from  gb_share_item where style_num_id=807550 and style_desc='CS769-N017OS' limit 10; 
	
	select * from gb_style where style_id='cs769' limit 10;
	
	select * from gb_cort_sub_unit where online_sub_unit_name like '%e家%' limit 10;
	
	select * from t_gb_stock where item_num_id=425238 and shop_id=90062810;
	
	select * from gb_online where sid=90062810 and item_id=425238;
	
select * from t_operate_log  where  op_content='更新sku状态/skuOnlineHandel.do'  and op_params like '%425238%' order by op_time desc limit 10;