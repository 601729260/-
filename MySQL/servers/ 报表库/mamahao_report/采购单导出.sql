

SELECT
	a.id AS 单据编号,
	ifnull(sub_unit_name,"唯小宝门店仓") as 门店ID,
	a.create_time AS '创建时间',
	barcode AS '条形码',
	a.style_title AS 商品名称,
	a.style_code AS 款式编码,
  d.provider_name as 供应商名称,
	a.one_value AS 规格,
	case a.status when 2 then to_num when 3 then to_num else 0 end AS 收货数量,
	a.purchase_price AS 采购单价,
	from_num AS '采购数量',
	a.purchase_price*from_num AS '按照采购数量计算的采购金额' ,
  a.multiple_receipt_time as 收货时间,
	a.purchase_price*(case a.status when 2 then to_num when 3 then to_num else 0 END) AS '按照收货数量计算的采购金额' ,
	case c.style_type when 0 then'销售商品'  when 1 then '消耗品' when 2 then '固定资产' end as '商品类型',
	case a.status when 0 then '待审核' when 1 then '待收货' when 2 then '已收货' when 3 then '部分收货' when 4 then '已取消' when 6 then '待编辑'  end as 状态,
	e.p_qty_change as 本月库存变化
FROM
	mamahao_warehouse.u_stock_log_detail a left join mamahao_warehouse.gb_cort_sub_unit b  on a.to_sid=b.sub_unit_num_id
	left join mamahao_warehouse.gb_style  c on a.style_num_id=c.style_num_id
left join mamahao_warehouse.u_stock_log d on a.id=d.id
inner join (select id,item_num_id,sum(p_qty_change) as p_qty_change from mamahao_warehouse.u_goods_stock_log where create_time >'2019-09-01 00:00:00' and create_time <'2019-09-30 23:59:59'  group by id,item_num_id ) e on a.id=e.id and e.item_num_id=a.item_num_id
WHERE
	a.bill_type = 0 
	AND a.STATUS  in(2,3)  
	and a.to_sid<>1800000088
ORDER BY
	a.id;
	
