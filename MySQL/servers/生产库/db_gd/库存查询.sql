#统计
set @stockcalc_sid := 1500000142;
set @stockcalc_barcode := '6970155253849';

set @stockcalc_itemId := (select ITEM_NUM_ID from gb_share_item where BARCODE_1 = @stockcalc_barcode);

# select ITEM_NUM_ID from gb_share_item where BARCODE_1 = 7613035023888

select 
channel "处理渠道",sid "门店ID",item_num_id "商品ID",@stockcalc_barcode as "条码",qty as "扣减情况", pqty as "公共仓库存",time 
from (

select id as channel,sid,item_num_id,qty_change as qty,p_qty_change as pqty,create_time as time from u_goods_stock_log a
where item_num_id in (select item_num_id from  gb_share_item where barcode_1=@stockcalc_barcode) and sid=@stockcalc_sid
and (p_qty_change=-qty_change or substr(id,3)='MMH') union all


# 线上app部分 - 正向订单，下单即减库存
select "线上app-正向订单，下单：减库存" as channel,IFNULL(tmp1.shop_id,tmp1.warehouse_id) as sid,tmp2.good_item_id as item_num_id,- tmp2.allocated_count as qty,0 as pqty,tmp1.created_time as time
from t_order tmp1 LEFT JOIN t_order_line tmp2 on tmp1.order_no = tmp2.order_no 
where 
tmp1.dealing_type not in (4,5)#非pos同步的
and 
(tmp1.shop_id in (
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or 
tmp1.warehouse_id = 1800000080
)
and tmp1.created_time >= '2018-10-30 00:00:00'

union ALL

# 线上app部分 - 正向订单，取消失效删除，即加库存
select "线上app-订单取消失效删除：加库存" as channel,IFNULL(tmp1.shop_id,tmp1.warehouse_id) as sid,tmp2.good_item_id as item_num_id,tmp2.allocated_count as qty,0 as pqty,tmp1.cancel_time as time
from t_order tmp1 LEFT JOIN t_order_line tmp2 on tmp1.order_no = tmp2.order_no 
where 
tmp1.order_state in (1,2,8)#取消失效删除
and
tmp1.dealing_type not in (4,5)#非pos同步的
and 
(tmp1.shop_id in (
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or 
tmp1.warehouse_id = 1800000080
)
and tmp1.created_time >= '2018-10-30 00:00:00'


UNION all

# 线上app部分 - 逆向部分，退款退货换货调用了库存未关闭即加库存
select "线上app-退款退货换货：逆向返还库存" as channel,IFNULL(tmp2.shop_id,tmp2.warehouse_id) as sid,tmp1.order_line_id as item_num_id,tmp1.refund_goods_count as qty,0 as pqty ,tmp1.apply_time as time
from t_refund_Line tmp1 LEFT JOIN t_order tmp2 on tmp1.order_no = tmp2.order_no 
where 
tmp1.`status` in (2,3,4,7,11,12)
AND tmp1.refund_type in (1,2,4)
and 
(tmp2.shop_id in (
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or 
tmp2.warehouse_id = 1800000080
)
and tmp2.created_time >= '2018-10-30 00:00:00'


union all


#普通订单，预售订单：下单即减库存(只要订单存在就一定扣减了)
select "mpos-普通/预售订单：下单即减库存" as channel,tmp1.s_id as sid,tmp2.item_id as item_num_id,- tmp2.item_count as qty,0 as pqty ,tmp1.create_time as time
from u_order tmp1 LEFT JOIN u_order_line tmp2 on tmp1.order_no = tmp2.order_no  
where 
tmp1.order_type in (1,4) # 普通订单，预售订单
and tmp2.item_type = 3 # 商品
and 
(
tmp1.s_id in ( # 指定门店
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or tmp1.s_id = 1800000080 # 指定仓库
)
#and tmp1.create_time > @stock_calc_time


union all

#普通订单，预售订单：取消增加库存
select "mpos-普通/预售订单：取消增加库存" as channel,tmp1.s_id as sid,tmp2.item_id  as item_num_id,+ tmp2.item_count as qty,0 as pqty ,tmp1.update_time as time
from u_order tmp1 LEFT JOIN u_order_line tmp2 on tmp1.order_no = tmp2.order_no 
 where 
tmp1.order_type in (1,4) # 普通订单，预售订单
and tmp1.order_state in (1,2) # 失效和取消
and tmp2.item_type = 3 # 商品
and 
(
tmp1.s_id in ( # 指定门店
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or tmp1.s_id = 1800000080 # 指定仓库
)

union all

#寄存订单：领取减库存,t_order
select "mpos-寄存订单：领取减库存" as channel,IFNULL(tmp3.shop_id ,tmp3.warehouse_id) as sid,tmp1.good_item_id as item_num_id,- tmp1.count as qty,0 as pqty ,tmp1.created_time as time
from u_order_deposit tmp1 
LEFT JOIN t_order_line tmp2 on tmp1.order_line_id = tmp2.order_line_id
LEFT JOIN t_order tmp3 on tmp2.order_no = tmp3.order_no
where 
(
tmp3.shop_id in ( # 指定门店
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or tmp3.warehouse_id = 1800000080 # 指定仓库
)


union all

# 逆向订单

# 退款，退货： 加库存
select "mpos-退款，退货： 加库存" as channel,tmp1.s_id as sid,tmp2.item_id as item_num_id,+ tmp2.item_count as qty,0 as pqty ,tmp1.create_time as time
from u_refund_basic tmp1 LEFT JOIN u_refund_goods  tmp2 on tmp1.refund_no = tmp2.refund_no
where tmp2.item_type = 3 # 商品
and tmp1.refund_status in (0) # 退款成功
and 
(
tmp1.s_id in ( # 指定门店
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or tmp1.s_id = 1800000080 # 指定仓库
)


union all


# 换货单：老商品加库存

select "mpos-换货单：老商品加库存" as channel,tmp1.s_id as sid,tmp2.item_id_old as item_num_id,+ tmp2.item_count as qty,0 as pqty ,tmp1.create_time as time
from u_exchange_basic tmp1 LEFT JOIN u_exchange_goods tmp2 on tmp1.exchange_no = tmp2.exchange_no
where tmp1.exchange_status in (2) # 换货成功
and 
(
tmp1.s_id in ( # 指定门店
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or tmp1.s_id = 1800000080 # 指定仓库
)

union all

# 换货单：新商品减库存
select "mpos-换货单：新商品减库存" as channel,tmp1.s_id as sid,tmp2.item_id_new as item_num_id,- tmp2.item_count as qty,0 as pqty ,tmp1.create_time as time
from u_exchange_basic tmp1 LEFT JOIN u_exchange_goods tmp2 on tmp1.exchange_no = tmp2.exchange_no
where tmp1.exchange_status in (2) # 换货成功
and 
(
tmp1.s_id in ( # 指定门店
select sub_unit_num_id from gb_cort_sub_unit where source_type = 2 and sub_unit_num_id not in (1,2147483646)
)
or tmp1.s_id = 1800000080 # 指定仓库
)

union all

# 冠楠 - 调货
select "调货" as channel,sid, item_num_id,qty_change as qty,0 as pqty ,create_time as time
from u_goods_stock_log where sid!=1800000080 and left(id,3)='MMH' 

union all

# 冠楠 - 调货 - 仓库
select "调货 - 仓库" as channel,sid, item_num_id,sum(qty_change) as qty, sum(p_qty_change) as pqty   ,create_time as time
from u_goods_stock_log where sid=1800000080 group by item_num_id 



) as ttt1
where ttt1.item_num_id = @stockcalc_itemId
and ttt1.sid = @stockcalc_sid
order by time asc
#group by sid,item_num_id

#HAVING qty <>0 or pqty <> 0


select 







