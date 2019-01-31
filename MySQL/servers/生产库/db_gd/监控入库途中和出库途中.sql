select * from  t_gb_stock

select * from t_gb_stock a left join 
(select to_sid,item_num_id ,sum(from_num-ifnull(to_num,0)) as in_qty from u_stock_log_detail where status in (1,3,5) group by to_sid,item_num_id ) b
on a.shop_id=b.to_sid and a.item_num_id=b.item_num_id
where a.in_qty!=ifnull(b.in_qty,0)
and a.shop_id!=0;


select * from t_gb_stock a left join 
(select to_sid,item_num_id ,sum(from_num-ifnull(to_num,0)) as in_qty from u_stock_log_detail where status in (1,3,5) group by to_sid,item_num_id ) b
on a.storage_id=b.to_sid and a.item_num_id=b.item_num_id
where a.in_qty!=ifnull(b.in_qty,0)
and a.storage_id!=0;




select * from t_gb_stock a left join 
(select from_sid,item_num_id ,sum(from_num-ifnull(to_num,0)) as out_qty 
from u_stock_log_detail where status in (1,3,5) group by from_sid,item_num_id ) b
on a.shop_id=b.from_sid and a.item_num_id=b.item_num_id
where a.out_qty!=ifnull(b.out_qty,0)
and a.shop_id!=0;


update t_gb_stock a left join 
(select to_sid,item_num_id ,sum(from_num-ifnull(to_num,0)) as in_qty from u_stock_log_detail where status in (1,3,5) group by to_sid,item_num_id ) b
on a.shop_id=b.to_sid and a.item_num_id=b.item_num_id
set a.in_qty=ifnull(b.in_qty,0)
where a.in_qty!=ifnull(b.in_qty,0)
and a.shop_id!=0;



update  t_gb_stock a inner join 
(select from_sid,item_num_id ,sum(from_num-ifnull(to_num,0)) as out_qty 
from u_stock_log_detail where status in (1,3,5) group by from_sid,item_num_id ) b
on a.shop_id=b.from_sid and a.item_num_id=b.item_num_id
set a.out_qty=ifnull(b.out_qty,0)
where a.out_qty!=ifnull(b.out_qty,0)
and a.shop_id!=0;