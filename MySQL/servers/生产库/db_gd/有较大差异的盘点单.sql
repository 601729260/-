select distinct  to_sid,detail_num from u_stock_log where bill_type=5 and status=8 and detail_num>1000;


select distinct  to_sid from u_stock_log where bill_type=5 and status=8 and detail_num>1000;

select * from gb_cort_sub_unit limit 100;

select distinct shop_id from t_gb_stock_20190219 where shop_id>1500000000;

select a.sid ,count(1) from (
select distinct shop_id as sid from t_gb_stock_20190219 where shop_id>1500000000 
union all 
select distinct  to_sid as sid from u_stock_log where bill_type=5 and status=8 and detail_num>1000) a
group by a.sid having count(1)=1;


select   create_time ,to_sid,sum(total_different_cost_price) as total_different_cost_price from u_stock_log where bill_type=5 and status=8 and detail_num>1000 group by to_sid ,create_time order by  create_time ,total_different_cost_price;


select * from u_stock_log where to_sid=1500000119  and bill_type=5 and status=8;

select * from  u_stock_log_detail where id='MMH2019012310027244' order by total_different_cost_price;

select * from  u_stock_log_detail where id='MMH2019012310027244' and item_num_id=374326;

select * from u_goods_stock_log where sid=1500000119 and item_num_id=374326;

select * from t_gb_stock_20181222 where shop_id=1500000119 and item_num_id=374326;

select * from  u_goods_stock_log where item_num_id=374326  and sid in (1500000114,
1500000116,
1500000119,
1500000131,
1500000133,
1500000134,
1500000136,
1500000141)
order by sid;


select * from t_gb_stock_bak_20181128 where item_num_id=374326;

select * from t_gb_stock_bak_20181123 where item_num_id=374326;



#------------------------梅李店数据修复----------------------------

select sum(total_different_cost_price) from u_stock_log where to_sid=1500000114 and bill_type=5 and status=8 ;

select * from u_stock_log where to_sid=1500000114 and bill_type=5 and status=8 order by  total_different_cost_price;

select * from u_stock_log_detail where id='MMH2019012410027681' order by total_different_cost_price;

select sum(total_different_cost_price) from u_stock_log_detail where id='MMH2019012410027681'  


select * from u_stock_log_detail where id='MMH2019012410027681' and style_title like '%启赋%';

select * from u_stock_log_detail where id='MMH2019013110029408' order by total_different_cost_price;



select substr(style_title,1,3),sum(total_different_cost_price) as total_different_cost_price from u_stock_log_detail where to_sid=1500000114 and bill_type=5 and status=8 group by substr(style_title,1,3) order by  total_different_cost_price;

select * from u_stock_log_detail where substr(style_title,1,3) in ('惠氏启');


select * from u_goods_stock_log where sid=

1500000114	374325
1500000114	1000000561
1500000114	1000000555
1500000114	432220
1500000114	374326

select * from gb_share_item where item_num_id in(374325,1000000561,1000000555,432220,374326);

select * from u_stock_log_detail where bill_type=5 and to_sid=1500000114 and item_num_id in (1000000555,1000000561);


1500000114	374326		39	

1500000114	374325	15	

1500000114 432194 3760179010787


7613035260207
7613035260160

select  * from  gb_share_item where barcode_1 =3760179010787

select  * from  gb_share_item where item_num_id in (374325,374326);

select * from 


