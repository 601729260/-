SELECT
	a.id 单据编号,
	p_qty_change AS 公共库存变化,
	qty_change as app库存变化 ,
	c.from_sid_name as 出库门店,
	c.to_sid_name as 入库门店,
	b.barcode_1 as  条码
FROM
	u_goods_stock_log  a,
	gb_share_item b,
	u_stock_log c
	
WHERE a.item_num_id=b.item_num_id
 and sid=1800000080 
	and a.id=c.id
	and a.bill_type in (0,1,2,3)
	AND b.barcode_1  IN ( 6901755942925 ) 
	AND a.id IS NOT NULL
	and a.id!=''
	
	
