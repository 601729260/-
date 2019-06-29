select count(*) from u_stock_log_detail_his;

select count(*) from u_stock_log_detail;

select barcode,id,count(1) from u_stock_log_detail_his group by barcode,id having count(1)>1;