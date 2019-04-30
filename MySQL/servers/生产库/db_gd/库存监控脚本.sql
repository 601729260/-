#检查门店是否有异常库存

select a.shop_id,a.item_num_id,a.qty,ifnull(c.qty_change,0),ifnull(b.qty,0) bak_qty ,a.qty-ifnull(b.qty,0)-ifnull(c.qty_change,0) from t_gb_stock a left join t_gb_stock_20190129 b on a.shop_id=b.shop_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log c where c.create_time>='2019-01-30 00:00:00'  and sid_type=2  group by sid,item_num_id) c
on a.shop_id=c.sid and a.item_num_id=c.item_num_id
where a.shop_id > 150000000 
and  a.qty!=ifnull(b.qty,0)+ifnull(c.qty_change,0) union all 
#检查仓库是否有异常库存
select a.storage_id,a.item_num_id,(a.qty+a.p_qty) as total_qty,ifnull(c.total_qty_change,0),ifnull(b.qty+b.p_qty,0) bak_qty,a.qty+a.p_qty-ifnull(b.qty+b.p_qty,0)-ifnull(c.total_qty_change,0) from t_gb_stock a left join t_gb_stock_20190129 b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change+p_qty_change) as total_qty_change from u_goods_stock_log c where c.create_time>='2019-01-30 00:00:00'  and sid_type=3  and bill_type!=3  or (bill_type=3 and operate_type=5) group by sid,item_num_id) c
on a.storage_id=c.sid and a.item_num_id=c.item_num_id
where a.storage_id in(1800000080)
and  a.qty+a.p_qty!=ifnull(b.qty+b.p_qty,0)+ifnull(c.total_qty_change,0) ;



#检查门店线下订单是否有异常数据
select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_id,bb.item_count  from 
(select id,sid,item_num_id, sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-01-30 00:00:00'  
and sid_type=2  
and bill_type in ('200005',
'200001',
'200003',
'200002',
'200006')
group by id,sid,item_num_id) aa
right join 
(select c.order_no,c.item_id,sum(c.item_count) item_count from 
(select d.order_no,item_id,(case when e.order_state=1 then 0 when e.order_state=2 then 0 else -item_count end) as item_count from u_order_line d inner join u_order e on d.order_no=e.order_no where d.create_time>='2019-01-30 00:00:00' and e.order_type not in(5,4) and d.item_type=3 union all 
select ba.refund_no as order_no, rg.item_id ,rg.item_count  as item_count from u_refund_basic  ba inner join u_refund_goods rg on ba.refund_no=rg.refund_no inner join  u_order e on ba.order_no=e.order_no
where ba.pay_time>='2019-01-30 00:00:00' and e.order_type not in (4,5) and ba.refund_status=0 and rg.item_type=3) c
group by order_no,item_id) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_id
where ifnull(aa.qty_change,0)!=bb.item_count union all

#检查仓库线下订单是否有异常数据
select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_id,bb.item_count  from 
(select id,sid,item_num_id, sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-01-30 00:00:00'  
and sid_type=2  
and bill_type in ('200005',
'200001',
'200003',
'200002',
'200006')
group by id,sid,item_num_id) aa
right join 
(select c.order_no,c.item_id,sum(c.item_count) item_count from 
(select d.order_no,item_id,(case when e.order_state=1 then 0 when e.order_state=2 then 0 else -item_count end) as item_count from u_order_line d inner join u_order e on d.order_no=e.order_no where d.create_time>='2019-01-30 00:00:00' and e.order_type not in(5,4) and d.item_type=3 union all 
select ba.refund_no as order_no, rg.item_id ,rg.item_count  as item_count from u_refund_basic  ba inner join u_refund_goods rg on ba.refund_no=rg.refund_no inner join  u_order e on ba.order_no=e.order_no
where ba.pay_time>='2019-01-30 00:00:00' and e.order_type not in (4,5) and ba.refund_status=0 and rg.item_type=3) c
group by order_no,item_id) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_id
where ifnull(aa.qty_change,0)!=bb.item_count union all 




#寄存单

select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_id,bb.item_count  from 
(select id,sid,item_num_id, sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-01-30 00:00:00'  
and sid_type=2  
and bill_type in ('200005',
'200001',
'200003',
'200002',
'200006')
and operate_type=3
group by id,sid,item_num_id) aa
right join 
(select order_no ,good_item_id as item_id ,sum(-count) as item_count from u_order_deposit b where b.created_time>='2019-01-30 00:00:00' group by  order_no ,good_item_id) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_id
where ifnull(aa.qty_change,0)!=bb.item_count 
union all 
#检查线上订单是否有异常
select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_num_id as item_id,bb.qty_change as item_count  from 
(
select id,sid,item_num_id,sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-01-30 00:00:00'  
and bill_type in (
'100001',
'100002',
'100003',
'100004',
'100005'
) 
group by id,sid,item_num_id) aa
right join 
(
select order_no,item_num_id,sum(qty_change) as qty_change from 
(select a.order_no,a.good_item_id as item_num_id,case b.order_state when 1 then 0 when 2 then 0 when 8 then 0 else -a.allocated_count  end as qty_change from t_order_line a inner join t_order b on a.order_no=b.order_no where b.created_time>'2019-01-30 00:00:00' and b.order_source=3 and b.dealing_type not in(5,4) 
union all
select  a.refund_line_no as order_no, order_line_id as item_num_id ,refund_goods_count as qty_change from t_refund_line a inner join t_order b on a.order_no=b.order_no  where  (a.status in (3,4,9) or a.exchange_status in (6,7,8)) and  b.order_source=3 and b.dealing_type not in(5,4) and a.apply_time>'2019-01-30 00:00:00' 
union all
select a.rd_refund_no as order_no ,rd_item_id as item_num_id, rd_real_qty  as qty_change from  t_refund_detail a inner join t_refund_line b on a.rd_refund_no=b.refund_line_no inner join t_order c on b.order_no=c.order_no  where (b.status in (3,4,9) or b.exchange_status in (6,7,8)) and  c.order_source=3 and c.dealing_type not in(5,4)  and a.rd_create_time>'2019-01-30 00:00:00') xx
group by order_no,item_num_id
) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_num_id
where ifnull(aa.qty_change,0)!=bb.qty_change;


select * from t_member_mbean order by desc



select * from  u_stock_log_detail where id='MMH2019021510031372' and item_num_id=1100001704;
select * from  u_goods_stock_log where id='MMH2019021510031372'  and item_num_id=1100001704;

