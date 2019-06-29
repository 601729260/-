SELECT
	id AS 单据编号,
	ifnull(sub_unit_name,"唯小宝门店仓") as 门店ID,
	a.create_time AS '创建时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
	one_value AS 规格,
	case status when 2 then to_num when 3 then to_num then 0 AS 收货数量,
	cost_price AS 成本单价,
	purchase_price AS 采购单价,
	from_num AS '采购数量',
	purchase_price*from_num AS '按照采购数量计算的采购金额' ,
	purchase_price*（case status when 2 then to_num when 3 then to_num else 0） AS '按照收货数量计算的采购金额' ,
	case style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型'
	case status when 0 then '待审核' when 1 then '待收货' when 2 then '已收货' when 3 then '部分收货' when 4 '已取消' when 6 '待编辑'  
FROM
	u_stock_log_detail a left join gb_cort_sub_unit b  on a.to_sid=b.sub_unit_num_id
	left join gb_style  c on a.style_num_id=c.style_num_id
WHERE
	bill_type = 0 
	#AND a.STATUS = 8 
	AND a.create_time > '2019-10-30 00:00:00' 
		AND a.create_time < '2019-04-30 23:59:59' 
	and a.to_sid<>1800000088
ORDER BY
	id;
	
	
	0表示普通销售商品, 1,表示消耗类型, 2表示固定资产 
	
	select * from u_stock_log_detail where id='MMH2018111110003891';
	
	
	select * from gb_style limit 1;