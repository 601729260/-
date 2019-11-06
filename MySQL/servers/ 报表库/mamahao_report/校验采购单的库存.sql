select * from 
(select * from mamahao_warehouse.u_stock_log_detail where bill_type in(0,3) and create_time>'2019-01-01 00:00:00') a left join 
(select id,item_num_id,sum(p_qty_change) as qty  from mamahao_warehouse.u_goods_stock_log where bill_type in(0,3) and create_time>'2019-01-01 00:00:00' group by id,item_num_id) b 
on a.id=b.id and a.item_num_id=b.item_num_id
where a.to_num!=b.qty


select * from weibao_offline_order  where 批次号='MPOS154010141266129';


select * from weibao_online_order  limit 100;