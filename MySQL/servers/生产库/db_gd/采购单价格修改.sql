
#-------------20181217-------
MMH2018121010013379，3760179012316，这个商品的进价也从97调成98


select * from  u_stock_log_detail where id='MMH2018121010013379' and barcode=3760179012316;

update u_stock_log_detail set purchase_price=98 where id='MMH2018121010013379' and barcode=3760179012316;