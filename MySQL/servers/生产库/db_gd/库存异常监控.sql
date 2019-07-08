select a.shop_id,a.item_num_id,a.qty,ifnull(c.qty_change,0),ifnull(b.qty,0) bak_qty ,a.qty-ifnull(b.qty,0)-ifnull(c.qty_change,0) from t_gb_stock a left join t_gb_stock_20190609 b on a.shop_id=b.shop_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log c where c.create_time>='2019-06-10 00:00:00'  and sid_type=2  group by sid,item_num_id) c
on a.shop_id=c.sid and a.item_num_id=c.item_num_id
where a.shop_id > 150000000  and a.shop_id!=1500000150
and  a.qty!=ifnull(b.qty,0)+ifnull(c.qty_change,0) union all 




#检查仓库是否有异常库存
select a.storage_id,a.item_num_id,(a.qty+a.p_qty) as total_qty,ifnull(c.total_qty_change,0),ifnull(b.qty+b.p_qty,0) bak_qty,a.qty+a.p_qty-ifnull(b.qty+b.p_qty,0)-ifnull(c.total_qty_change,0) from t_gb_stock a left join t_gb_stock_20190609 b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change+p_qty_change) as total_qty_change from u_goods_stock_log c where c.create_time>='2019-06-10 00:00:00'  and sid_type=3  and (bill_type!=3  or (bill_type=3 and operate_type=5)) group by sid,item_num_id) c
on a.storage_id=c.sid and a.item_num_id=c.item_num_id
where a.storage_id in(1800000080)
and  a.qty+a.p_qty!=ifnull(b.qty+b.p_qty,0)+ifnull(c.total_qty_change,0) ;


# 库存分开比对
select a.storage_id,a.item_num_id,a.qty,a.p_qty,ifnull(c.qty_change,0),ifnull(c.p_qty_change,0),ifnull(b.qty,0) bak_qty,ifnull(b.p_qty,0) bak_p_qty,a.qty-ifnull(b.qty,0)-c.qty_change,a.p_qty-ifnull(b.p_qty,0)-c.p_qty_change from t_gb_stock a left join t_gb_stock_20190609 b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change) as qty_change,sum(p_qty_change) as p_qty_change from u_goods_stock_log c where c.create_time>='2019-06-10 00:00:00'  and sid_type=3  and (bill_type!=3  or (bill_type=3 and operate_type=5)) group by sid,item_num_id) c
on a.storage_id=c.sid and a.item_num_id=c.item_num_id
where a.storage_id in(1800000080)
and ( a.qty-ifnull(b.qty,0)-c.qty_change!=0 or a.p_qty-ifnull(b.p_qty,0)-c.p_qty_change!=0 ) ;



#查询
select concat("{\"sid\":1800000080,\"sidType\":3,\"pdQtyChange\":0,\"dealRedis\":true,\"itemNumId\":",a.item_num_id,",\"qtyChange\":",-(a.qty-ifnull(b.qty,0)-c.qty_change),"}") from t_gb_stock a left join t_gb_stock_20190609 b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change) as qty_change,sum(p_qty_change) as p_qty_change from u_goods_stock_log c where c.create_time>='2019-06-10 00:00:00'  and sid_type=3  and (bill_type!=3  or (bill_type=3 and operate_type=5)) group by sid,item_num_id) c
on a.storage_id=c.sid and a.item_num_id=c.item_num_id
where a.storage_id in(1800000080)
and ( a.qty-ifnull(b.qty,0)-c.qty_change!=0 or a.p_qty-ifnull(b.p_qty,0)-c.p_qty_change!=0 ) ;




