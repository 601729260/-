SELECT
	* 
FROM
	t_virtual_stock 
WHERE
	virtual_stock_type = 7;
SELECT
	* 
FROM
	t_virtual_stock_member;
Preparing : SELECT
count( 0 ) 
FROM
	(
	SELECT
		gs.style_num_id,
		gs.style_id AS style_code,
		gs.style_type AS goods_type,
		gse.unit_id,
		gse.unit,
		gse.box_num,
		gs.STYLE_CATELOG_FIRST,
		gs.STYLE_CATELOG_SEC,
		gs.STYLE_CATELOG_THIRD,
		gs.DIV_NUM_ID,
		gs.brand_id AS goods_brand_id,
		tb.b_name AS goods_brand_name,
		gs.style_title,
		gs.ONLINE_CLOUD AS ONLINE,
		gse.shelf_life,
		a.qty,
	IF
		( gse.market_price IS NULL, 0, gse.market_price ) AS market_price,
		gse.create_time AS style_create_time,
		gse.update_time AS style_update_time,
		gsie.sku_name,
	IF
		( gsie.purchase_price IS NULL, 0, gsie.purchase_price ) AS purchase_price,
	IF
		( gsie.cost_price IS NULL, 0, gsie.cost_price ) AS cost_price,
		sku.item_num_id,
		sku.ITEMID AS sku_code,
		sku.BARCODE_1 AS barcode,
		sku.COLOR_NAME AS one_value,
		sku.SIZE_NAME AS two_value,
		sku.TITLE_TO_COLOR AS sku_title_one,
		sku.TITLE_TO_SIZE AS sku_title_two 
	FROM
		t_virtual_stock a
		LEFT JOIN gb_share_item sku ON a.item_num_id = sku.item_num_id
		LEFT JOIN gb_share_item_ext gsie ON sku.item_num_id = gsie.item_num_id
		LEFT JOIN gb_style gs ON gs.style_num_id = sku.style_num_id
		LEFT JOIN gb_style_ext gse ON gs.style_num_id = gse.style_num_id
		LEFT JOIN t_brand tb ON gs.brand_id = tb.b_id 
	WHERE
		gs.IS_DELETED = 0 
		AND sku.IS_DELETED = 0 
		AND a.virtual_stock_type = ? 
		AND a.sid = ? 
	ORDER BY
		gs.update_time DESC 
	) tmp_count 2019-03-05 19 : 09 : 31.982 DEBUG [ mamahao - ebiz - stock, e5d31b5a44958faa, 1881 a6fe84040dcb, FALSE ] 19880 --- [ nio - 8012-e xec - 8 ] c.m.e.s.p.r.V.queryGoodsVirtual_COUNT : ==> Parameters : 7 ( INTEGER ),
	2 ( LONG ) 2019-03-05 19 : 09 : 31.986 DEBUG [ mamahao - ebiz - stock, e5d31b5a44958faa, 1881 a6fe84040dcb, FALSE ] 19880 --- [ nio - 8012-e xec - 8 ] c.m.e.s.p.r.V.queryGoodsVirtual_COUNT : <== Total : 1
	
	
	
	
	select * from 	t_virtual_stock limit 1;
	
	select * from t_virtual_stock_member ;
	
	
	
	