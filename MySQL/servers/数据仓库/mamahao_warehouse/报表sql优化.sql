DROP TABLE t_wxbdd_tmp_1;
CREATE TABLE t_wxbdd_tmp_1 AS SELECT
tmp_orderline.item_id,
tmp_orderline.item_count,
tmp_order.order_no,
tmp_order.app_order_no,
tmp_orderlinepay.common_id,
tmp_orderlinepay.pay_type,
tmp_orderlinepay.order_line_id,
tmp_order.order_no AS "批次号",
"线下" AS "下单渠道",
CASE
		tmp_orderlinepay.pay_type 
		WHEN 1 THEN
		"支付宝" 
		WHEN 2 THEN
		CONCAT( "微信", IF ( tmp_orderlinepay.pay_channel = 1, "2118", tmp_orderlinepay.common_id ) ) 
		WHEN 3 THEN
		"银联" 
		WHEN 8 THEN
		"现金" 
		WHEN 9 THEN
		"银行卡" 
		WHEN 10 THEN
		"瑞祥卡" 
	END "支付账户",
CASE
		tmp_orderlinepay.pay_type 
		WHEN 1 THEN
		CONCAT( "支付宝", IF ( tmp_orderlinepay.pay_channel = 1, "2118", "" ) ) 
		WHEN 2 THEN
		CONCAT( "微信", IF ( tmp_orderlinepay.pay_channel = 1, "2118", tmp_orderlinepay.common_id ) ) 
		WHEN 3 THEN
		"银联" 
		WHEN 4 THEN
		"充值余额" 
		WHEN 5 THEN
		"优惠券" 
		WHEN 6 THEN
		"妈豆" 
		WHEN 7 THEN
		"团购" 
		WHEN 8 THEN
		"现金" 
		WHEN 9 THEN
		"银行卡" 
		WHEN 10 THEN
		"瑞祥卡" ELSE "无效支付方式" 
	END "支付方式",
	tmp_orderline.item_unit_price / 100 "吊牌价",
	IFNULL( tmp_orderline.act_price / 100, tmp_orderline.item_unit_price / 100 ) "促销价",
CASE
		tmp_orderlinepay.pay_type 
		WHEN 4 THEN
		0 ELSE tmp_orderline.payment_amount / 100 
	END AS "实付金额",
	tmp_orderline.create_time "下单时间",
	"" AS "手续费比例",
	"" AS "手续费（不含税）",
	"" AS "服务费比例",
	"" AS "平台服务费",
	"" AS "运费",
	"销售单" AS "销售类型",
	tmp_order.order_no "订单号",
IF
	( tmp_orderlinepay.pay_channel = 1, tmp_order.pay_order_no, "" ) "银联商务交易号",
	tmp_orderlinepay.pay_serial_number "交易流水号",
CASE
		tmp_order.order_state 
		WHEN 0 THEN
		"已完成" 
		WHEN 4 THEN
		"待发货" 
		WHEN 5 THEN
		"待收货" 
		WHEN 7 THEN
		"待评价" 
	END "订单状态",
	tmp_orderlinepay.pay_time "支付时间",
CASE
		tmp_order.order_type 
		WHEN 1 THEN
		"普通订单" 
		WHEN 2 THEN
		"APP充值单" 
		WHEN 3 THEN
		"并卡单" 
		WHEN 4 THEN
		"预售单" 
		WHEN 5 THEN
		"寄存单" 
	END "订单类型",
	tmp_order.s_id "门店ID",
	tmp_order.s_name "门店名称",
	"唯宝" AS "分公司",
CASE
		tmp_order.delivery_way 
		WHEN 1 THEN
		"配送" 
		WHEN 2 THEN
		"自提" ELSE "快递" 
	END "配送方式",
	tmp_orderline.item_id "商品ID",
CASE
		tmp_orderline.item_type 
		WHEN 1 THEN
		"服务" 
		WHEN 2 THEN
		"卡项" ELSE "商品" 
	END "商品类别",
	tmp_orderline.item_name "商品名称",