#检查门店线下订单是否有异常数据
select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_id,bb.item_count  from 
(select id,sid,item_num_id, sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-05-01 00:00:00'  
and sid_type=2 
and bill_type in ('200005',
'200001',
'200003',
'200002',
'200006')
group by id,sid,item_num_id) aa
right join 
(select c.order_no,c.item_id,sum(c.item_count) item_count from 
(select d.order_no,item_id,(case when e.order_state=1 then 0 when e.order_state=2 then 0 else -item_count end) as item_count from u_order_line d inner join u_order e on d.order_no=e.order_no where d.create_time>='2019-05-01 00:00:00' and e.order_type not in(5,4) and d.item_type=3  and e.s_id!=1500000150 union all 
select ba.refund_no as order_no, rg.item_id ,rg.item_count  as item_count from u_refund_basic  ba inner join u_refund_goods rg on ba.refund_no=rg.refund_no inner join  u_order e on ba.order_no=e.order_no
where ba.pay_time>='2019-05-01 00:00:00' and e.order_type not in (4,5) and ba.refund_status=0  AND ba.refund_item_type=3 and e.s_id!=1500000150 ) c
group by order_no,item_id) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_id
where ifnull(aa.qty_change,0)!=bb.item_count union all

#检查仓库线下订单是否有异常数据
select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_id,bb.item_count  from 
(select id,sid,item_num_id, sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-05-01 00:00:00'  
and sid_type=2  
and bill_type in ('200005',
'200001',
'200003',
'200002',
'200006')
group by id,sid,item_num_id) aa
right join 
(select c.order_no,c.item_id,sum(c.item_count) item_count from 
(select d.order_no,item_id,(case when e.order_state=1 then 0 when e.order_state=2 then 0 else -item_count end) as item_count from u_order_line d inner join u_order e on d.order_no=e.order_no where d.create_time>='2019-05-01 00:00:00' and e.order_type not in(5,4) and d.item_type=3 and e.s_id!=1500000150  union all 
select ba.refund_no as order_no, rg.item_id ,rg.item_count  as item_count from u_refund_basic  ba inner join u_refund_goods rg on ba.refund_no=rg.refund_no inner join  u_order e on ba.order_no=e.order_no
where ba.pay_time>='2019-05-01 00:00:00' and e.order_type not in (4,5) and ba.refund_status=0 AND ba.refund_item_type=3 and e.s_id!=1500000150 ) c
group by order_no,item_id) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_id
where ifnull(aa.qty_change,0)!=bb.item_count union all




#寄存单

select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_id,bb.item_count  from 
(select id,sid,item_num_id, sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-05-01 00:00:00'  
and sid_type=2 
and sid!=1800000088
and bill_type in ('200005',
'200001',
'200003',
'200002',
'200006')
and operate_type in (3)
group by id,sid,item_num_id) aa
right join 
(select order_no ,good_item_id as item_id ,sum(-count) as item_count from u_order_deposit b where b.created_time>='2019-05-01 00:00:00' group by  order_no ,good_item_id) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_id
where ifnull(aa.qty_change,0)!=bb.item_count union all

#检查线上订单是否有异常

select  aa.id,bb.order_no,aa.sid,aa.item_num_id, aa.qty_change,bb.item_num_id,bb.qty_change  from 
(
select id,sid,item_num_id,sum(c.qty_change) as qty_change  from u_goods_stock_log c
where c.create_time>='2019-05-01 00:00:00'  
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
(select a.order_no,a.good_item_id as item_num_id,case b.order_state when 1 then 0 when 2 then 0 when 8 then 0 else -a.allocated_count  end as qty_change from t_order_line a inner join t_order b on a.order_no=b.order_no where b.created_time>'2019-05-01 00:00:00' and b.order_source=3 and b.dealing_type not in(5,4)  and a.item_type=3
union all
select  a.refund_line_no as order_no, order_line_id as item_num_id ,refund_goods_count as qty_change from t_refund_line a inner join t_order b on a.order_no=b.order_no  where  (a.status in (3,4,9) or a.exchange_status in (6,7,8)) and  b.order_source=3 and b.dealing_type not in(5,4) and a.apply_time>'2019-05-01 00:00:00' 
union all
select a.rd_refund_no as order_no ,rd_item_id as item_num_id, rd_qty  as qty_change from  t_refund_detail a inner join t_refund_line b on a.rd_refund_no=b.refund_line_no inner join t_order c on b.order_no=c.order_no  where (b.status in (3,4,9) or b.exchange_status in (6,7,8)) and  c.order_source=3 and c.dealing_type not in(5,4)  and a.rd_create_time>'2019-05-01 00:00:00') xx
group by order_no,item_num_id
) bb
on aa.id=bb.order_no and aa.item_num_id=bb.item_num_id
where ifnull(aa.qty_change,0)!=bb.qty_change;








