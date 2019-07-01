	select * from 	t_virtual_stock where qty>0 limit 1;
	
	select a.virtual_stock_name,b.* from t_virtual_stock_member  a left join t_virtual_stock b
	on a.virtual_stock_type=b.virtual_stock_type
	
