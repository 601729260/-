select * from u_goods_stock_log where id='MMH2019081810082734'




select * from u_stock_log where  id='MMH2019081810082734'

select * from u_stock_log_detail where  id='MMH2019081810082734'

select * from u_stock_log_his where  id='MMH2019081810082734'

select * from u_stock_log_his where seq_id=1177999;

select * from u_stock_log_detail_his where id='MMH2019081810082734' and update_time='2019-08-18 09:42:03';


select * from u_stock_log where seq_id=1178001;


delete from u_stock_log where seq_id=1178001;
INSERT INTO `db_gd`.`u_stock_log`(`seq_id`, `id`, `style_title`, `create_time`, `update_time`, `status`, `user_id`, `user`, `pay_type`, `from_sid`, `from_sid_name`, `from_sid_type`, `from_staff_id`, `from_staff_name`, `delivery_time`, `to_sid`, `to_sid_type`, `to_sid_name`, `apply_sid`, `apply_sid_type`, `apply_sid_name`, `to_staff_id`, `to_staff_name`, `apply_staff_id`, `apply_staff_name`, `audit_staff_id`, `audit_staff_name`, `receipt_time`, `apply_time`, `total_different_num`, `total_different_price`, `total_different_purchase_price`, `provider_id`, `provider_name`, `remark`, `bill_type`, `total_from_num`, `total_price`, `total_purchase_price`, `operate_type`, `check_status`, `total_check_num`, `detail_num`, `total_apply_from_num`, `total_to_num`, `src_type`, `total_app_to_num`, `total_cost_price`, `from_virtual_stock_type`, `from_virtual_stock_name`, `to_virtual_stock_type`, `to_virtual_stock_name`, `group_id`, `total_different_cost_price`, `audit_time`, `cancel_deliver_time`, `cancel_apply_time`, `creating_type`) 
select `seq_id`, `id`, `style_title`, `create_time`, `update_time`, `status`, `user_id`, `user`, `pay_type`, `from_sid`, `from_sid_name`, `from_sid_type`, `from_staff_id`, `from_staff_name`, `delivery_time`, `to_sid`, `to_sid_type`, `to_sid_name`, `apply_sid`, `apply_sid_type`, `apply_sid_name`, `to_staff_id`, `to_staff_name`, `apply_staff_id`, `apply_staff_name`, `audit_staff_id`, `audit_staff_name`, `receipt_time`, `apply_time`, `total_different_num`, `total_different_price`, `total_different_purchase_price`, `provider_id`, `provider_name`, `remark`, `bill_type`, `total_from_num`, `total_price`, `total_purchase_price`, `operate_type`, `check_status`, `total_check_num`, `detail_num`, `total_apply_from_num`, `total_to_num`, `src_type`, `total_app_to_num`, `total_cost_price`, `from_virtual_stock_type`, `from_virtual_stock_name`, `to_virtual_stock_type`, `to_virtual_stock_name`, `group_id`, `total_different_cost_price`, `audit_time`, `cancel_deliver_time`, `cancel_apply_time`, `creating_type` 
from u_stock_log_his where seq_id=1177999;


delete from u_stock_log_detail where id='MMH2019081810082734';
INSERT INTO `db_gd`.`u_stock_log_detail`(`seq_id`, `id`, `style_num_id`, `create_time`, `update_time`, `status`, `style_code`, `style_title`, `purchase_price`, `total_purchase_price`, `price`, `num`, `apply_from_num`, `from_num`, `to_num`, `from_qty`, `to_qty`, `qty`, `total_qty`, `p_qty`, `from_p_qty`, `to_p_qty`, `total_price`, `total_different_num`, `total_different_price`, `total_different_purchase_price`, `unit_id`, `unit`, `barcode`, `item_num_id`, `sku_title_one`, `sku_title_two`, `shelf_life`, `produce_date`, `one_value`, `goods_brand_id`, `goods_brand_name`, `goods_type`, `to_sid`, `to_sid_type`, `apply_sid`, `apply_sid_type`, `from_sid`, `from_sid_type`, `to_staff_id`, `to_staff_name`, `from_staff_id`, `from_staff_name`, `bill_type`, `check_result`, `operate_type`, `check_status`, `check_num`, `src_type`, `app_to_num`, `box_num`, `cost_price`, `total_cost_price`, `tax_rate`, `from_virtual_stock_type`, `from_virtual_stock_name`, `to_virtual_stock_type`, `to_virtual_stock_name`, `group_id`, `total_different_cost_price`, `multiple_receipt_time`) 
select `seq_id`, `id`, `style_num_id`, `create_time`, `update_time`, `status`, `style_code`, `style_title`, `purchase_price`, `total_purchase_price`, `price`, `num`, `apply_from_num`, `from_num`, `to_num`, `from_qty`, `to_qty`, `qty`, `total_qty`, `p_qty`, `from_p_qty`, `to_p_qty`, `total_price`, `total_different_num`, `total_different_price`, `total_different_purchase_price`, `unit_id`, `unit`, `barcode`, `item_num_id`, `sku_title_one`, `sku_title_two`, `shelf_life`, `produce_date`, `one_value`, `goods_brand_id`, `goods_brand_name`, `goods_type`, `to_sid`, `to_sid_type`, `apply_sid`, `apply_sid_type`, `from_sid`, `from_sid_type`, `to_staff_id`, `to_staff_name`, `from_staff_id`, `from_staff_name`, `bill_type`, `check_result`, `operate_type`, `check_status`, `check_num`, `src_type`, `app_to_num`, `box_num`, `cost_price`, `total_cost_price`, `tax_rate`, `from_virtual_stock_type`, `from_virtual_stock_name`, `to_virtual_stock_type`, `to_virtual_stock_name`, `group_id`, `total_different_cost_price`, `multiple_receipt_time`
from u_stock_log_detail_his
where seq_id in (175509493,175509494,175509492)
