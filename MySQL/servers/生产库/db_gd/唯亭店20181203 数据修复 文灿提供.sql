

select concat('update t_gb_stock set qty=qty- where shop_id= and item_num_id=',a.item_num_id ,';')  from gb_share_item a where a.barcode_1 in 
(6921956656070,
6923589446431,
6949195381522,
8716200713320,
6942904511289,
6942904511685,
6942904512088,
6942904513788,
6942904513989)
and is_deleted=0;


select barcode_1,item_num_id from gb_share_item a where a.barcode_1 in 
(6921956656070,
6923589446431,
6949195381522,
8716200713320,
6942904511289,
6942904511685,
6942904512088,
6942904513788,
6942904513989)
and is_deleted=0;



create table t_gb_stock_wtbak_20181203 as select * from t_gb_stock where shop_id=1500000115;
update t_gb_stock set qty=qty-6 where shop_id=1500000115 and item_num_id=430091;
update t_gb_stock set qty=qty-6 where shop_id=1500000115 and item_num_id=1000000571;
update t_gb_stock set qty=qty-1 where shop_id=1500000115 and item_num_id=1000000618;
update t_gb_stock set qty=qty-3 where shop_id=1500000115 and item_num_id=1000001384;
update t_gb_stock set qty=qty-1 where shop_id=1500000115 and item_num_id=1100003071;
update t_gb_stock set qty=qty-1 where shop_id=1500000115 and item_num_id=1100003080;
update t_gb_stock set qty=qty-2 where shop_id=1500000115 and item_num_id=1100003081;
update t_gb_stock set qty=qty-1 where shop_id=1500000115 and item_num_id=1100003082;







