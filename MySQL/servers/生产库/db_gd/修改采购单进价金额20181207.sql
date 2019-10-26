update u_stock_log_detail set purchase_price=22.50,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312616940;
update u_stock_log_detail set purchase_price=35.40,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312676814;
update u_stock_log_detail set purchase_price=24.60,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312676777;
update u_stock_log_detail set purchase_price=22.50,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312616957;
update u_stock_log_detail set purchase_price=24.60,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312676838;
update u_stock_log_detail set purchase_price=24.60,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312676784;
update u_stock_log_detail set purchase_price=25.50,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312616971;
update u_stock_log_detail set purchase_price=27.00,total_purchase_price=purchase_price*from_num where id='MMH2019081510082026' and barcode=6949312676883;   



update u_stock_log  a 
left join (select id,sum(total_purchase_price) as total_purchase_price from u_stock_log_detail where id='MMH2019081510082026' group by id  ) b on a.id=b.id
set a.total_purchase_price=b.total_purchase_price
where a.id='MMH2019081510082026';







update u_stock_log_detail set cost_price=24.75,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312616940;
update u_stock_log_detail set cost_price=38.94,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312676814;
update u_stock_log_detail set cost_price=27.06,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312676777;
update u_stock_log_detail set cost_price=24.75,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312616957;
update u_stock_log_detail set cost_price=27.06,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312676838;
update u_stock_log_detail set cost_price=27.06,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312676784;
update u_stock_log_detail set cost_price=28.05,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312616971;
update u_stock_log_detail set cost_price=29.7,total_cost_price=cost_price*from_num where id='MMH2019081510082026' and barcode=6949312676883;


update u_stock_log  a 
left join (select id,sum(total_cost_price) as total_cost_price from u_stock_log_detail where id='MMH2019081510082026' group by id  ) b on a.id=b.id
set a.total_cost_price=b.total_cost_price
where a.id='MMH2019081510082026';




