
select barcode_1 as 条形码,1  as 发货数量 from gb_share_item where is_deleted=0 limit 1000;

select bill_type,id,count(1) from u_stock_log_detail group by bill_type, id order by count(1) desc limit 1000;