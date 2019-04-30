select a.sid,a.item_num_id,a.avarage_cost_price,b.cost_price/100 ,a.total_cost_price,case when a.total_num<0 then 0 else a.total_num end from  t_average_cost_price a left join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.avarage_cost_price>(b.cost_price/100)


create table t_average_cost_price_bak20190325 as select a.* from t_average_cost_price a left join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.avarage_cost_price>(b.cost_price/100);


update  t_average_cost_price a left join gb_share_item_ext b on a.item_num_id=b.item_num_id
set a.avarage_cost_price=b.cost_price/100,a.total_cost_price=b.cost_price/100*(case when a.total_num<0 then 0 else a.total_num end)
where a.avarage_cost_price>(b.cost_price/100)

select * from t_average_cost_price_bak20190325;


select * from gb_share_item where barcode_1=5712449000033;

select * from gb_cort_sub_unit  where sub_unit_num_id>1500000000  

select * from t_average_cost_price where item_num_id=1000027241 and sid=1500000163 limit 10;   

select * from t_average_cost_price_log where item_num_id=1000027241 and sid=1500000163 ;   

select * from u_goods_stock_log where id='MPOS147260147262548';


select count(1) from t_average_cost_price;

select * from gb_share_item where barcode_1=6907992633534;

select * from t_average_cost_price_Log where item_num_id=374396 and sid=1500000122;

select * from gb_share_item_ext where item_num_id=374396;


select * from t_average_cost_price_log where item_num_id=374396 and sid=1;


select * from u_goods_stock_log where id='MJC441348a6dda348b';







