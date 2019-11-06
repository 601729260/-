# 条形码、商品名称、品类、数量、成本价、领用门店、领用时间

SELECT
	a.id AS 单据编号,
	ifnull(sub_unit_name,"妈妈好自营") as 门店,
	a.create_time AS '创建时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
	a.one_value AS 规格,
	a.cost_price as 成本价,
	from_num AS '数量',
	case c.style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型'
FROM
	mamahao_warehouse.u_stock_log_detail a left join mamahao_warehouse.gb_cort_sub_unit b  on a.from_sid=b.sub_unit_num_id
	left join mamahao_warehouse.gb_style  c on a.style_num_id=c.style_num_id
WHERE
	a.bill_type = 4 
	#AND a.STATUS  in(13)  
	and a.from_sid not in( 1800000088,1500000150)
	and a.create_time >'2019-09-01 00:00:00' 
	and a.create_time <'2019-09-30 23:59:59'
ORDER BY
	a.id ;
	
