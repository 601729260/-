SELECT
	id AS '单据编号',
	style_code AS '商品货号',
	barcode AS '商品条码',
	style_title AS '商品名称',
	one_value AS '规格',
	p_qty AS '剩余库存',
	apply_from_num AS '申请调货数量',
	from_num AS '同意调货数量' 
FROM
	u_stock_log_detail 
WHERE
	id = 'MMH2018103110000538';
SELECT
	id,
	count( 1 ) 
FROM
	u_stock_log_detail 
GROUP BY
	id 
ORDER BY
	count( 1 ) DESC;
SELECT
	* 
FROM
	u_stock_log_detail 
WHERE
	id = 'MMH2018103110000482' 
	AND barcode = '6953071216426';
SELECT DISTINCT
	to_sid 
FROM
	u_stock_log 
WHERE
	bill_type = 0;
SELECT
	* 
FROM
	u_stock_log_detail 
GROUP BY
	id MMH2018103110000480 155 MMH2018103110000585 20 MMH2018110210000961 3 bill_type = 2 SELECT
	bill_type,
	count( 1 ) 
FROM
	u_stock_log 
GROUP BY
	bill_type #调拨出库在途
SELECT
	id,
	from_sid_name AS ‘出库门店’,
	to_sid_name AS '入库门店' 
FROM
	u_stock_log 
WHERE
	bill_type = 1 
	AND STATUS = 5;
SELECT
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	from_num AS '调拨数量' 
FROM
	u_stock_log_detail a,
	u_stock_log b 
WHERE
	b.bill_type = 1 
	AND b.STATUS = 5 
	AND a.id = b.id;#调拨入库在途
SELECT
	id,
	from_sid_name AS ‘出库门店’,
	to_sid_name AS '入库门店' 
FROM
	u_stock_log 
WHERE
	bill_type = 2 
	AND STATUS = 5;
SELECT
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	from_num AS '调拨数量' 
FROM
	u_stock_log_detail a,
	u_stock_log b 
WHERE
	b.bill_type = 2 
	AND b.STATUS = 5 
	AND a.id = b.id;
调拨单 SELECT
id,
from_sid_name AS ‘出库门店’,
to_sid_name AS '入库门店' 
FROM
	u_stock_log 
WHERE
	bill_type IN （ 1,
	2 
	) 
	AND STATUS = 5;
SELECT
	* 
FROM
	gb_cort_sub_unit 
WHERE
	source_type = 2 
	AND sub_unit_name LIKE '%城北%';
1500000102 唯小宝江苏昆山新城域店 1500000110 唯小宝江苏昆山城北店

