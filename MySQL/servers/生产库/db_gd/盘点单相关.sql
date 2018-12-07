SELECT
	* 
FROM
	gb_share_item 
WHERE
	barcode_1 = '6956262403094';
	
	
SELECT DISTINCT
	b.id,
	b.from_sid_name AS ‘出库门店’,
	b.to_sid_name AS '入库门店',
	barcode AS '条码',
	a.style_title AS '商品名称',
	from_num AS '调拨数量',
	b.create_time AS '创建时间' 
FROM
	u_stock_log_detail a
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE
	b.bill_type IN ( 1, 2 ) 
	AND b.STATUS IN ( 5, 2 ) 
	AND b.create_time >= '2018-11-12 11:25:00' 
	AND b.create_time <= '2018-11-12 18:21:00'; 
	
	
	
	
		
SELECT DISTINCT
	b.id,
	barcode AS '条码',
	a.style_title AS '商品名称',
	CONVERT(sum(a.check_num),CHAR) AS '盘点数量'
FROM
	u_stock_log_detail a
	LEFT JOIN u_stock_log b ON a.id = b.id 
WHERE b.bill_type=5
  and from_sid=1800000080
	AND b.create_time >= '2018-11-12 11:25:00' 
	group by a.id,a.item_num_id,a.style_title; 
	
	

	
	
	
create table u_stock_log_pdbak20181113 as 	SELECT id FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00';

create table u_stock_log_detail_pdbak20181113 as select * from u_stock_log_detail where id in(SELECT id FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00');

delete  from u_stock_log_detail where id in(SELECT id FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00');
delete FROM u_stock_log WHERE bill_type = 5 AND from_sid = 1800000080 AND create_time > '2018-11-12 11:25:00';




