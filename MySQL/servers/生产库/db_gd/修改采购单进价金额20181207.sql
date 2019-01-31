update u_stock_log_detail set purchase_price=88.5,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992630045;
update u_stock_log_detail set purchase_price=29,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992440156;
update u_stock_log_detail set purchase_price=71,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992633671;
update u_stock_log_detail set purchase_price=34,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992440071;
update u_stock_log_detail set purchase_price=96.3,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992633350;
update u_stock_log_detail set purchase_price=61.5,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992300054;
update u_stock_log_detail set purchase_price=22.5,total_purchase_price=purchase_price*from_num where id='MMH2018120510012043' and barcode=6907992813080;


update u_stock_log  a 
left join (select id,sum(total_purchase_price) as total_purchase_price from u_stock_log_detail where id='MMH2018120510012043' group by id  ) b on a.id=b.id
set a.total_purchase_price=b.total_purchase_price
where a.id='MMH2018120510012043';