select  * from u_stock_log_detail where id='MMH2019013010029268' order by barcode;

select id,barcode from u_stock_log_detail where id='MMH2019013010029268' group by id,barcode having count(1)>1;

MMH2019013010029268	6948012002299
MMH2019013010029268	6948012002367

select id,barcode from u_stock_log_detail where create_time>'2018-12-01 00:00:00:00' group by id,barcode having count(1)>1;

MMH2018120810013023  4897058825947

select  * from  u_stock_log_detail where id='MMH2019013010029268' and barcode in ('6948012002299','6948012002367');


select  * from  u_stock_log_detail where id='MMH2019013010029268' and barcode=6948012002367;



select  * from  u_stock_log_detail_his where id='MMH2019013010029268' and barcode=6948012002367;


select * from u_stock_log_detail where seq_id in (107885532,107885533);

1100001808
1100001811

select * from u_goods_stock_log where id='MMH2019013010029268' and item_num_id in (1100001808,1100001811);


select  * from  u_stock_log_detail where id='MMH2019013010029268' and barcode in ('6948012002299','6948012002367');

create table u_stock_log_MMH2019013010029268 as select  * from u_stock_log where id='MMH2019013010029268';
create table u_stock_log_detail_MMH2019013010029268 as select  * from u_stock_log_detail where id='MMH2019013010029268';



delete from u_stock_log_detail where seq_id in (107885532,107885533);
update u_stock_log  a inner join 
(select id,sum(total_price) as total_price,
sum(total_cost_price) as total_cost_price ,
sum(total_purchase_price) as total_purchase_price from u_stock_log_detail 
where id in ('MMH2019013010029268')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_cost_price=b.total_cost_price ,
a.total_purchase_price=b.total_purchase_price
where a.id in ('MMH2019013010029268');


select total_price from u_stock_log;

select  total_price from u_stock_log_detail;