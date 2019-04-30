select * from u_goods_stock_log where sid=1500000143 and item_num_id=1100002489;

select * from u_goods_stock_log where sid=1500000131 and item_num_id=1100002811;

select * from t_gb_stock where shop_id=1500000131 and item_num_id=1100002811;


select item_num_id, shop_id, qty  from t_gb_stock where (shop_id=1500000128 and item_num_id=1100001394) or (shop_id=1500000143 and item_num_id=1100002489) or (storage_id=1800000080 and item_num_id=293848) or (storage_id=1800000080 and item_num_id=1000001699) or (storage_id=1800000080 and item_num_id=1100004358) or (storage_id=1800000080 and item_num_id=1100004712)


select item_num_id, shop_id, qty  from t_gb_stock where (shop_id=1500000140 and item_num_id=1000001343) or (shop_id=1500000109 and item_num_id=374483) 


----------------------------修复数据-----------------------------------------

update t_gb_stock set qty=qty+200 where shop_id=1500000128 and item_num_id=1100001394;
update t_gb_stock set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;
update t_gb_stock set qty=qty-1 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock set qty=qty+5 where storage_id=1800000080 and item_num_id=1100004358;
update t_gb_stock set qty=qty+8 where storage_id=1800000080 and item_num_id=1100004712;


update t_gb_stock set qty=qty+3 where shop_id=1500000131 and item_num_id=430106;
update t_gb_stock set qty=qty+3 where shop_id=1500000131 and item_num_id=1100002811;



create table u_goods_stock_log_MPOS143110875016223 as select * from u_goods_stock_log where id='MPOS143110875016223';
delete from u_goods_stock_log where seq_id=915586;
update t_gb_stock set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;
update t_gb_stock_20190306 set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;
update t_gb_stock_20190307 set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;
update t_gb_stock_20190308 set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;
update t_gb_stock_20190309 set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;
update t_gb_stock_20190310 set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;
update t_gb_stock_20190311 set qty=qty+1  where shop_id=1500000140 and item_num_id=1000001343;



create table u_goods_stock_log_MPOS146260671415308 as select * from u_goods_stock_log where id='MPOS146260671415308';
delete from u_goods_stock_log where seq_id=853232;
update t_gb_stock set qty=qty+2 where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190226 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190227 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190228 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190301 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190302 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190303 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190304 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190305 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190306 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190307 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190308 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190309 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190310 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;
update t_gb_stock_20190311 set qty=qty+2  where shop_id=1500000109 and item_num_id=374483;












