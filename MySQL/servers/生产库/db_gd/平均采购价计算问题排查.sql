select * from u_goods_stock_log where id='MMH2019052310061237' and item_num_id=1000001536;

select * from u_goods_stock_log where id='MMH2019052310061254' and item_num_id=1000001536;


select * from t_average_cost_price_log where  id='MMH2019052310061237' and item_num_id=1000001536;

select * from  t_average_cost_price limit 100;

select * from t_average_cost_price  where  item_num_id=1000001536 and sid in (1,1800000080);


select * from u_goods_stock_log where id=
update t_average_cost_price set avarage_purchase_price=if(total_purchase_num!=0,total_purchase_price/total_purchase_num,avarage_purchase_price)
;

update u_goods_stock_log a left join u_stock_log_detail b on a.id=b.id and a.item_num_id=b.item_num_id
set a.purchase_price=b.purchase_price
where a.bill_type in (0,6)
and b.bill_type in (0,6);

create table t_average_cost_price_bak20190603 as select * from  t_average_cost_price;
update t_average_cost_price a left join (
select sid,item_num_id ,sum(purchase_price*(qty_change+p_qty_change)) as price,sum(qty_change+p_qty_change) as num,sum(purchase_price*(qty_change+p_qty_change))/sum(qty_change+p_qty_change) as result 
from u_goods_stock_log 
where bill_type in (0,6)
and sid in (1,1800000080)
group by sid,item_num_id ) b on a.item_num_id=b.item_num_id
set a.avarage_purchase_price=b.result,
a.total_purchase_price=b.price,
a.total_purchase_num =b.num
where  a.sid in (1,1800000080);

select * from u_goods_stock_log where item_num_id=429815 and bill_type in (0,6);

select * from u_stock_log_detail where id='MMH2019010310020403' and item_num_id=429815;





select a.item_num_id,a.cost_price /100,b.avarage_purchase_price from gb_share_item_ext a left join t_average_cost_price b on a.item_num_id=b.item_num_id
where a.purchase_price/100<b.avarage_purchase_price
and b.sid in (1,1800000080);


select * from t_average_cost_price limit 100; 


select * from u_goods_stock_log where id='MMH2019052310061254';
MMH2019052310061237





select * from u_goods_stock_log where item_num_id=1000003061 and bill_type in (0,6);

