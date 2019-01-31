select a.item_num_id,a.avarage_cost_price ,b.cost_price/100 from t_average_cost_price a  inner join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.sid=1
and a.avarage_cost_price/(b.cost_price/100)>1.1;

select  a.item_num_id,a.avarage_purchase_price ,b.purchase_price/100 from t_average_cost_price a  inner join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.sid=1
and a.avarage_purchase_price/(b.purchase_price/100)>1.1;


select a.item_num_id,a.avarage_cost_price ,b.cost_price/100 from t_average_cost_price a  inner join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.sid=1
and a.avarage_cost_price/(b.cost_price/100)<0.9;

select  a.item_num_id,a.avarage_purchase_price ,b.purchase_price/100 from t_average_cost_price a  inner join gb_share_item_ext b on a.item_num_id=b.item_num_id
where a.sid=1
and a.avarage_purchase_price/(b.purchase_price/100)<0.9;


select * from wgn_init_average_price_result where item_num_id=114872;

select * from gb_share_item where item_num_id=114872;

select * from t_average_cost_price_log limit 1;


select * from t_average_cost_price a where item_num_id=432201 and sid=1;

select * from t_average_cost_price_log a where item_num_id=432201 and sid=1 and a.pre_avarage_purchase_price is not null;

select * from t_average_cost_price_log where id='MMH2018110410001765' and item_num_id=432201;

select * from t_average_cost_price_log where sid=1800000080 and item_num_id=432201;

select * from gb_share_item_ext where item_num_id=432201;


select * from u_goods_stock_log where id='MMH2018111210004016' and item_num_id=432201;

select * from u_goods_stock_log order by seq_id  limit 100;

select * from u_goods_stock_log where item_num_id=1000002709;

select * from t_average_cost_price_log where sid=1800000080 and item_num_id=1000002709;
select * from t_average_cost_price_log where sid=1 and item_num_id=1000002709;

select * from t_average_cost_price where sid=1 and item_num_id=1000002709;

select * from t_average_cost_price where sid=1800000080 and item_num_id=1000002709;

select * from t_gb_stock where storage_id=1800000080 and item_num_id=1000002709;





#---------------------- 针对一个商品进行测试---------------------------------
delete  from t_average_cost_price_log where item_num_id=432201;

delete from t_average_cost_price where item_num_id=432201;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,avarage_cost_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,2 from wgn_init_average_price_result b where b.sid!=1800000080 and b.item_num_id=432201;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,avarage_purchase_price,sid_type)
select sid,item_num_id,total_cost_price,qty,average_cost_price,3 from wgn_init_average_price_result b where b.sid=1800000080 and b.item_num_id=432201;


insert into t_average_cost_price (sid,item_num_id,total_cost_price,total_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b where b.sid!=1800000080 and b.item_num_id=432201 group by item_num_id;

update t_average_cost_price a 
inner join 
(select 1 as sid,item_num_id,sum(total_cost_price) as total_purchase_price,sum(qty) as total_purchase_num from wgn_init_average_price_result b where b.item_num_id=432201 and b.sid=1800000080 group by item_num_id) b
on a.item_num_id=b.item_num_id and a.sid=b.sid 
set a.total_purchase_price=b.total_purchase_price ,a.total_purchase_num=b.total_purchase_num 
where a.sid=1;

insert into t_average_cost_price(sid,item_num_id,total_purchase_price,total_purchase_num,sid_type)
select 1,item_num_id,sum(total_cost_price),sum(qty),1 from wgn_init_average_price_result b
where b.sid=1800000080  and b.item_num_id=432201 and not exists(select 1 from t_average_cost_price  a where a.sid=1 and a.item_num_id=b.item_num_id) group by item_num_id;

update t_average_cost_price a  set avarage_cost_price=total_cost_price/total_num where total_num!=0 and sid=1 and item_num_id=432201;
update t_average_cost_price a set avarage_purchase_price=total_purchase_price/total_purchase_num where total_purchase_num!=0 and sid=1 and item_num_id=432201;

update  t_average_cost_price set avarage_cost_price=0 where avarage_cost_price is null and item_num_id=432201;

update  t_average_cost_price set avarage_purchase_price=0 where avarage_purchase_price is null and item_num_id=432201;






