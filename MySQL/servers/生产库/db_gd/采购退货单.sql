	
	#--------采购退货导出
	
	SELECT
	a.id AS 单据编号,
	ifnull(sub_unit_name,"妈妈好自营") as 门店,
	a.create_time AS '创建时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
  d.provider_name as 供应商名称,
	a.one_value AS 规格,
	a.purchase_price AS 单价,
	from_num AS '退货数量',
	a.purchase_price*from_num AS '按照退货数量计算的退货金额' ,
	case c.style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型',
	case a.status when 13 then '已出库' end as 状态
FROM
	u_stock_log_detail a left join gb_cort_sub_unit b  on a.from_sid=b.sub_unit_num_id
	left join gb_style  c on a.style_num_id=c.style_num_id
left join u_stock_log d on a.id=d.id
inner join u_goods_stock_log e on a.id=e.id and e.item_num_id=a.item_num_id
WHERE
	a.bill_type = 6 
	AND a.STATUS  in(13)  
	AND e.create_time > '2019-08-01 00:00:00' 
		AND e.create_time < '2019-08-31 23:59:59' 
	and a.to_sid<>1800000088
ORDER BY
	a.id;


