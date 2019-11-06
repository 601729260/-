SELECT
        par.order_batch_no "批次号",
        CASE
        WHEN torder.sub_type = 0 THEN
        "销售订单"
        WHEN torder.sub_type = 1 THEN
        "拆单新单"
        WHEN torder.sub_type = 2 THEN
        "换货新单"
        END AS "销售类型",
        torder.created_time "下单时间",
        "线上" AS "下单渠道",
        CASE torder.order_state
        WHEN 0 THEN
        "已完成"
        WHEN 2 THEN
        "已取消"
        WHEN 4 THEN
        "待发货"
        WHEN 5 THEN
        "待收货 "
        WHEN 6 THEN
        "待评价"
        WHEN 9 THEN
        "标记退款退货"
        END AS "订单状态",
        torder.payment_time "支付时间",
        torder.serial_number "交易流水号",
        torder.tml_num_id "好孩子单号",
        CASE
        WHEN torder.serial_number IS NOT NULL
        AND torder.relation_type IS NULL
        AND torder.dealing_type = 2
        AND torder.platform_source = 1
        AND torder.order_type = 1
        AND op.pay_type_id = 9 THEN
        "微信1263836101"
        WHEN op.mch_id = '1264915301' THEN
        "微信1263836301"
        WHEN op.mch_id = '1263836101' THEN
        "微信1263836101"
        WHEN torder.platform_source = 1
        AND torder.order_type = 1
        AND torder.relation_type = 8 THEN
        "微信1263836101"
        WHEN op.pay_type_id = 2 THEN
        "微信1263836101"
        WHEN op.pay_type_id = 9 THEN
        "微信1264915301"
        WHEN op.pay_type_id = 0 THEN
        "老支付宝"
        WHEN op.pay_type_id = 4 THEN
        "支付宝"
        WHEN op.pay_type_id = 7 THEN
        "代拍账户"
        WHEN op.pay_type_id = 1 THEN
        "银联-云闪付账户"
        WHEN op.pay_type_id = 5 THEN
        "微信公众号"
        WHEN op.pay_type_id = 3 THEN
        "妈妈好账户"
        WHEN op.pay_type_id = 11 THEN
        "储值卡"
        WHEN op.pay_type_id = 15 THEN "银联-苹果账户"
        WHEN op.pay_type_id = 16 THEN "银联-华为账户"
        WHEN op.pay_type_id = 17 THEN "银联-小米账户"
        WHEN op.pay_type_id = 18 THEN "银联-三星账户"
        END "支付账户",
        CASE
        WHEN torder.serial_number IS NOT NULL
        AND torder.relation_type IS NULL
        AND torder.dealing_type = 2
        AND torder.platform_source = 1
        AND torder.order_type = 1
        AND op.pay_type_id = 9 THEN
        "微信1263836101"
        WHEN op.mch_id = '1264915301' THEN
        "微信1263836301"
        WHEN op.mch_id = '1263836101' THEN
        "微信1263836101"
        WHEN torder.platform_source = 1
        AND torder.order_type = 1
        AND torder.relation_type = 8 THEN
        "微信1263836101"
        WHEN op.pay_type_id = 2 THEN
        "微信1263836101"
        WHEN op.pay_type_id = 9 THEN
        "微信1264915301"
        WHEN op.pay_type_id = 0 THEN
        "支付宝支付(v1.0)"
        WHEN op.pay_type_id = 1 THEN
        "银联-云闪付支付"
        WHEN op.pay_type_id = 2 THEN
        "微信支付"
        WHEN op.pay_type_id = 3 THEN
        "妈豆支付"
        WHEN op.pay_type_id = 4 THEN
        "支付宝支付"
        WHEN op.pay_type_id = 5 THEN
        "微信公众号支付"
        WHEN op.pay_type_id = 6 THEN
        "测试支付宝支付"
        WHEN op.pay_type_id = 7 THEN
        "代拍支付"
        WHEN op.pay_type_id = 8 THEN
        "测试微商城jsapi支付"
        WHEN op.pay_type_id = 9 THEN
        "微商城jsapi支付"
        WHEN op.pay_type_id = 11 THEN
        "充值余额"
        WHEN op.pay_type_id = 15 THEN
        "银联-苹果支付"
        WHEN op.pay_type_id = 16 THEN
        "银联-华为支付"
        WHEN op.pay_type_id = 17 THEN
        "银联-小米支付"
        WHEN op.pay_type_id = 18 THEN
        "银联-三星支付"
        END "支付方式",
				IFNULL(ol.pay_unit_price / 100, 0) "吊牌价",
				IFNULL(ol.pay_pmt_price / 100.0, 0) "促销价",
				0 AS "议价金额",
				FORMAT((IFNULL(
        ol.pmt_all_reduce_price,0)  +IFNULL(ol.pmt_group_price,0))/ 100.0,2
        ) "满减金额",
				FORMAT(ol.sub_pay_price / 100, 2) AS "充值余额",
        ol.allocated_count AS "商品数量",
				CASE
        WHEN tmp_orderfree.coupon_id IS NOT NULL THEN
        0
        ELSE
        IFNULL(opr.pay_freight_price / 100,0)
        END AS "运费",
		    CASE
        WHEN tmp_orderfree.coupon_id IS NULL AND opr.pay_freight_price IS NOT NULL THEN
        FORMAT((ol.pay_price-pars.pay_freight_price_discount) / 100, 2)
        ELSE
        FORMAT(ol.pay_price / 100, 2)
        END AS "实付金额",	
	      CASE
        WHEN tmp_orderfree.coupon_id IS NULL AND opr.pay_freight_price IS NOT NULL THEN
        FORMAT((ol.third_party_discount +pars.pay_freight_price_discount) / 100,2)
        ELSE
        FORMAT(ol.third_party_discount / 100,2)
        END AS "支付优惠金额",
        IFNULL(ol.pay_mbean_price / 100.0, 0) "妈豆优惠", 			
        IFNULL(
        ol.pay_group_coupon_price / 100.0,
        0
        ) + IFNULL(
        ol.pay_mmh_coupon_price / 100,
        0
        ) "优惠券金额",
        voucher.voucher_template_id  voucherTemplateId,
        voucher.voucher_name AS "优惠券名称",       
        prv.PRV_NAME AS "收货省",
        city.CITY_NAME AS "收货市",
        AREA.CITY_AREA_NAME AS "收货县/区",
        torder.address AS "具体地址",			
        CASE
        WHEN op.pay_type_id IS NULL THEN
        CONCAT("0", "%")
        WHEN op.pay_type_id = 0 THEN
        CONCAT("0.55", "%")
        WHEN op.pay_type_id = 1 THEN
        CONCAT("0.6", "%")
        WHEN op.pay_type_id = 2 THEN
        CONCAT("0.6", "%")
        WHEN op.pay_type_id = 3 THEN
        CONCAT("0.6", "%")
        WHEN op.pay_type_id = 4 THEN
        CONCAT("0.55", "%")
        WHEN op.pay_type_id = 5 THEN
        CONCAT("0.6", "%")
        WHEN op.pay_type_id = 6 THEN
        CONCAT("0.55", "%")
        WHEN op.pay_type_id = 7 THEN
        CONCAT("0.6", "%")
        WHEN op.pay_type_id = 8 THEN
        CONCAT("0.6", "%")
        WHEN op.pay_type_id = 9 THEN
        CONCAT("0.6", "%")
        END "手续费比例",        
        torder.order_no AS "订单号", 
		       CASE torder.order_type
        WHEN torder.order_type = 1 THEN
        CASE
        WHEN torder.relation_type = 4 THEN
        "代拍订单"
        WHEN torder.dealing_type = 2 THEN
        "验货付款订单"
        ELSE
        "普通订单"
        END
        WHEN 2 THEN
        "妈豆订单"
        WHEN 3 THEN
        "扫码付订单"
        WHEN 4 THEN
        "门店扫码"
        WHEN 5 THEN
        "门店订单"
        WHEN 6 THEN
        "自采订单"
        WHEN 9 THEN
        "自采-预售订单"
        END AS "订单类型",	
        CASE
        WHEN torder.platform_source = 1
        AND torder.order_type = 1
        AND torder.relation_type = 8 THEN
        "小程序"
        WHEN torder.platform_source = 1 THEN
        "app订单"
        WHEN torder.platform_source = 2 THEN
        "云订单"
        WHEN torder.platform_source = 3 THEN
        "微商城订单"
        END AS "订单来源",			
	       CASE torder.delivery_way
        WHEN 1 THEN
        "妈妈好配送"
        WHEN 2 THEN
        "上门自提"
        WHEN 3 THEN
        "快递配送"
        END AS "配送方式",	
	      "" AS "妈妈好配送人员姓名",
        "" AS "妈妈好配送人员所属试点城市",
        shareItem.ITEM_NAME AS "商品名称",
        shareItem.BARCODE_1 AS "商品条码",
        shareItem.ITEMID AS "商品SKU",
        style.STYLE_NUM_ID AS "款式ID",
        style.STYLE_ID AS "款式编码",
        brand.b_name AS "品牌名称",
        CASE torder.warehouse_type
        WHEN 0 THEN
        "门店发货"
        WHEN 1 THEN
        "分仓发货"
        WHEN 2 THEN
        "总仓发货"
        WHEN 3 THEN
        "总仓发货"
        WHEN 4 THEN
        "MPOS门店发货"
        WHEN 5 THEN
        "MPOS总仓发货" "总仓发货"
        END AS "发货类型",
        CASE torder.warehouse_type
        WHEN 0 THEN
        torder.shop_name
        WHEN 1 THEN
        torder.warehouse_name
        WHEN 2 THEN
        torder.warehouse_name
        WHEN 3 THEN
        torder.warehouse_name
        WHEN 4 THEN
        torder.shop_name
        WHEN 5 THEN
        torder.warehouse_name
        END AS "发货方",
        CASE torder.warehouse_type
        WHEN 0 THEN
        torder.shop_id
        WHEN 1 THEN
        torder.warehouse_id
        WHEN 2 THEN
        torder.warehouse_id
        WHEN 3 THEN
        torder.warehouse_id
        WHEN 4 THEN
        torder.shop_id
        WHEN 5 THEN
        torder.warehouse_id
        END AS "门店/仓库编码",
        CASE
        WHEN torder.warehouse_type = 0 THEN
        gbdiv.div_name
        WHEN torder.warehouse_type = 1 THEN
        gbdiv.div_name
        WHEN torder.warehouse_type = 2 THEN
        ""
        WHEN torder.warehouse_type = 3 THEN
        gbdiv.div_name
        WHEN torder.warehouse_type IN (4, 5) THEN
        "妈妈好"
        END AS "所属分公司",
        gbd.div_name AS "事业部一级",
        division.div_name AS "事业部二级",
        CASE ftype.gt_name
        WHEN '服务' THEN
        '服务'
        ELSE
        '商品'
        END AS "商品类别",
        ftype.gt_name AS "一级类目",
        goods_type_sec.gt_name AS "二级类目",
        goodstype.gt_name AS "三级类目",
        CASE
        WHEN op.pmt_purchase_type = 0
        OR op.pmt_purchase_type IS NULL THEN
        ""
        WHEN op.pmt_purchase_type = 1 THEN
        "新生儿优惠"
        WHEN op.pmt_purchase_type = 2 THEN
        "每月福利"
        END AS "所属福利",
        CASE
        WHEN ext.mark_type IS NULL THEN
        "暂无"
        WHEN ext.mark_type = 1 THEN
        "CPS-代销"
        WHEN ext.mark_type = 2 THEN
        "CPS-经销"
        WHEN ext.mark_type = 3 THEN
        "CPS-赠品"
        WHEN ext.mark_type = 4 THEN
        "平台赠品"
        END AS "订单标记类型",
        CASE
        WHEN torder.sub_type = 0 THEN
        "销售订单"
        WHEN torder.sub_type = 1 THEN
        "拆单新单"
        WHEN torder.sub_type = 2 THEN
        "换货新单"
        END AS "订单子类型",
				
				    CASE coupon.coupon_cost
        WHEN 0 THEN
        "集团职能部门"
        WHEN 1 THEN
        "妈妈好承担"
        WHEN 2 THEN
        "发货单位承担"
        WHEN 3 THEN
        "Familyby GB事业部承担"
        WHEN 4 THEN
        "护理用品事业部承担"
        WHEN 5 THEN
        "婴儿服饰事业部承担"
        WHEN 6 THEN
        "国际代理事业部承担"
        WHEN 7 THEN
        "好孩子汽车座事业部承担"
        WHEN 8 THEN
        "家居棉纺品事业部承担"
        WHEN 9 THEN
        "Happydino事业部承担"
        WHEN 10 THEN
        "运动用品事业部承担"
        WHEN 11 THEN
        "Mothercare事业部承担"
        WHEN 12 THEN
        "好孩子童车事业部承担"
        WHEN 13 THEN
        "GBBU事业部"
        WHEN 14 THEN
        "LC事业部"
        END AS "优惠券承担方",
				
        FORMAT(
        item_ext.purchase_price / 100,
        2
        ) "采购进价",
        FORMAT(
        item_ext.purchase_price * ol.allocated_count / 100,
        2
        ) "采购进价总额",
        FORMAT(item_ext.cost_price / 100, 2) "门店成本价",
        FORMAT(
        item_ext.cost_price * ol.allocated_count / 100,
        2
        ) "门店成本价总额",
        staff_serve.staff_name AS "门店服务导购姓名",
        staff_serve.staff_work_number AS "门店服务导购工号",
        CASE
        WHEN percentage_record.serve_income IS NULL THEN
        0
        ELSE
        percentage_record.serve_income
        END AS "门店服务导购提成",
        staff_binding.staff_name AS "会员所属导购姓名",
        staff_binding.staff_work_number AS "会员所属导购工号",
        gcs_shop_binding.SUB_UNIT_NAME AS "导购所属门店名称",
        gcs_shop_binding.SUB_UNIT_NUM_ID AS "导购所属门店ID",
        CASE
        WHEN percentage_record.binding_income IS NULL THEN
        0
        ELSE
        percentage_record.binding_income
        END AS "导购佣金",
        t1.commission_amount1 "直属佣金",
        t1.member_phone1 "直属入账手机号",
        t2.commission_amount2 "间接佣金",
        t2.member_phone2 "间接入账手机号",
        torder.achievement_owner_name "业绩归属方",
				FORMAT(ol.vip_amount / 100, 2) AS "储值卡折扣金额",
				IFNULL(
        ol.pmt_buy_more_price / 100.0,
        0
        ) "多买",
         FORMAT(
        ol.pay_group_coupon_price / 100,
        2
        ) AS "集团优惠券承担部分",
        FORMAT(
        ol.pay_mmh_coupon_price / 100,
        2
        ) AS "妈妈好优惠券承担部分",
				op.pay_price / 100 AS "订单实付金额"
        FROM
        mamahao_warehouse.t_order_line ol
        INNER JOIN (
        SELECT
        *
        FROM
        mamahao_warehouse.t_order
        WHERE
        payment_time BETWEEN '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        # 4=gb系统同步的,5=mpos系统同步的
        AND dealing_type IN (1, 2, 3)
        #只需要 1:GB订单 2:mothercart订单
        AND order_source IN (3)
        #过滤 3-不含扫码付订单
        AND order_type NOT IN (3)
        ) torder ON torder.order_no = ol.order_no
        LEFT JOIN mamahao_warehouse.t_order_free tmp_orderfree ON torder.order_no = tmp_orderfree.order_no
        LEFT JOIN (
        SELECT
        tol.order_line_id,
        topa.*
        FROM
        mamahao_warehouse.t_order_pay topa
        INNER JOIN  mamahao_warehouse.t_order_line tol on tol.order_no = topa.order_no
        INNER JOIN mamahao_warehouse.t_order tor ON tol.order_no = tor.order_no
        where
        payment_time BETWEEN '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        # 4=gb系统同步的,5=mpos系统同步的
        AND tor.dealing_type IN (1, 2, 3)
        #只需要 1:GB订单 2:mothercart订单
        AND tor.order_source IN (3)
        #过滤 3-不含扫码付订单
        AND tor.order_type NOT IN (3)
        GROUP BY
        tor.order_no
        ) AS opr ON ol.order_line_id = opr.order_line_id
        LEFT JOIN mamahao_warehouse.t_order_pay AS op ON ol.order_no = op.order_no
        LEFT JOIN mamahao_warehouse.GB_CITY_AREA AS AREA ON area.CITY_AREA_NUM_ID = torder.county
        LEFT JOIN mamahao_warehouse.GB_PRV prv ON area.PRV_NUM_ID = prv.PRV_NUM_ID
        LEFT JOIN mamahao_warehouse.GB_CITY city ON area.CITY_NUM_ID = city.CITY_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_div gbdiv ON gbdiv.div_num_id = torder.company_id
        LEFT JOIN mamahao_warehouse.gb_share_item shareItem ON ol.good_item_id = shareItem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division division ON division.div_num_id = shareItem.RPT_DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_style style ON style.STYLE_NUM_ID = shareItem.STYLE_NUM_ID
        AND style.DIV_NUM_ID = shareItem.DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division gbd ON style.DIV_NUM_ID = gbd.div_num_id
        LEFT JOIN mamahao_warehouse.t_brand brand ON brand.b_id = style.BRAND_ID
        LEFT JOIN mamahao_warehouse.t_goods_type ftype ON ftype.gt_id = style.STYLE_CATELOG_FIRST
        LEFT JOIN mamahao_warehouse.t_goods_type goods_type_sec ON goods_type_sec.gt_id = style.STYLE_CATELOG_SEC
        LEFT JOIN mamahao_warehouse.t_goods_type goodstype ON goodstype.gt_id = style.STYLE_CATELOG_THIRD
        LEFT JOIN mamahao_warehouse.t_order par ON torder.parent_order_no = par.order_no
        LEFT JOIN mamahao_warehouse.t_order_batch_settlement pars ON par.order_batch_no = pars.batch_settlement_no
        LEFT JOIN mamahao_warehouse.t_order_coupon coupon ON coupon.order_line_id = ol.order_line_id
        LEFT JOIN mamahao_warehouse.t_voucher voucher ON coupon.coupon_id = voucher.voucher_id
        LEFT JOIN mamahao_warehouse.t_order_unit_ext ext ON torder.order_no = ext.order_no
        LEFT JOIN mamahao_warehouse.gb_share_item_ext item_ext ON ol.good_item_id = item_ext.ITEM_NUM_ID
        LEFT JOIN (
        SELECT
        pere.order_no,
        CAST(pere.order_line_id AS signed) AS order_line_id,
        max(
        CASE
        WHEN pere.staff_type = 1 THEN
        pere.staff_id
        ELSE
        ""
        END
        ) AS serve_id,
        sum(
        CASE
        WHEN pere.staff_type = 1 THEN
        pere.income
        ELSE
        0
        END
        ) AS serve_income,
        MAx(
        CASE
        WHEN pere.staff_type IN (2, 3, 4) THEN
        pere.staff_id
        ELSE
        ""
        END
        ) AS binding_id,
        sum(
        CASE
        WHEN pere.staff_type IN (2, 3, 4) THEN
        pere.income
        ELSE
        0
        END
        ) AS binding_income
        FROM
        mamahao_warehouse.u_achievement_percentage_record pere
        INNER JOIN mamahao_warehouse.t_order orderOne ON pere.order_no = orderOne.order_no
        WHERE
        pere.order_buy_type = 1
        AND orderOne.payment_time BETWEEN '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        # 4=gb系统同步的，5=mpos系统同步的
        AND orderOne.dealing_type IN (1, 2, 3)
        #只需要 1:GB订单 2:mothercart订单
        AND orderOne.order_source IN (3)
        #过滤 3-不含扫码付订单
        AND orderOne.order_type NOT IN (3)
        GROUP BY
        pere.order_no,
        pere.order_line_id
        ) percentage_record ON ol.order_no = percentage_record.order_no
        AND ol.order_line_id = percentage_record.order_line_id
        LEFT JOIN mamahao_warehouse.u_staff staff_serve ON percentage_record.serve_id = staff_serve.staff_id
        LEFT JOIN mamahao_warehouse.u_staff staff_binding ON percentage_record.binding_id = staff_binding.staff_id
        LEFT JOIN (
        SELECT
        gcs_shop.SUB_UNIT_NUM_ID,
        gcs_shop.source_type,
        gcs_shop.SUB_UNIT_NAME
        FROM
        mamahao_warehouse.gb_cort_sub_unit gcs_shop
        UNION ALL
        SELECT
        ware_house.STORAGE_NUM_ID,
        ware_house.source_type,
        ware_house.STORAGE_NAME
        FROM
        mamahao_warehouse.gb_storage ware_house
        ) gcs_shop_server ON gcs_shop_server.SUB_UNIT_NUM_ID = staff_serve.shop_id
        LEFT JOIN (
        SELECT
        gcs_shop.SUB_UNIT_NUM_ID,
        gcs_shop.source_type,
        gcs_shop.SUB_UNIT_NAME
        FROM
        mamahao_warehouse.gb_cort_sub_unit gcs_shop
        UNION ALL
        SELECT
        ware_house.STORAGE_NUM_ID,
        ware_house.source_type,
        ware_house.STORAGE_NAME
        FROM
        mamahao_warehouse.gb_storage ware_house
        ) gcs_shop_binding ON gcs_shop_binding.SUB_UNIT_NUM_ID = staff_binding.shop_id
        LEFT JOIN
        #线上正向
        (SELECT
        order_line_id,
        SUM(commission_amount) AS commission_amount1,
        member_phone AS member_phone1
        FROM
        mamahao_warehouse.t_star_member_sales_detail
        WHERE sale_type IN (3, 4, 5, 7)
        AND operate_type = 1
        AND refund_no IS NULL
        AND u_order_line_id IS NULL
        GROUP BY order_line_id) t1  ON t1.order_line_id = ol.order_line_id
        LEFT JOIN
        (SELECT
        order_line_id,
        SUM(commission_amount) AS commission_amount2,
        member_phone AS member_phone2
        FROM
        mamahao_warehouse.t_star_member_sales_detail
        WHERE sale_type IN (6, 8)
        AND operate_type = 1
        AND refund_no IS NULL
        AND u_order_line_id IS NULL
        GROUP BY order_line_id) t2
        ON t2.order_line_id = ol.order_line_id
        GROUP BY
        ol.order_line_id