（ 1500000102,
1500000110 
) #---------------------------门店相关---------------------
SELECT DISTINCT
	'采购单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	gb_share_item gsi
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
	LEFT JOIN u_stock_log_detail a ON a.barcode = gsi.barcode_1
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type IN ( 0 ) 
	AND b.STATUS IN ( 1, 2, 3 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.to_sid IN ( 1500000102, 1500000110 ) 
	AND gs.IS_DELETED = 0 UNION ALL
SELECT DISTINCT
	'调拨出库单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	gb_share_item gsi
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
	LEFT JOIN u_stock_log_detail a ON a.barcode = gsi.barcode_1
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type = 1 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.from_sid IN ( 1500000102, 1500000110 ) UNION ALL
SELECT DISTINCT
	'调拨入库单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	gb_share_item gsi
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
	LEFT JOIN u_stock_log_detail a ON a.barcode = gsi.barcode_1
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type = 2 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.from_sid IN ( 1500000102, 1500000110 ) UNION ALL
SELECT DISTINCT
	'退货单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	gb_share_item gsi
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
	LEFT JOIN u_stock_log_detail a ON a.barcode = gsi.barcode_1
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type = 3 
	AND b.STATUS IN ( 1, 2 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.to_sid IN ( 1500000102, 1500000110 );
	
	
	
	
	#--------------------------仓库相关数据-------------------------
SELECT
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	gb_share_item gsi
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id 
WHERE
	gs.IS_DELETED = 0 
	AND gsi.barcode_1 = 6949756340333;
	
	
SELECT DISTINCT
	'采购单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	 u_stock_log_detail a 
	LEFT JOIN u_stock_log b ON a.id = b.id 
	LEFT JOIN gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id

WHERE
	b.bill_type IN ( 0 ) 
	AND b.STATUS IN ( 1, 2, 3 ) 
	AND b.create_time >= '2018-11-12 00:00:00' 
	AND b.create_time <= '2018-11-14 23:59:59' 
	AND b.to_sid = 1800000080 
	AND gs.IS_DELETED = 0 UNION ALL
SELECT DISTINCT
	'调拨出库单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	 u_stock_log_detail a 
	LEFT JOIN u_stock_log b ON a.id = b.id 
	LEFT JOIN gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
WHERE
	b.bill_type = 1 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-12 00:00:00' 
	AND b.create_time <= '2018-11-14 23:59:59' 
	AND b.from_sid = 1800000080 UNION ALL
SELECT DISTINCT
	'调拨入库单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	 u_stock_log_detail a 
	LEFT JOIN u_stock_log b ON a.id = b.id 
	LEFT JOIN gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
WHERE
	b.bill_type = 2 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-12 00:00:00' 
	AND b.create_time <= '2018-11-14 23:59:59' 
	AND b.from_sid = 1800000080 UNION ALL
SELECT DISTINCT
	'退货单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	gb_share_item gsi
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
	LEFT JOIN u_stock_log_detail a ON a.barcode = gsi.barcode_1
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type = 3 
	AND b.STATUS IN ( 1, 2 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.to_sid = 1800000080;
SELECT
	* 
FROM
	t_gb_stock 
WHERE
	item_num_id;
	
#---------------------------------------盘点单明细-----------------------------
	
create table u_stock_log_pdbak20181113 as  SELECT id FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00';

create table u_stock_log_bak201811132 as select * from u_stock_log;
create table u_stock_log_detail_bak201811132 as select * from u_stock_log_detail;
insert into u_stock_log(id,style_title,status, select * from u_stock_log_pdbak20181113;

select * from u_stock_log;

SELECT DISTINCT
	a.id,
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	a.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
 u_stock_log_detail_pdbak20181113 a 
 LEFT JOIN	gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id;

create table u_stock_log_detail_pdbak20181113 as select * from u_stock_log_detail where id in(SELECT id FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00');

delete  from u_stock_log_detail where id in(SELECT id FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00');
delete FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00';




SELECT DISTINCT
	a.id,
	b.to_sid_name as '门店',
	a.barcode AS '条码',
	a.style_title AS '商品名称',
	from_num as '账面库存',
	check_num AS '盘点数量',
	a.create_time AS '创建时间',
  a.one_value as '规格'
FROM
 u_stock_log_detail a 
 	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type=5 
	#AND b.STATUS=0
	#AND b.create_time >= '2018-11-01 00:00:00' 
	#AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.from_sid IN ( 1500000102, 1500000110 )  


select sum(check_num),
sum(from_num)
FROM
 u_stock_log_detail a 
 	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type=5 
	#AND b.STATUS=0
	#AND b.create_time >= '2018-11-01 00:00:00' 
	#AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.from_sid IN ( 1500000102, 1500000110 ) ;



SELECT DISTINCT
	a.id,
	b.to_sid_name as '门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	a.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目'
FROM
 u_stock_log_detail a 
 	LEFT JOIN u_stock_log b ON a.id = b.id 
  LEFT JOIN	gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id;
WHERE
	b.bill_type=5 
	AND b.STATUS=0
	#AND b.create_time >= '2018-11-01 00:00:00' 
	#AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.to_sid IN ( 1500000102, 1500000110 ) 
	AND gs.IS_DELETED = 0




#-------------------------采购单引起的入库 ------------------

SELECT DISTINCT
	a.id,
	gsi.barcode_1 AS '条码',
	gs.style_title AS '商品名称',
	p_qty_change AS '数量',
	a.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
	FROM
 u_goods_stock_log a 
 left join u_stock_log b on a.id= b.id
 LEFT JOIN	gb_share_item gsi ON a.item_num_id = gsi.item_num_id
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
 where b.bill_type=0
 and gsi.is_deleted=0
 AND b.create_time > '2018-11-01 00:00:00'
 and b.create_time < '2018-11-12 23:59:59';
 
 
select * from u_stock_log b where 
b.bill_type=0
 AND b.create_time > '2018-11-01 00:00:00'
 and b.create_time < '2018-11-12 23:59:59';

select * from gb_share_item limit 1;

select * from u_goods_stock_log limit 1;
#----------------------------------------------

select * from u_stock_log_detail where id='MMH2018110810003030';

select * from u_stock_log where id='MMH2018110810003030';


#---------------------------------入库明细

SELECT DISTINCT
	'调拨出库单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	 u_stock_log_detail a 
	LEFT JOIN u_stock_log b ON a.id = b.id 
	LEFT JOIN gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
WHERE
	b.bill_type = 1 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.to_sid IN ( 1500000102, 1500000110 ) UNION ALL
SELECT DISTINCT
	'调拨入库单' AS '单据类型',
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '数量',
	b.create_time AS '创建时间',
	CONCAT( t1.gt_name, "/", t2.gt_name, "/", t3.gt_name ) AS '类目',
	FORMAT( gse.purchase_price / 100, 2 ) AS '进价' 
FROM
	 u_stock_log_detail a 
	LEFT JOIN u_stock_log b ON a.id = b.id 
	LEFT JOIN gb_share_item gsi ON a.barcode = gsi.barcode_1
	LEFT JOIN gb_share_item_ext gse ON gsi.ITEM_NUM_ID = gse.item_num_id
	LEFT JOIN gb_style gs ON gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	LEFT JOIN t_goods_type t1 ON gs.STYLE_CATELOG_FIRST = t1.gt_id
	LEFT JOIN t_goods_type t2 ON gs.STYLE_CATELOG_SEC = t2.gt_id
	LEFT JOIN t_goods_type t3 ON gs.STYLE_CATELOG_THIRD = t3.gt_id
WHERE
	b.bill_type = 2 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-01 00:00:00' 
	AND b.create_time <= '2018-11-12 10:00:00' 
	AND b.to_sid IN ( 1500000102, 1500000110 )、
	
	
	
	select * from u_stock_log where id='MMH2018111610005238';