CASE
		tmp_order.s_type 
		WHEN 1 THEN
		"门店" ELSE "仓库" 
	END "发货类型",
	tmp_order.s_name "发货方",
	tmp_order.s_id "门店/仓库编码",
	"妈妈好" AS "所属分公司",
	"妈妈好" AS "事业部一级",
	"唯宝" AS "事业部二级",
	tmp_orderline.item_count "商品数量",
	"唯宝" AS "商品事业部",
	'' AS aa 
FROM
	u_order_line tmp_orderline
	LEFT JOIN u_order tmp_order ON tmp_order.order_no = tmp_orderline.order_no
	LEFT JOIN u_order_line_pay tmp_orderlinepay ON tmp_orderline.order_line_id = tmp_orderlinepay.order_line_id 
WHERE
	tmp_order.order_state IN ( 0, 4, 5, 7 ) 
	AND EXISTS (
	SELECT
		1 
	FROM
		u_order_line_pay tmp_orderlinepay 
	WHERE
		tmp_orderline.order_line_id = tmp_orderlinepay.order_line_id 
		AND tmp_orderlinepay.payment_type = 0 
		AND tmp_orderlinepay.pay_type NOT IN ( 5, 6 ) #移除商品类型为卡项的商品
		
	) 
	AND tmp_orderline.item_type IN ( 1, 3 ) 
	AND tmp_orderlinepay.pay_time BETWEEN CONCAT( '2019-05-23', " 00:00:00" ) 
	AND CONCAT( '2019-05-23', " 23:59:59" ) 
GROUP BY
	tmp_orderline.order_line_id;
DROP TABLE t_wxbdd_tmp_2;
CREATE TABLE t_wxbdd_tmp_2 AS SELECT
a.*,
b.voucher_name AS "优惠券名称",
CASE
		b.voucher_cost 
		WHEN 0 THEN
		"集团职能部门" 
		WHEN 1 THEN
		"妈妈好承担" 
		WHEN 2 THEN
		"发货单位承担" 
		WHEN 3 THEN
		"Familyby GB事业部承担" 
		WHEN 4 THEN
		"护理用品事业部承担" 
		WHEN 5 THEN
		"婴儿服饰事业部承担" 
		WHEN 6 THEN
		"国际代理事业部承担" 
		WHEN 7 THEN
		"好孩子汽车座事业部承担" 
		WHEN 8 THEN
		"家居棉纺品事业部承担" 
		WHEN 9 THEN
		"Happydino事业部承担" 
		WHEN 10 THEN
		"运动用品事业部承担" 
		WHEN 11 THEN
		"Mothercare事业部承担" 
		WHEN 12 THEN
		"好孩子童车事业部承担" 
		WHEN 13 THEN
		"GBBU事业部" 
		WHEN 14 THEN
		"LC事业部" 
	END AS "优惠券承担方" 
FROM
	t_wxbdd_tmp_1 a
	LEFT JOIN (
	SELECT
		a.order_line_id,
		tv.voucher_name,
		tv.voucher_cost 
	FROM
		t_wxbdd_tmp_1 a
		LEFT JOIN u_order_line_pay uolp
		LEFT JOIN t_voucher tv ON tv.voucher_id = uolp.common_id ON uolp.order_line_id = a.order_line_id 
	WHERE
		uolp.pay_type = 5 
	GROUP BY
		a.order_line_id 
	) b ON a.order_line_id = b.order_line_id;
DROP TABLE t_wxbdd_tmp_3;
CREATE TABLE t_wxbdd_tmp_3 AS SELECT
a.*,
CASE
		
		WHEN percentage_record.serve_income IS NULL THEN
		0 ELSE percentage_record.serve_income 
	END AS "门店服务导购提成",
