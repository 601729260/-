SELECT
CONCAT(
t1.gt_name,
"/",
t2.gt_name,
"/",
t3.gt_name
) AS '类目',
FORMAT(gse.purchase_price/100,2) AS '进价'
FROM
t_gb_stock tgs
LEFT JOIN gb_share_item gsi ON tgs.item_num_id = gsi.ITEM_NUM_ID
LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
LEFT JOIN gb_style_ext ge ON gs.STYLE_NUM_ID = ge.STYLE_NUM_ID
LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
LEFT JOIN t_brand tb ON  gs.BRAND_ID = tb.b_id
WHERE
tgs.storage_id = 1800000080 and gs.IS_DELETED = 0 and  gse.item_num_id is not null;


