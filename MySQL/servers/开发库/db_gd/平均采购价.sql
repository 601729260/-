select * from t_average_cost_price where item_num_id=1000001536 and  sid in (1,1800000080);

select * from t_average_cost_price_log where item_num_id=1000001536 and  sid in (1,1800000080) and create_time>'2019-05-20 20:01:14';

19862.93  72 125.00
19862.93  72 125.00

delete from t_average_cost_price where item_num_id=1000001536 and  sid in (1,1800000080);
INSERT INTO `db_gd`.`t_average_cost_price`(`sid`, `item_num_id`, `barcode`, `sku_name`, `total_cost_price`, `total_purchase_price`, `total_num`, `total_purchase_num`, `avarage_cost_price`, `avarage_purchase_price`, `sid_type`, `create_time`, `update_time`) VALUES (1, 1000001536, NULL, NULL, 11500.00, 19862.93, 92, 72, 125.00, 125.00, 1, '2019-04-28 17:14:26', '2019-04-28 17:14:26');
INSERT INTO `db_gd`.`t_average_cost_price`(`sid`, `item_num_id`, `barcode`, `sku_name`, `total_cost_price`, `total_purchase_price`, `total_num`, `total_purchase_num`, `avarage_cost_price`, `avarage_purchase_price`, `sid_type`, `create_time`, `update_time`) VALUES (1800000080, 1000001536, NULL, NULL, 0.00, 19862.93, 0, 72, 0.00, 125.00, 3, '2019-04-28 17:12:51', '2019-04-28 17:12:51');