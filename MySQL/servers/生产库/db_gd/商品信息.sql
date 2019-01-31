SELECT gs.style_num_id as 款式ID,
gsi.item_num_id as skuID,
gsi.barcode_1 as 条码,
gse.sku_name as sku短标题,
tb.b_name as 品牌,
t1.gt_name as 一级类目,
t2.gt_name as 二级类目,
t3.gt_name as 三级类目,
ge.market_price/100 as 吊牌价,
gse.purchase_price/100 as 采购进价,
gse.cost_price/100 as 门店成本价
FROM gb_share_item gsi 
LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
LEFT JOIN gb_style_ext ge ON gs.STYLE_NUM_ID = ge.STYLE_NUM_ID
LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
LEFT JOIN t_brand tb ON  gs.BRAND_ID = tb.b_id
WHERE
 gsi.is_deleted=0 
 and gs.IS_DELETED = 0 
 and  gse.item_num_id is not null;








