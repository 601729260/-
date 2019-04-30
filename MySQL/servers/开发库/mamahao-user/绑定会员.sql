SELECT
	onu,
	otype,
	otime 
FROM
	(
	SELECT
		o.order_batch_no "onu",
		1 AS "otype",
		o.created_time "otime" 
	FROM
		t_order o 
	WHERE
		o.member_id = 1994076 
		AND o.order_batch_no IS NOT NULL 
		AND o.order_state IN ( 1, 2, 3 ) 
		AND o.dealing_type = 1 
		AND o.inspect_refuse_type IN ( 0, 1 ) 
		AND (
			o.order_type IN ( 3, 4, 5, 6, 7, 9, 10 ) 
			AND o.dealing_type <> 5 
			OR ( o.order_type = 1 AND IFNULL( o.relation_type, '' ) != 4 ) 
		) 
	GROUP BY
		o.order_batch_no UNION ALL
	SELECT
		co.order_no "onu",
		2 AS "otype",
		co.created_time "otime" 
	FROM
		t_order co 
	WHERE
		co.member_id = 1994076 
		AND co.parent_order_no IS NOT NULL 
		AND ( co.order_state IN ( 0, 4, 5, 6, 9 ) OR ( co.order_state = 2 AND co.dealing_type = 2 ) ) 
		AND co.inspect_refuse_type IN ( 0, 1 ) 
		AND co.split_flag IN ( 0, 1 ) 
		AND ( co.sub_type <> 2 OR ( co.sub_type = 2 AND co.order_state != 4 ) ) 
		AND (
			co.order_type IN ( 3, 4, 5, 6, 7, 9, 10 ) 
			OR ( co.order_type = 1 AND IFNULL( co.relation_type, '' ) != 4 ) 
		) 
	) AS orders 
ORDER BY
	otime DESC,
	onu DESC 
	
	
	
	
	
	
	