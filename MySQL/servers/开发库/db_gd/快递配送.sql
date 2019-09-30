select * from t_distribution  where order_no=151080106254247 order by create_time desc limit 100;



select * from t_order where order_no='MPOS151080122067888'

select * from t_order_line where order_no='MPOS151080122067888';

select * from t_star_member_sales_detail where order_no='MPOS151080122067888' order by create_time desc limit 100;


update t_distribution set  freight_cost_price=1000 where order_no="151080112145834"; update t_distribution set  freight_cost_price=1000 where order_no="151080106292609";


select * from gb_share_item where barcode_1=486545764312785

select * from t_average_cost_price where item_num_id=1100016811;


select * from  t_average_cost_price where item_num_id=1100016811 and sid=1500000102;

update t_average_cost_price set avarage_cost_price=90  where item_num_id=1100016811 and sid=1500000102;


select * from u_goods_stock_log where item_num_id=1100016811 and sid=1500000102 ;



