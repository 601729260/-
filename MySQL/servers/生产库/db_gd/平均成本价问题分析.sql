
select * from t_average_cost_price a left join gb_share_item b on a.item_num_id=b.item_num_id
where b.BARCODE_1=3701032410238;

select * from t_average_cost_price_log where sid=1500000122 and item_num_id=1000000662;