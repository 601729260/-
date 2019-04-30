select * from 
(
	SELECT tmp3.*, Row_Number() OVER (partition by tmp3.memberId ORDER BY tmp3.countOrderno desc) rank 
FROM (

	select  member_id as memberId , shop_id as  oftenConsumeSidId, shop_name as oftenConsumeSid , count(order_no) as countOrderNo,max(created_time) create_time from t_order torder where member_id in (1619258)
	 and order_state=0 and torder.warehouse_type in (0,4) and shop_name not like '%测试%' GROUP BY member_id , shop_id , shop_name 
	union ALL
	select mmh_member_id as memberId,s_id as oftenConsumeSidId , s_name as oftenConsumeSid , count(order_no) as  countOrderNo ,max(create_time) create_time from u_order  where mmh_member_id in (1619258)
	 and s_type=2  and order_state=0  and s_name not like '%测试%' GROUP BY  mmh_member_id ,s_id ,s_name 
	
	
	)tmp3

)tmp
where tmp.rank=1


select * from t_order limit 1;



select * from 
(
	SELECT tmp3.*, Row_Number() OVER (partition by tmp3.memberId ORDER BY tmp3.countOrderno,create_time desc) rank 
FROM (
		select * from
	(
	select  member_id as memberId , shop_id as  oftenConsumeSidId, shop_name as oftenConsumeSid , count(order_no) as countOrderNo,max(created_time) create_time  from t_order torder where member_id in (1994087,1994020)
	 and order_state=0 and torder.warehouse_type in (0,4) and shop_name not like '%测试%' GROUP BY member_id , shop_id , shop_name 
	) tmp1
	union ALL
	select * from
	(
	select mmh_member_id as memberId,s_id as oftenConsumeSidId , s_name as oftenConsumeSid , count(order_no) as  countOrderNo,max(create_time) create_time from u_order  where mmh_member_id in (1994087,1994020)
	 and s_type=2  and order_state=0  and s_name not like '%测试%' GROUP BY  mmh_member_id ,s_id ,s_name 
	) tmp2
	
	)tmp3

)tmp
where tmp.rank=1


