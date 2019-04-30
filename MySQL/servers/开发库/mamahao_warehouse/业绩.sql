SELECT
	* 
FROM
	u_order 
WHERE
	order_no = 'MPOS145200687623059';
	
	
SELECT
	* 
FROM
	t_order 
WHERE
	order_no = 'MPOS145200687623059';
	

SELECT
	*
FROM
	t_order o
	LEFT JOIN t_order_pay op ON o.order_no = op.order_no 
WHERE
	o.order_no = 'MPOS145210668664843' 
	
select * from t_order where order_no = 'MPOS145210668664843' ;
	
	
	
	
	2019-03-01 13 : 46 : 58.500 DEBUG [ mamahao - ebiz - ORDER, 738 fd48cc93d14bf, 738 fd48cc93d14bf, FALSE ] 17192 --- [ nio - 8019-e xec - 7 ] c.m.e.o.p.r.O.querySmallOrderDetailByApi : ==> Parameters : MPOS145210668664843 ( String ) 2019-03-01 13 : 46 : 58.505 DEBUG [ mamahao - ebiz - ORDER, 738 fd48cc93d14bf, 738 fd48cc93d14bf, FALSE ] 17192 --- [ nio - 8019-e xec - 7 ] c.m.e.o.p.r.O.querySmallOrderDetailByApi : <== Total : 0