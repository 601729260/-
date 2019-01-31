select * from u_goods_stock_log where id='MMH2019012310027319' and item_num_id=886453;

select * from u_goods_stock_log where sid=1500000146 and item_num_id=1000002827;

select * from t_gb_stock where  shop_id=1500000146 and item_num_id=886453;


select * from u_stock_log_detail where barcode='7613035982949' and id='MMH2019012310027319' 


select * from u_stock_log_detail_his where barcode='7613035982949' and id='MMH2019012310027319' 

select * from u_stock_log_detail_his where  id='MMH2019012310027318' ;

select * from u_goods_stock_log where id='MMH2019012310027319' and ;




select * from u_stock_log_his where id='MMH2019012310027319' ;

select * from u_stock_log where id='MMH2019012310027319' ;

select * from u_goods_stock_log where id='MMH2019012310027319' ;
select * from u_stock_log where id='MMH2019012310027319' ;

select * from u_stock_log where audit_staff_name='zengli' and bill_type=5;

select * from u_stock_log where id='MMH2019012310027254' ;


select * from u_stock_log where group_id='MMH2019012310027319';

select * from u_goods_stock_log_MMH2019012310027254 where item_num_id=886453 and id='MMH2019012310027254' ;


select * from  u_stock_log where id='MMH2019011610024391';

select * from u_stock_log_detail where id='MMH2018112110007068';

select a.from_num,b.from_num ,a.from_num-b.to_num*3 from u_stock_log_detail a inner join u_stock_log_detail b on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id
where a.id='MMH2019011610024391' 
and b.id='MMH2018112110007068';



select a.from_num,b.from_num ,a.check_num-(a.from_num-b.to_num*3),a.total_different_num from u_stock_log_detail a inner join u_stock_log_detail b on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id
where a.id='MMH2019011610024391' 
and b.id='MMH2018112110007068';


select a.item_num_id,a.from_num,b.to_num ,a.check_num-(a.from_num-b.to_num*3),a.total_different_num from u_stock_log_detail a inner join u_stock_log_detail b on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id
where a.id='MMH2019011610024391' 
and b.id='MMH2018112110007068';





select sum((a.from_num-b.to_num*3)*a.cost_price) from u_stock_log_detail a inner join u_stock_log_detail b on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id
where a.id='MMH2019011610024391' 
and b.id='MMH2018112110007068';

select * from u_stock_log a where a.id='MMH2019011610024391' ;

select total_cost_price*3 from u_stock_log b where b.id='MMH2018112110007068' ;



select a.from_num,b.from_num ,a.from_qty-b.to_num*3 from 
(select * from u_stock_log_detail a where a.id='MMH2019011610024391') a inner join 
(select * from u_stock_log_detail a where a.id='MMH2018112110007068') b
on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id;


select sum(b.to_num*3*a.cost_price) from 
(select * from u_stock_log_detail a where a.id='MMH2019011610024391') a inner join 
(select * from u_stock_log_detail a where a.id='MMH2018112110007068') b
on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id;


create table wgn_stock_log_detail_bak20190124 as select * from u_stock_log_detail where id='MMH2019011610024391';

create table wgn_stock_log_bak20190124 as select * from u_stock_log where id='MMH2019011610024391';

update u_stock_log_detail a inner join u_stock_log_detail b on a.to_sid=b.to_sid and a.item_num_id=b.item_num_id
set a.from_num=b.from_num-b.to_num*3,
a.total_qty=a.total_qty-b.to_num*3
where a.id='MMH2019011610024391' 
and b.id='MMH2018112110007068';



update u_stock_log_detail a set 
a.total_price=a.price*a.from_num,
a.total_different_num=a.check_num-a.from_num,
a.total_different_price=a.price*a.total_different_num,
a.total_different_purchase_price=a.purchase_price*a.total_different_num,
a.total_cost_price=a.cost_price*a.total_different_num,
a.total_different_cost_price=a.cost_price*a.total_different_num
where a.id in 
('MMH2019011610024391');


update u_stock_log  a inner join 
(select id,sum(total_price) as total_price,
sum(total_qty) as total_qty,
sum(total_different_num) as total_different_num,
sum(total_different_price) as total_different_price,
sum(total_different_purchase_price) as total_different_purchase_price,
sum(total_cost_price) as total_cost_price ,
sum(total_different_cost_price) as total_different_cost_price 
from u_stock_log_detail 
where id in ('MMH2019011610024391')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_different_num=b.total_different_num,
a.total_different_price=b.total_different_price,
a.total_different_purchase_price=b.total_different_purchase_price,
a.total_cost_price=b.total_cost_price ,
a.total_different_cost_price=b.total_different_cost_price
where a.id in ('MMH2019011610024391');


select * from u_stock_log where id='MMH2019011610024391';



