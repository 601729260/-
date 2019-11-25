select * from t_order where order_no in ('155140157797389','155140157738047');


		SELECT
			tmp1.item_id "itemId",
			sum(tmp1.qty) "count"
		FROM
			t_goods_distribution tmp1
		LEFT JOIN t_distribution tmp2 ON tmp1.distribution_id = tmp2.distribution_id
		WHERE
			tmp2.order_no = '155110114312289'
		GROUP BY tmp1.item_id;
		
		
				SELECT
			good_item_id "itemId",
			barcode "barcode",
			sum(pre_allocated_count) "count"
		FROM
			t_order_line
		WHERE
			order_no = '155110114312289'
		GROUP BY good_item_id;