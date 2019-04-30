select * from t_crm_consume_analyse where member_id in (1994103);

t_order
 `order_state` int(32) DEFAULT '3' COMMENT '订单状态 0：已完成 1：已失效 2：已取消 3：待付款 4：待发货 5：待收货 6：待评价 7：初始状态',


# 数据字典
u_order 
  `order_state` tinyint(4) DEFAULT NULL COMMENT '0-已完成;1-已失效(未使用);2-已取消;3-待付款;4-待发货;5-待收货;6-结算单被挂起;7-待评价',
u_order_line
item_type 1服务 2卡项 3商品





SELECT  memberId,oftenConsumeSidId,oftenConsumeSid ,count(order_no) as countOrderNo,max(create_time)
FROM (
	select  member_id as memberId , shop_id as  oftenConsumeSidId, shop_name as oftenConsumeSid , order_no  ,created_time create_time from t_order torder where member_id in (1619258,1994101,1994102,1994072,1994103)
	 and order_state in(0,4,5,6) and torder.warehouse_type in (0,4) and shop_name not like '%测试%' 
	union ALL
		select  member_id as memberId , warehouse_id as  oftenConsumeSidId, warehouse_name as oftenConsumeSid , order_no  ,created_time create_time from t_order torder where member_id in (1619258,1994101,1994102,1994072,1994103)
	 and  order_state in (0,4,5,6) and torder.warehouse_type in (2) and warehouse_name not like '%测试%' 
 union all
	select a.mmh_member_id as memberId,a.s_id as oftenConsumeSidId , a.s_name as oftenConsumeSid ,a.order_no ,a.create_time create_time 
 from u_order a left join  u_order_line b on a.order_no=b.order_no 
 where a.mmh_member_id in (1994103) 
 and b.item_type=3
	 and s_type=2  and order_state in (0,4,5,7)  and s_name not like '%测试%' 
	)tmp3  group by memberId,oftenConsumeSidId,oftenConsumeSid 
	order by memberId,countOrderNo desc  ,create_time desc
	
	
	
	
	#------------------线上------------------
		select a.mmh_member_id as memberId,a.s_id as oftenConsumeSidId , a.s_name as oftenConsumeSid ,a.order_no ,a.create_time create_time 
 from u_order a left join  u_order_line b on a.order_no=b.order_no 
 where a.mmh_member_id in (1994103) 
 and b.item_type=3
	 and s_type=2  and order_state in(0,7)  and s_name not like '%测试%' 
	 
	 
	 select * from u_order_line where order_no  in (
	 select order_no from u_order a where a.mmh_member_id in (1994103) and order_state=0  );
	 
	 select * from u_order a where a.mmh_member_id in (1994103)
	 
	 