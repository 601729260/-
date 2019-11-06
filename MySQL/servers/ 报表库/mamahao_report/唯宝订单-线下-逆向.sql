  SELECT
            tmp_refund.refund_no "批次号" ,
						         "售后单" AS "销售类型" ,
						tmp_refund.create_time "下单时间" ,
            "线下" AS "下单渠道" ,
						"退款成功" AS "订单状态" ,
					tmp_refund.pay_time "支付时间" ,
					tmp_refundpay.pay_serial_number "交易流水号" ,
					"" as "好孩子单号",
            CASE tmp_refundpay.pay_type
        WHEN 1 THEN
            "支付宝"
        WHEN 2 THEN
            CONCAT(
                "微信" ,
                if(tmp_refundpay.pay_channel=1,"2118",tmp_refundpay.common_id)
            )
        WHEN 3 THEN
            "银联-云闪付账户"
        WHEN 8 THEN
            "现金"
        WHEN 9 THEN
            "银行卡"
        WHEN 10 THEN
            "瑞祥卡"
        WHEN 15 THEN  "银联-苹果账户"
        WHEN  16 THEN "银联-华为账户"
        WHEN  17 THEN "银联-小米账户"
        WHEN 18 THEN  "银联-三星账户"
        ELSE
            "无效支付账户"
        END "支付账户" ,
         CASE tmp_refundpay.pay_type
         WHEN 1 THEN
         CONCAT("支付宝",if(tmp_refundpay.pay_channel=1,"2118",""))
        WHEN 2 THEN
        CONCAT("微信",if(tmp_refundpay.pay_channel=1,"2118",tmp_refundpay.common_id))
        WHEN 3
        THEN "银联-云闪付"
        WHEN 4
        THEN "充值余额"
        WHEN 5
        THEN "优惠券"
        WHEN 6
        THEN "妈豆"
        WHEN 7
        THEN "团购"
        WHEN 8
        THEN "现金"
        WHEN 9
        THEN "银行卡"
        WHEN 10
        THEN "瑞祥卡"
         WHEN 15 THEN
        "银联-苹果支付"
        WHEN  16 THEN
        "银联-华为支付"
        WHEN 17 THEN
        "银联-小米支付"
        WHEN 18 THEN
        "银联-三星支付"
        ELSE "无效支付方式"
        END "支付方式",
         CONCAT(
                '',
         tmp_orderline.item_unit_price / 100) AS "吊牌价" ,
          CONCAT(
                '',
                IFNULL(
            tmp_orderline.act_price / 100 ,
            tmp_orderline.item_unit_price / 100
        )) "促销价" ,
         ifnull(CONCAT(
                (SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (108))),0) "议价金额",
          ifnull(CONCAT(
                '-',(SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (104))),0) "满减金额",
        CONCAT(
                '-',
            CASE
            WHEN tmp_refundgoods.gift_type = 0 THEN
                (
                    SELECT
                        SUM(offset_price) / 100
                    FROM
                        mamahao_warehouse.u_refund_pay
                    WHERE
                        refund_no = tmp_refund.refund_no
                    AND pay_type IN(4)
                )
            ELSE
                0
            END
         )  AS "充值余额" ,
          CONCAT(
        '-',tmp_refundgoods.item_count)AS "商品数量" ,
				"" AS "运费" ,
				       CONCAT(
                '-',
            CASE
            when tmp_refundpay.pay_type = 4 then
            0
            WHEN tmp_refundgoods.gift_type = 0 THEN
                tmp_refundpay.common_value / 100
            ELSE
                0
            END
        ) "实付金额" ,
        ifnull( CONCAT(
                '-',
            CASE
            WHEN tmp_refundgoods.gift_type = 0 THEN
                (
                    SELECT
                        SUM(offset_price) / 100
                    FROM
                        mamahao_warehouse.u_refund_pay
                    WHERE
                        refund_no = tmp_refund.refund_no
                    AND pay_type IN(19)
                )
            ELSE
                0
            END
         ),0)  AS "支付优惠金额" ,
				          CONCAT(
                '-',
            CASE
            WHEN tmp_refundgoods.gift_type = 0 THEN
                (
                    SELECT
                        SUM(offset_price) / 100
                    FROM
                        mamahao_warehouse.u_refund_pay
                    WHERE
                        refund_no = tmp_refund.refund_no
                    AND pay_type IN(6)
                )
            ELSE
                0
            END
        ) "妈豆优惠" ,

         ifnull( CONCAT(
                '-',
            CASE
            WHEN tmp_refundgoods.gift_type = 0 THEN
                (
                    SELECT
                        SUM(offset_price) / 100
                    FROM
                        mamahao_warehouse.u_refund_pay
                    WHERE
                        refund_no = tmp_refund.refund_no
                    AND pay_type IN(5)
                )
            ELSE
                0
            END
         ),0)  AS "优惠券金额" ,
         tvo.voucher_template_id voucherTemplateId,
         (select tv.voucher_name from mamahao_warehouse.t_voucher  tv  where tv.voucher_id in (
          select urp.common_id from mamahao_warehouse.u_refund_pay urp
             where urp.refund_no = tmp_refund.refund_no and urp.pay_type IN (5))
         limit 1
            ) AS "优惠券名称",
         "" AS "收货省" ,
         "" AS "收货市" ,
         "" AS "收货县/区" ,
         "" AS "具体地址" ,
         "" AS "手续费比例" ,
         tmp_refund.order_no "订单号" ,
         CASE tmp_order.order_type
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
        END "订单类型" ,
				"" as "订单来源",
         CASE tmp_refund.delivery_way
        WHEN 1 THEN
            "配送"
        WHEN 2 THEN
            "自提"
        ELSE
            "快递"
        END "配送方式" ,
        "" as "妈妈好配送人员姓名",
				"" as "妈妈好配送人员所属试点城市",
         tmp_refundgoods.item_name "商品名称" ,
         tmp_gbshareitem.BARCODE_1 AS "商品条码",
         tmp_gbshareitem.ITEMID AS "商品SKU" ,
         tmp_gbstyle.STYLE_NUM_ID AS "款式ID" ,
         tmp_gbstyle.STYLE_ID AS "款式编码" ,
         tmp_brand.b_name AS "品牌名称" ,
        CASE tmp_refund.s_type WHEN 1 THEN "门店" ELSE "仓库" END "发货类型",
        tmp_refund.s_name "发货方",
        tmp_refund.s_id "门店/仓库编码",
        "妈妈好" AS "所属分公司",
        "妈妈好" AS "事业部一级",
        "唯宝" AS "事业部二级",
			 CASE tmp_refundgoods.item_type
        WHEN 1 THEN
            "服务"
        WHEN 2 THEN
            "卡项"
        ELSE
            "商品"
        END "商品类别" ,
        tmp_goodstype.gt_name AS "一级类目",
        tmp_goodstype_sec.gt_name AS "二级类目",
        tmp_goodstype_third.gt_name AS "三级类目",
				"" as "所属福利",
				"" as "订单标记类型",
				"" as "订单子类型",
            CASE
            tvo.voucher_cost
            WHEN 0
            THEN "集团职能部门"
            WHEN 1
            THEN "妈妈好承担"
            WHEN 2
            THEN "发货单位承担"
            WHEN 3
            THEN "Familyby GB事业部承担"
            WHEN 4
            THEN "护理用品事业部承担"
            WHEN 5
            THEN "婴儿服饰事业部承担"
            WHEN 6
            THEN "国际代理事业部承担"
            WHEN 7
            THEN "好孩子汽车座事业部承担"
            WHEN 8
            THEN "家居棉纺品事业部承担"
            WHEN 9
            THEN "Happydino事业部承担"
            WHEN 10
            THEN "运动用品事业部承担"
            WHEN 11
            THEN "Mothercare事业部承担"
            WHEN 12
            THEN "好孩子童车事业部承担"
            WHEN 13
            THEN "GBBU事业部"
            WHEN 14
            THEN "LC事业部"
          END AS "优惠券承担方",
         "唯宝" AS "商品事业部" ,
           CONCAT(
                '-',item_ext.purchase_price / 100) AS "采购进价" ,
          CONCAT(
                '-',item_ext.purchase_price * tmp_refundgoods.item_count / 100) AS "采购进价总额" ,
           CONCAT(
                '-',item_ext.cost_price / 100) AS "门店成本价" ,
          CONCAT(
                '-',item_ext.cost_price * tmp_refundgoods.item_count / 100) AS "门店成本价总额" ,

         staff_serve.staff_name
            AS "门店服务导购姓名",
            staff_serve.staff_work_number
            AS "门店服务导购工号",
						CASE
						WHEN percentage_record.serve_income IS NULL
						THEN
						0
						ELSE
            CONCAT('-',percentage_record.serve_income)
						END
            AS "门店服务导购提成",
            staff_binding.staff_name
            AS "会员所属导购姓名",
               staff_binding.staff_work_number
             AS "会员所属导购工号",
             gcs_shop_binding.SUB_UNIT_NAME
             AS "导购所属门店名称",
             gcs_shop_binding.SUB_UNIT_NUM_ID
             AS "导购所属门店ID",
            CASE
            WHEN percentage_record.binding_income IS NULL
            THEN 0
            ELSE
             CONCAT('-',percentage_record.binding_income)
            END
             AS "导购佣金",
              CONCAT(
                '-',t1.commission_amount1) "直属佣金",
  t1.member_phone1 "直属入账手机号",
    CONCAT(
                '-',t2.commission_amount2) "间接佣金",
  t2.member_phone2 "间接入账手机号",
	        tmp_order.s_name as "业绩归属方",
					0 AS "储值卡折扣金额",
	         0 AS "多买" ,
				 0 AS "集团优惠券承担部分",
        0 AS "妈妈好优惠券承担部分",
				"" AS "订单实付金额",
				if(tmp_refundpay.pay_channel=1,tmp_refundpay.pay_order_no ,"") "银联商务交易号",	 
							  tmp_order.s_id "门店ID",
        tmp_order.s_name "门店名称",
        "唯宝" AS "分公司",		
        tmp_goodstype.gt_name "商品类别2",		
			tmp_refundgoods.item_id "商品ID" 
        FROM
            mamahao_warehouse.u_refund_goods tmp_refundgoods
        LEFT JOIN mamahao_warehouse.u_order_line tmp_orderline ON tmp_refundgoods.order_line_id = tmp_orderline.order_line_id
        LEFT JOIN mamahao_warehouse.u_refund_basic tmp_refund ON tmp_refund.refund_no = tmp_refundgoods.refund_no
        LEFT JOIN mamahao_warehouse.u_refund_pay tmp_refundpay ON tmp_refund.refund_no = tmp_refundpay.refund_no
        LEFT JOIN mamahao_warehouse.gb_share_item tmp_gbshareitem ON tmp_refundgoods.item_type = 3
        AND tmp_refundgoods.item_id = tmp_gbshareitem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_style tmp_gbstyle ON tmp_gbshareitem.STYLE_NUM_ID = tmp_gbstyle.STYLE_NUM_ID
        LEFT JOIN mamahao_warehouse.t_goods_type tmp_goodstype ON tmp_goodstype.gt_id = tmp_gbstyle.STYLE_CATELOG_FIRST

        LEFT JOIN mamahao_warehouse.t_goods_type tmp_goodstype_sec ON tmp_goodstype_sec.gt_id = tmp_gbstyle.style_catelog_sec
        LEFT JOIN mamahao_warehouse.t_goods_type tmp_goodstype_third ON tmp_goodstype_third.gt_id = tmp_gbstyle.style_catelog_third

        LEFT JOIN mamahao_warehouse.t_brand tmp_brand ON tmp_brand.b_id = tmp_gbstyle.BRAND_ID
        LEFT JOIN mamahao_warehouse.u_order tmp_order ON tmp_order.order_no = tmp_refund.order_no
        LEFT JOIN mamahao_warehouse.gb_share_item_ext item_ext ON tmp_orderline.item_id = item_ext.ITEM_NUM_ID


        left join(
        SELECT
        urp.order_line_id,tv.voucher_cost,tv.voucher_template_id
        FROM mamahao_warehouse.u_refund_pay urp
        LEFT JOIN mamahao_warehouse.t_voucher tv ON urp.common_id=tv.voucher_id
        WHERE urp.pay_type = 5
        AND urp.create_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59') tvo
        on  tmp_refundgoods.order_line_id = tvo.order_line_id

         LEFT JOIN
            (SELECT
			percentage_record.order_no,
			CAST(percentage_record.order_line_id AS signed) as order_line_id,
			max(
			CASE
			WHEN percentage_record.staff_type = 1
			THEN percentage_record.staff_id
			ELSE ""
			END) AS "serve_id",

			sum(CASE
			WHEN percentage_record.staff_type = 1
			THEN percentage_record.income
			ELSE 0
			END) AS "serve_income",

			MAx(
			CASE
			WHEN percentage_record.staff_type IN(2,3,4)
			THEN percentage_record.staff_id
			ELSE ""
			END)  AS "binding_id",
			sum(
			CASE
			WHEN percentage_record.staff_type IN(2,3,4)
			THEN percentage_record.income
			ELSE 0
            END) AS "binding_income"

       FROM
        mamahao_warehouse.u_achievement_percentage_record percentage_record
        WHERE percentage_record.order_buy_type = 2
        GROUP BY percentage_record.order_no,percentage_record.order_line_id) percentage_record
            ON tmp_orderline.order_no = percentage_record.order_no
            AND tmp_orderline.order_line_id = percentage_record.order_line_id
         LEFT JOIN mamahao_warehouse.u_staff staff_serve
        ON percentage_record.serve_id = staff_serve.`staff_id`

		LEFT JOIN mamahao_warehouse.u_staff staff_binding
        ON percentage_record.binding_id = staff_binding.`staff_id`

         LEFT JOIN
        (
         SELECT u_order_line_id,SUM(commission_amount) AS commission_amount1 ,member_phone AS member_phone1 FROM mamahao_warehouse.t_star_member_sales_detail
         WHERE   sale_type IN(3,4,5,7) AND operate_type =1 AND refund_no IS NULL GROUP BY u_order_line_id) t1 ON t1.u_order_line_id = tmp_orderline.order_line_id
         LEFT JOIN
        (SELECT u_order_line_id,SUM(commission_amount) AS commission_amount2 ,member_phone AS member_phone2 FROM mamahao_warehouse.t_star_member_sales_detail
         WHERE   sale_type IN(6,8) AND operate_type =1 AND refund_no IS NULL GROUP BY u_order_line_id) t2  ON t2.u_order_line_id = tmp_orderline.order_line_id
        LEFT JOIN
        (SELECT
        gcs_shop.SUB_UNIT_NUM_ID,
        gcs_shop.source_type,
        gcs_shop.SUB_UNIT_NAME
        FROM
        mamahao_warehouse.gb_cort_sub_unit gcs_shop
        UNION
        ALL
        SELECT
        ware_house.STORAGE_NUM_ID,
        ware_house.source_type,
        ware_house.STORAGE_NAME
        FROM
        mamahao_warehouse.gb_storage ware_house) gcs_shop_server
        ON gcs_shop_server.SUB_UNIT_NUM_ID = staff_serve.`shop_id`


		LEFT JOIN
        (SELECT
        gcs_shop.SUB_UNIT_NUM_ID,
        gcs_shop.source_type,
        gcs_shop.SUB_UNIT_NAME
        FROM
        mamahao_warehouse.gb_cort_sub_unit gcs_shop
        UNION
        ALL
        SELECT
        ware_house.STORAGE_NUM_ID,
        ware_house.source_type,
        ware_house.STORAGE_NAME
        FROM
        mamahao_warehouse.gb_storage ware_house) gcs_shop_binding
        ON gcs_shop_binding.SUB_UNIT_NUM_ID = staff_binding.`shop_id` 


        WHERE
            tmp_refund.refund_status = 0
        AND tmp_refundpay.pay_type not IN(5,6,19,20)
        AND tmp_refundgoods.item_type IN(1 , 3)
        AND tmp_refundpay.create_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        GROUP BY
        tmp_refundgoods.id