CASE
		
		WHEN percentage_record.binding_income IS NULL THEN
		0 ELSE percentage_record.binding_income 
	END AS "导购佣金" ,
	percentage_record.serve_id,
	percentage_record.serve_income,
	percentage_record.binding_id,
	percentage_record.binding_income 
FROM
	t_wxbdd_tmp_2 a
	LEFT JOIN (
	SELECT
		percentage_record.order_no,
		CAST( percentage_record.order_line_id AS SIGNED ) AS order_line_id,
		MAX( CASE WHEN percentage_record.staff_type = 1 THEN percentage_record.staff_id ELSE "" END ) AS "serve_id",
		SUM( CASE WHEN percentage_record.staff_type = 1 THEN percentage_record.income ELSE 0 END ) AS "serve_income",
		MAX( CASE WHEN percentage_record.staff_type IN ( 2, 3, 4 ) THEN percentage_record.staff_id ELSE "" END ) AS "binding_id",
		SUM( CASE WHEN percentage_record.staff_type IN ( 2, 3, 4 ) THEN percentage_record.income ELSE 0 END ) AS "binding_income" 
	FROM
		 u_achievement_percentage_record percentage_record 
	WHERE
		percentage_record.order_buy_type = 1 
		and percentage_record.order_line_id in (select order_line_id  from t_wxbdd_tmp_2)
	GROUP BY
		percentage_record.order_no,
		percentage_record.order_line_id 
	) percentage_record ON a.order_line_id = percentage_record.order_line_id;
DROP TABLE t_wxbdd_tmp_4;
CREATE TABLE t_wxbdd_tmp_4 AS SELECT
a.*,
staff_serve.staff_name AS "门店服务导购姓名",
staff_serve.staff_work_number AS "门店服务导购工号",
staff_binding.staff_name AS "会员所属导购姓名",
staff_binding.staff_work_number AS "会员所属导购工号",
gcs_shop_binding.SUB_UNIT_NAME AS "导购所属门店名称",
gcs_shop_binding.SUB_UNIT_NUM_ID AS "导购所属门店ID" 
FROM
	t_wxbdd_tmp_3 a
	LEFT JOIN u_staff staff_serve ON a.serve_id = staff_serve.staff_id
	LEFT JOIN u_staff staff_binding ON a.binding_id = staff_binding.`staff_id`
	LEFT JOIN (
	SELECT
		gcs_shop.SUB_UNIT_NUM_ID,
		gcs_shop.source_type,
		gcs_shop.SUB_UNIT_NAME 
	FROM
		gb_cort_sub_unit gcs_shop UNION ALL
	SELECT
		ware_house.STORAGE_NUM_ID,
		ware_house.source_type,
		ware_house.STORAGE_NAME 
	FROM
		gb_storage ware_house 
	) gcs_shop_binding ON gcs_shop_binding.SUB_UNIT_NUM_ID = staff_binding.`shop_id`;
drop table t_wxbdd_tmp_5;
CREATE TABLE t_wxbdd_tmp_5 AS SELECT
a.*,
tmp_gbshareitem.BARCODE_1 AS "商品条码",
tmp_gbshareitem.ITEMID AS "商品SKU",
tmp_gbstyle.STYLE_NUM_ID AS "款式ID",
tmp_gbstyle.STYLE_ID AS "款式编码",
tmp_brand.b_name AS "品牌名称",
tmp_goodstype.gt_name AS "一级类目",
tmp_goodstype_sec.gt_name AS "二级类目",
tmp_goodstype_third.gt_name AS "三级类目",
item_ext.purchase_price / 100 AS "采购进价",
item_ext.purchase_price * a.item_count / 100 AS "采购进价总额",
item_ext.cost_price / 100 AS "门店成本价",
item_ext.cost_price * a.item_count / 100 AS "门店成本价总额" 
FROM
	t_wxbdd_tmp_4 a
	LEFT JOIN gb_share_item tmp_gbshareitem ON a.item_id = tmp_gbshareitem.ITEM_NUM_ID
	LEFT JOIN gb_style tmp_gbstyle ON tmp_gbshareitem.STYLE_NUM_ID = tmp_gbstyle.STYLE_NUM_ID
	LEFT JOIN t_goods_type tmp_goodstype ON tmp_goodstype.gt_id = tmp_gbstyle.STYLE_CATELOG_FIRST
	LEFT JOIN t_goods_type tmp_goodstype_sec ON tmp_goodstype_sec.gt_id = tmp_gbstyle.style_catelog_sec
	LEFT JOIN t_goods_type tmp_goodstype_third ON tmp_goodstype_third.gt_id = tmp_gbstyle.style_catelog_third
	LEFT JOIN t_brand tmp_brand ON tmp_brand.b_id = tmp_gbstyle.BRAND_ID
	LEFT JOIN gb_share_item_ext item_ext ON a.item_id = item_ext.ITEM_NUM_ID;
	
