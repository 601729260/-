SELECT
	a.id AS 单据编号,
	b.from_sid_name as 退货门店,
	b.to_sid_name as 收货门店,
	a.create_time AS '创建时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
	one_value AS 规格,
	cost_price AS 成本单价,
	from_num AS '退货数量',
	cost_price*from_num AS '成本总价' ,
	case style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型',
	case a.status when 0 then '待审核' when 1 then '待收货' when 2 then '已收货' when 4  then '已取消' when 6 then '待编辑'  when 7 then  '已拒绝'  end as 状态
FROM
	u_stock_log_detail a left join u_stock_log b on a.id=b.id
	left join gb_style  c on a.style_num_id=c.style_num_id
WHERE
	a.bill_type = 3 
	AND a.STATUS not in (16) 
	AND a.create_time > '2018-11-00 00:00:00' 
		AND a.create_time < '2018-12-31 23:59:59' 
	and a.to_sid<>1800000088
ORDER BY
	a.id;
	
	
	select status,count(1)  from u_stock_log where bill_type=3 group by status;