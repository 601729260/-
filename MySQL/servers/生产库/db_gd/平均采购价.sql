
select * from t_average_cost_price a left join gb_share_item b on a.item_num_id=b.item_num_id
where b.BARCODE_1=6943216413896;

select * from t_average_cost_price_log where sid in (1) and item_num_id=1100020426;

select * from t_average_cost_price 


select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100020426;



update t_average_cost_price set avarage_purchase_price=total_purchase_price/total_purchase_num 

update  t_average_cost_price a  inner join gb_share_item b on a.item_num_id=b.item_num_id  
set avarage_cost_price=0,avarage_purchase_price=total_purchase_price/total_purchase_num 
where b.BARCODE_1=6902083917494
and a.item_num_id=1100020715;


select * from u_stock_log_detail where item_num_id=1100020426 and to_sid=1800000080;

select * from u_goods_stock_log where item_num_id=1100020426 and sid=1800000080;


select * from u_stock_log_detail where id='MMH2019092310092307';
