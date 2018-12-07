
select * from u_stock_log where id='MMH2018111910005744';
select * from u_stock_log_detail where id='MMH2018111910005744';


select * from u_stock_log_detail where id='MMH2018111910005771' and barcode=6948854752055;


select * from t_gb_stock where item_num_id=1100003851 and  shop_id=1500000102;

select * from t_gb_stock where item_num_id=1100003851 and  storage_id=1800000080;


INSERT INTO `db_gd_dev`.`t_gb_stock`(`src`, `shop_id`, `storage_id`, `item_num_id`, `qty`, `gb_update_time`, `mmh_update_time`, `loc_pty_num_id`, `scan_status`, `scan_update_time`, `p_qty`, `in_qty`, `out_qty`)
VALUES ('mmh', 0, 1800000080, 1100003851, 123440, '2018-11-19 11:35:02', '2018-11-19 11:35:02', 1, 1, '2018-11-19 11:33:18', 0, 0, 0);

update  t_gb_stock set p_qty=3400 where item_num_id=1100003851 and  storage_id=1800000080;


update  t_gb_stock set qty=123440 where item_num_id=1100003851 and  shop_id=1500000102;


SELECT item_num_id , qty , p_qty FROM t_gb_stock WHERE ( storage_id = 1500000102 and item_num_id in ( 1100003851 ) ) 