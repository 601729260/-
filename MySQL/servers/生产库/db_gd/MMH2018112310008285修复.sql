#=========当作重复收货删除了一条记录，现在补回=========================


select * from u_goods_stock_log where id='MMH2018112310008285' and seq_id=181000;

INSERT INTO `db_gd`.`u_goods_stock_log`( `id`, `item_num_id`, `style_num_id`, `create_time`, `style_code`, `style_title`, `price`, `total_price`, `sid`, `sid_name`, `sid_type`, `pre_qty`, `pre_p_qty`, `qty_change`, `p_qty_change`, `staff_id`, `staff_name`, `user_id`, `user`, `operate_type`, `pre_seq_id`, `one_value`, `bill_type`) 
VALUES ('MMH2018112310008285', 1000000165, 1000000152, '2018-11-26 10:34:21', NULL, NULL, NULL, NULL, 1800000080, '唯小宝门店仓', 3, 10, 75, 0, 66, NULL, '蒋琴', NULL, NULL, 10, NULL, NULL, 0);

update t_gb_stock set p_qty=p_qty+66 where storage_id=1800000080 and item_num_id=1000000165;


select * from  t_gb_stock where storage_id=1800000080 and item_num_id=1000000165;


select * from u_goods_stock_log 