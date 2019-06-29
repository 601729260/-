
	
	
	SELECT
	* 
FROM
	t_gb_stock a
	left JOIN (
	SELECT
		to_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS in_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		to_sid,
		item_num_id 
	) b ON a.shop_id = b.to_sid 
	AND a.item_num_id = b.item_num_id 
WHERE
	a.in_qty != ifnull( b.in_qty, 0 ) 
	AND a.shop_id != 0
	and a.in_qty>0;
	
	
SELECT
	* 
FROM
	t_gb_stock a
	left JOIN (
	SELECT
		to_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS in_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		to_sid,
		item_num_id 
	) b ON a.storage_id = b.to_sid 
	AND a.item_num_id = b.item_num_id 
WHERE
	a.in_qty != ifnull( b.in_qty, 0 ) 
	AND a.storage_id != 0
	and a.in_qty>0;
	
	
	
	
	
SELECT
	* 
FROM
	t_gb_stock a
	RIGHT JOIN (
	SELECT
		from_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS out_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		from_sid,
		item_num_id 
	) b ON a.shop_id = b.from_sid 
	AND a.item_num_id = b.item_num_id 
WHERE
	a.out_qty != ifnull( b.out_qty, 0 ) 
	AND a.shop_id != 0;
SELECT
	* 
FROM
	t_gb_stock a
	RIGHT JOIN (
	SELECT
		from_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS out_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		from_sid,
		item_num_id 
	) b ON a.storage_id = b.from_sid 
	AND a.item_num_id = b.item_num_id 
WHERE
	a.out_qty != ifnull( b.out_qty, 0 ) 
	AND a.storage_id != 0;
--------------------------------------------- 


UPDATE t_gb_stock a
left JOIN (
	SELECT
		to_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS in_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		to_sid,
		item_num_id 
	) b ON a.shop_id = b.to_sid 
	AND a.item_num_id = b.item_num_id 
	SET a.in_qty = ifnull( b.in_qty, 0 ) 
WHERE
	a.in_qty != ifnull( b.in_qty, 0 ) 
	AND a.shop_id != 0
	and a.in_qty>0;
	
	
UPDATE t_gb_stock a
left JOIN (
	SELECT
		to_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS in_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		to_sid,
		item_num_id 
	) b ON a.storage_id = b.to_sid 
	AND a.item_num_id = b.item_num_id 
	SET a.in_qty = ifnull( b.in_qty, 0 ) 
WHERE
	a.in_qty != ifnull( b.in_qty, 0 ) 
	AND a.storage_id != 0
	and a.in_qty>0;
	
	
	
	
UPDATE t_gb_stock a
left JOIN (
	SELECT
		from_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS out_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		from_sid,
		item_num_id 
	) b ON a.shop_id = b.from_sid 
	AND a.item_num_id = b.item_num_id 
	SET a.out_qty = ifnull( b.out_qty, 0 ) 
WHERE
	a.out_qty != ifnull( b.out_qty, 0 ) 
	AND a.shop_id != 0
	and a.in_qty>0;
	
	
	
UPDATE t_gb_stock a
left JOIN (
	SELECT
		from_sid,
		item_num_id,
		sum( from_num - ifnull( to_num, 0 ) ) AS out_qty 
	FROM
		u_stock_log_detail 
	WHERE
		STATUS IN ( 1, 3, 5 ) 
	GROUP BY
		from_sid,
		item_num_id 
	) b ON a.storage_id = b.from_sid 
	AND a.item_num_id = b.item_num_id 
	SET a.out_qty = ifnull( b.out_qty, 0 ) 
WHERE
	a.out_qty != ifnull( b.out_qty, 0 ) 
	AND a.storage_id != 0
	and a.in_qty>0;
	
	