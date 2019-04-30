#异常监控修复
  

select  * from  u_goods_stock_log where sid=1500000145 and item_num_id=1000027241;

select  * from  t_gb_stock where shop_id=1500000145 and item_num_id=1000027241;

select  * from  t_gb_stock where storage_id=1000000003 and item_num_id=1000000049;


1800000080  1000011518
1800000080  1000027226








146150115961507	146150115961507


select * from u_goods_stock_log where seq_id in (768974,774584,774607,769034,782500,777698)

delete from u_goods_stock_log where seq_id in (768974,774584,774607,769034,782500,777698);
update   t_gb_stock set qty=qty+3 where shop_id=1500000145 and item_num_id=1000027241;
update   t_gb_stock_20190215 set qty=qty+3 where shop_id=1500000145 and item_num_id=1000027241;


stock:sid:1500000145:sku:1000027241
