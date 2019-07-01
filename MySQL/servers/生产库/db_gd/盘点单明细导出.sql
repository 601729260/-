SELECT
	id AS 单据编号,
	ifnull(sub_unit_name,"唯小宝门店仓") as 门店ID,
	a.create_time AS '盘点时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
	one_value AS 规格,
	total_qty AS 日结库存,
	check_num AS 盘点数量,
	cost_price AS 成本价,
	total_different_num AS 盈亏数量,
	total_different_cost_price AS '盈亏金额(成本价)',
	total_different_price AS '盈亏金额(零售价)' ,
	case style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型'
FROM
	u_stock_log_detail a left join gb_cort_sub_unit b  on a.to_sid=b.sub_unit_num_id
	left join gb_style  c on a.style_num_id=c.style_num_id
WHERE
	bill_type = 5 
	AND a.STATUS = 8 
	AND a.create_time > '2019-03-01 00:00:00' 
		AND a.create_time < '2019-03-31 23:59:59' 
	and a.to_sid<>1800000088
ORDER BY
	id;
	
	
	0表示普通销售商品, 1,表示消耗类型, 2表示固定资产 
	
	select * from u_stock_log_detail where id='MMH2018111110003891';
	
	
	select * from gb_style limit 1;
	
	
	
	SELECT
	id AS 单据编号,
	ifnull(sub_unit_name,"妈妈好自营仓") as 门店ID,
	a.create_time AS '盘点时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
	one_value AS 规格,
	total_qty AS 日结库存,
	check_num AS 盘点数量,
	cost_price AS 成本价,
	total_different_num AS 盈亏数量,
	total_different_cost_price AS '盈亏金额(成本价)',
	total_different_price AS '盈亏金额(零售价)' ,
	case style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型'
FROM
	u_stock_log_detail a left join gb_cort_sub_unit b  on a.to_sid=b.sub_unit_num_id
	left join gb_style  c on a.style_num_id=c.style_num_id
WHERE
a.id in ('MMH2019062810070342',
'MMH2019062810070337',
'MMH2019062810070331',
'MMH2019062810070169')
ORDER BY
	id;
	
	
		SELECT
	id AS 单据编号,
	ifnull(sub_unit_name,"妈妈好自营仓") as 门店ID,
	a.create_time AS '盘点时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
	one_value AS 规格,
	total_qty AS 日结库存,
	check_num AS 盘点数量,
	cost_price AS 成本价,
	total_different_num AS 盈亏数量,
	total_different_cost_price AS '盈亏金额(成本价)',
	total_different_price AS '盈亏金额(零售价)' ,
	case style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型'
FROM
	u_stock_log_detail a left join gb_cort_sub_unit b  on a.to_sid=b.sub_unit_num_id
	left join gb_style  c on a.style_num_id=c.style_num_id
WHERE
a.id in ('MMH2019062810070340',
'MMH2019062910070370',
'MMH2019062910070371',
'MMH2019062910070372',
'MMH2019062910070442',
'MMH2019062910070535')
ORDER BY
	id;
	
	
	


