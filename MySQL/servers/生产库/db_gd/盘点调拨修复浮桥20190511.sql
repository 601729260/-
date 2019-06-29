

select * from u_stock_log where id='MMH2018111810006121';
select * from u_stock_log_detail where id='MMH2018111810006121' and barcode='8716200713184';


# 修复调拨单
create table u_stock_log_detail_MMH2018111810006121 as select * from u_stock_log_detail where id='MMH2018111810006121' and barcode='8716200713184';

update u_stock_log_detail
set num=6,
to_num=6,
total_cost_price=to_num*cost_price
where id='MMH2018111810006121' and barcode='8716200713184';

create table u_stock_log_MMH2018111810006121 as select * from u_stock_log where id='MMH2018111810006121';


update u_stock_log  a inner join 
(select id,sum(total_price) as total_price,
sum(total_cost_price) as total_cost_price 
from u_stock_log_detail 
where id in ('MMH2018111810006121')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_cost_price=b.total_cost_price 
where a.id in ('MMH2018111810006121');



# 修复盘点单

create table u_stock_log_detail_MMH2018121810015763 as  select * from u_stock_log_detail where id='MMH2018121810015763' and barcode='8716200713184';
create table u_stock_log_MMH2018121810015763 as  select * from u_stock_log where id='MMH2018121810015763';



update u_stock_log_detail a set 
a.check_num=18,
a.total_price=a.price*a.from_num,
a.total_different_num=a.check_num-a.from_num,
a.total_different_price=a.price*a.total_different_num,
a.total_different_purchase_price=a.purchase_price*a.total_different_num,
a.total_cost_price=a.cost_price*a.total_different_num,
a.total_different_cost_price=a.cost_price*a.total_different_num
where a.id='MMH2018121810015763' and barcode='8716200713184';


update u_stock_log  a inner join 
(select id,sum(total_price) as total_price,
sum(total_qty) as total_qty,
sum(total_different_num) as total_different_num,
sum(total_different_price) as total_different_price,
sum(total_different_purchase_price) as total_different_purchase_price,
sum(total_cost_price) as total_cost_price ,
sum(total_different_cost_price) as total_different_cost_price 
from u_stock_log_detail 
where id in ('MMH2018121810015763')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_different_num=b.total_different_num,
a.total_different_price=b.total_different_price,
a.total_different_purchase_price=b.total_different_purchase_price,
a.total_cost_price=b.total_cost_price ,
a.total_different_cost_price=b.total_different_cost_price
where a.id in ('MMH2018121810015763');




# 修复库存记录

create table u_goods_stock_log_MMH2018111810006121 as  select * from u_goods_stock_log where id='MMH2018111810006121' and  item_num_id=374431 and sid=1500000147;
update u_goods_stock_log set qty_change=6 where id='MMH2018111810006121' and  item_num_id=374431 and sid=1500000147;

create table u_goods_stock_log_MMH2018121810015763 as select * from u_goods_stock_log where id='MMH2018121810015763' and  item_num_id=374431 and sid=1500000147;
update u_goods_stock_log set qty_change=-6 where id='MMH2018121810015763' and  item_num_id=374431 and sid=1500000147;


