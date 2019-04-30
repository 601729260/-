
select * from u_stock_log_detail where id='MMH2019011910025875' and item_num_id=886453;
create table u_stock_log_detail_MMH2019011910025875 as select * from u_stock_log_detail where id='MMH2019011910025875';
update u_stock_log_detail set from_num=6,total_qty=6 where id='MMH2019011910025875' and item_num_id=886453;
update u_stock_log_detail a set 
a.total_price=a.price*a.from_num,
a.total_different_num=a.check_num-a.from_num,
a.total_different_price=a.price*a.total_different_num,
a.total_different_purchase_price=a.purchase_price*a.total_different_num,
a.total_cost_price=a.cost_price*a.total_different_num,
a.total_different_cost_price=a.cost_price*a.total_different_num
where a.id in 
('MMH2019011910025875');

create table u_stock_log_MMH2019011910025875 as select * from u_stock_log where id='MMH2019011910025875';
update u_stock_log  a inner join 
(select id,sum(total_price) as total_price,
sum(total_qty) as total_qty,
sum(total_different_num) as total_different_num,
sum(total_different_price) as total_different_price,
sum(total_different_purchase_price) as total_different_purchase_price,
sum(total_cost_price) as total_cost_price ,
sum(total_different_cost_price) as total_different_cost_price 
from u_stock_log_detail 
where id in ('MMH2019011910025875')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_different_num=b.total_different_num,
a.total_different_price=b.total_different_price,
a.total_different_purchase_price=b.total_different_purchase_price,
a.total_cost_price=b.total_cost_price ,
a.total_different_cost_price=b.total_different_cost_price
where a.id in ('MMH2019011910025875');


create table wgn_goods_stock_log_20190131 as  select * from u_goods_stock_log where sid=1500000106 and item_num_id=886453;

delete from u_goods_stock_log where seq_id in (574136,45353);