select * from t_order where order_no='145290137178074'



select * from t_refund_line where refund_line_no='TH145290323929483'

select * from t_refund_line where refund_line_no='TH145290370765537'


select * from u_goods_stock_log where id='146110146549433';

select * from  u_goods_stock_log where sid=1800000080 and item_num_id=174826;

delete from  u_goods_stock_log where seq_id=716919

swkw===
select * from t_order_line limit 100;

select * from t_refund_line limit 100;


select * from t_refund_detail limit 100;




#门店调拨相关单据检查

select * from u_goods_stock_log a where a.bill_t






#=====================================================
select * from u_order_line where order_no='MPOS145290604757904' and item_id=1000000432;

select * from u_order where order_no='MPOS145290629352798';


select * from u_goods_stock_log where id='MPOS145150696204406' and item_num_id=1100004329;

 select * from u_order_deposit where order_no='MPOS145150696204406' and good_item_id=1000003076;

select ba.order_no, rg.item_id ,rg.item_count  as item_count from u_refund_basic  ba inner join u_refund_goods rg on ba.refund_no=rg.refund_no
where ba.order_no='MPOS145280602916621' and item_id=1000000230
select * from u_refund_basic ba where ba.order_no='MPOS145280602916621' 

select * from u_refund_basic ba where ba.refund_no='TH145290307366167' ;


select ba.order_no, ba.refund_no,rg.item_id ,rg.item_count  as item_count from u_refund_basic  ba inner join u_refund_goods rg on ba.refund_no=rg.refund_no
where ba.refund_no='TH145290307366167';


select * from  u_refund_basic limit 1;



MPOS145290606990498	MPOS145290606990498	1500000136	1000002223	0	1000002223	-1




select id,sid,item_num_id, sum(c.qty_change+c.p_qty_change) as total_qty_change from u_goods_stock_log c where c.create_time>='2019-01-29 00:00:00'  and sid_type=3  group by id,sid,item_num_id






select count(a.item_num_id) from t_gb_stock a left join t_gb_stock_20190128 b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
left join  (select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log c where c.create_time>='2019-01-29 00:00:00'  and sid_type=2  group by sid,item_num_id) c
on a.storage_id=c.sid and a.item_num_id=c.item_num_id
where a.storage_id > 1800000000;


select  a.shop_id,a.item_num_id,a.qty,c.qty_change,b.qty from  (select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log c where c.create_time>='2019-01-29 00:00:00'  and sid_type=3  group by sid,item_num_id) c
left join t_gb_stock_20190128 a on a.storage_id=c.sid and a.item_num_id=c.item_num_id
left join t_gb_stock b on a.storage_id=b.storage_id  and a.item_num_id=b.item_num_id
where  a.qty+c.qty_change!=b.qty ;


(select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log c where c.create_time>='2019-01-29 00:00:00'  and sid_type=2  group by sid,item_num_id);


select count(1) from t_gb_stock_20190128;

select * from u_goods_stock_log;

select * from u_goods_stock_log limit 1;

select * from u_goods_stock_log c where sid=1500000102 and item_num_id=172120 and c.create_time>='2019-01-29 00:00:00' ;


select * from 


select * from u_goods_stock_log where id=146100106854901;

select * from t_order where order_no=146030125011716;
select * from t_order_line where order_no=146030125011716;

146030125011716  146030125011716
146100106854901  146100106854901
146110106809386  146110106809386
146110106855246  146110106855246
146110108295445  146110108295445
146110146549433  146110146549433
146120106817528  146120106817528
146120106826590  146120106826590
146120106854538  146120106854538
146120117122792  146120117122792




select * from u_goods_stock_log where sid=1500000147 and item_num_id=1000001383;

select * from t_gb_stock where shop_id=1500000147 and item_num_id=1000001383;

select * from t_gb_stock where storage_id=1800000080 and item_num_id=293848;
select * from u_goods_stock_log where sid=1800000080 and item_num_id=293848;


1500000147  1000001383
1800000080  293848


select * from u_goods_stock_log 






