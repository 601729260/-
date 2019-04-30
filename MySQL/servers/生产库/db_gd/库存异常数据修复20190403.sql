

#-----------------刷新库存------------

select * from t_gb_stock a where (shop_id=1500000122 and item_num_id=1100004358) or(shop_id=1500000123 and item_num_id=20000751) or(shop_id=1500000142 and item_num_id=1100006169) or(shop_id=1500000142 and item_num_id=1100006464) or(shop_id=1500000145 and item_num_id=1000001650) or(storage_id=1800000080 and item_num_id=293848) or(storage_id=1800000080 and item_num_id=1000001699) or(storage_id=1800000080 and item_num_id=1100004358) or(storage_id=1800000080 and item_num_id=1100004712);

#-----------------数据修复


INSERT INTO `db_gd`.`u_goods_stock_log`( `id`, `item_num_id`, `style_num_id`, `create_time`, `style_code`, `style_title`, `price`, `total_price`, `sid`, `sid_name`, `sid_type`, `pre_qty`, `pre_p_qty`, `qty_change`, `p_qty_change`, `staff_id`, `staff_name`, `user_id`, `user`, `operate_type`, `pre_seq_id`, `one_value`, `bill_type`, `cost_price`, `purchase_price`) 
VALUES ('MPOS146150642129859', 1000000552, NULL, '2019-02-15 15:23:32', NULL, NULL, NULL, NULL, 1500000110, '唯小宝昆山城北店', 2, 9, 0, -1, 0, NULL, '战利娟', NULL, NULL, 3, NULL, NULL, 200005, 259.00, NULL);





update t_gb_stock set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190314 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190315 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190316 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190317 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190318 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190319 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190320 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190321 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190322 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190323 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190324 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190325 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190326 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190327 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190328 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190329 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190330 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190331 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190401 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190402 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;
update t_gb_stock_20190403 set qty=qty-1 where shop_id=1500000121 and item_num_id=1000001366;


update t_gb_stock set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190315 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190316 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190317 set qty=qty-5 where shop_id=1500000121 and item_num_id=1100004358;
update t_gb_stock_20190318 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190319 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190320 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190321 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190322 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190323 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190324 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190325 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190326 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190327 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190328 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190329 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190330 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190331 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190401 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190402 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;
update t_gb_stock_20190403 set qty=qty-5 where shop_id=1500000122 and item_num_id=1100004358;




update t_gb_stock set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190325 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190326 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190327 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190328 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190329 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190330 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190331 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190401 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190402 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;
update t_gb_stock_20190403 set qty=qty-1 where shop_id=1500000123 and item_num_id=20000751;



update t_gb_stock set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006169;
update t_gb_stock_20190330 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006169;
update t_gb_stock_20190331 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006169;
update t_gb_stock_20190401 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006169;
update t_gb_stock_20190402 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006169;
update t_gb_stock_20190403 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006169;

update t_gb_stock set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006464;
update t_gb_stock_20190330 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006464;
update t_gb_stock_20190331 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006464;
update t_gb_stock_20190401 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006464;
update t_gb_stock_20190402 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006464;
update t_gb_stock_20190403 set qty=qty+1 where shop_id=1500000142 and item_num_id=1100006464;

update t_gb_stock set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190327 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190328 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190329 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190330 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190331 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190401 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190402 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;
update t_gb_stock_20190403 set qty=qty+1 where shop_id=1500000145 and item_num_id=1000001650;

delete from  u_goods_stock_log where seq_id=975060;



update t_gb_stock a set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;

update t_gb_stock a set qty=qty-1 where storage_id=1800000080 and item_num_id=1000001699;

update t_gb_stock a set qty=qty+5 where storage_id=1800000080 and item_num_id=1100004358;

update t_gb_stock a set qty=qty+8 where storage_id=1800000080 and item_num_id=1100004712;

select * from u_goods_stock_log  where sid=1500000110 and item_num_id=1000000552;

stock:sid:1500000110:sku:1000000552
update t_gb_stock set qty=qty-1 where sid=1500000110 and item_num_id=1000000552;

