
truncate table t_average_cost_price;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,avarage_cost_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,2 from wgn_init_average_price_result b where b.sid!=1800000080;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,avarage_purchase_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,3 from wgn_init_average_price_result b where b.sid=1800000080;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b where b.sid!=1800000080 group by item_num_id;

update t_average_cost_price a 
inner join 
(select 1 as sid,item_num_id,sum(total_cost_price) as total_purchase_price,sum(qty) as total_purchase_num from wgn_init_average_price_result b where b.sid=1800000080 group by item_num_id) b
on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.total_purchase_price=b.total_purchase_price ,a.total_purchase_num=b.total_purchase_num 
where a.sid=1;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b
where b.sid=1800000080  and not exists(select 1 from t_average_cost_price  a where a.sid=1 and a.item_num_id=b.item_num_id) group by item_num_id;

update t_average_cost_price a  set avarage_cost_price=total_cost_price/total_num where total_num!=0 and sid=1;
update t_average_cost_price a set avarage_purchase_price=total_purchase_price/total_purchase_num where total_purchase_num!=0 and sid=1;

update  t_average_cost_price set avarage_cost_price=0 where avarage_cost_price is null;

update  t_average_cost_price set avarage_purchase_price=0 where avarage_purchase_price is null;

truncate table t_average_cost_price_log;