drop table t_wxbdd_tmp_6;
create table 	t_wxbdd_tmp_6 as 
SELECT
	a.* ,b.`议价抵扣`
FROM
	t_wxbdd_tmp_5 a left join 
	(select SUM(common_value) / 100 as "议价抵扣" ,order_line_id from u_order_line_pay 
	where order_line_id in (select order_line_id from t_wxbdd_tmp_5) 
	and pay_type in (108)
	group by order_line_id,pay_type) b on a.order_line_id=b.order_line_id;
	drop table t_wxbdd_tmp_7;
	create table 	t_wxbdd_tmp_7 as 
SELECT
	a.* ,b.`满减金额`
FROM
	t_wxbdd_tmp_6 a left join 
	(select SUM(common_value) / 100 as "满减金额" ,order_line_id from u_order_line_pay 
	where order_line_id in (select order_line_id from t_wxbdd_tmp_6) 
	and pay_type in (104)
	group by order_line_id,pay_type) b on a.order_line_id=b.order_line_id;
	
	
drop table t_wxbdd_tmp_8 ;
CREATE TABLE t_wxbdd_tmp_8 AS SELECT
a.*,
b.`多买` 
FROM
	t_wxbdd_tmp_7 a
	LEFT JOIN (
	SELECT
		SUM( common_value ) / 100 AS "多买",
		order_line_id 
	FROM
		u_order_line_pay 
	WHERE
		order_line_id IN ( SELECT order_line_id FROM t_wxbdd_tmp_7 ) 
		AND pay_type IN ( 109 ) 
	GROUP BY
		order_line_id,
		pay_type 
	) b ON a.order_line_id = b.order_line_id;
	
	
	
	drop table t_wxbdd_tmp_9;
	CREATE TABLE t_wxbdd_tmp_9 AS SELECT
a.*,
b.`优惠券金额` 
FROM
	t_wxbdd_tmp_8 a
	LEFT JOIN (
	SELECT
		SUM( common_value ) / 100 AS "优惠券金额",
		order_line_id 
	FROM
		u_order_line_pay 
	WHERE
		order_line_id IN ( SELECT order_line_id FROM t_wxbdd_tmp_8 ) 
		AND pay_type IN ( 5 ) 
	GROUP BY
		order_line_id,
		pay_type 
	) b ON a.order_line_id = b.order_line_id;
	
	
	
drop table 	t_wxbdd_tmp_10;
	CREATE TABLE t_wxbdd_tmp_10 AS SELECT
a.*,
b.`妈豆优惠` 
FROM
	t_wxbdd_tmp_9 a
	LEFT JOIN (
	SELECT
		SUM( common_value ) / 100 AS "妈豆优惠",
		order_line_id 
	FROM
		u_order_line_pay 
	WHERE
		order_line_id IN ( SELECT order_line_id FROM t_wxbdd_tmp_9 ) 
		AND pay_type IN ( 6 ) 
	GROUP BY
		order_line_id,
		pay_type 
	) b ON a.order_line_id = b.order_line_id;
	select * from t_wxbdd_tmp_10;
	
	
	
	
	
	
	