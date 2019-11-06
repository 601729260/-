select a.sid as 总部ID,a.item_num_id  as  商品sku ,a.avarage_purchase_price as 平均采购价,b.result as 正确结果 from  mamahao_warehouse.t_average_cost_price a left join (
select sid,item_num_id ,sum(purchase_price*(qty_change+p_qty_change)) as price,sum(qty_change+p_qty_change) as num,cast(sum(purchase_price*(qty_change+p_qty_change))/sum(qty_change+p_qty_change) as decimal(12,2)) as result 
from mamahao_warehouse.u_goods_stock_log 
where bill_type in (0,6)
and sid in (1,1800000080)
group by sid,item_num_id ) b on a.item_num_id=b.item_num_id and a.sid=b.sid
where  a.sid in (1,1800000080)
and a.avarage_purchase_price!=b.result;