   SELECT
        par.order_batch_no "批次号",
        "销售订单" AS "销售类型",
        CASE
        WHEN torder.order_type = 3
        AND torder.relation_type = 3 THEN
        "特卖会"
        ELSE
        "门店扫码"
        END "订单来源",
        torder.created_time "下单时间",
        CASE torder.order_state
        WHEN 0 THEN
        "已完成"
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
        torder.serial_number "交易号",
        torder.tml_num_id "好孩子单号",
        case
        when torder.serial_number is not NULL and torder.relation_type is null and torder.dealing_type  = 2 and torder.platform_source = 1 and torder.order_type = 1 and op.pay_type_id = 9 then "微信1263836101"
        when torder.platform_source = 1 and torder.order_type = 1 and torder.relation_type = 8 then "微信1263836101"
        when op.pay_type_id = 2 THEN "微信1263836101"
        when op.pay_type_id = 9 THEN "微信1264915301"
        when op.pay_type_id = 0 THEN "老支付宝"
        when op.pay_type_id = 4 THEN "支付宝"
        when op.pay_type_id = 7 THEN "代拍账户"
        WHEN op.pay_type_id = 1 THEN "银联-云闪付账户"
        WHEN op.pay_type_id = 5 THEN "微信公众号"
        WHEN op.pay_type_id = 3 THEN "妈妈好账户"
        WHEN op.pay_type_id = 11 THEN "储值卡"
        WHEN op.pay_type_id = 15 THEN "银联-苹果账户"
        WHEN op.pay_type_id = 16 THEN "银联-华为账户"
        WHEN op.pay_type_id = 17 THEN "银联-小米账户"
        WHEN op.pay_type_id = 18 THEN "银联-三星账户"
        end "支付账户",
        CASE
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
        END "支付方式",FORMAT(ol.sub_pay_price / 100,2) AS "余额支付",
        op.pay_price / 100 AS "订单实付金额（含运费）",
        prv.PRV_NAME AS"收货省",
        city.CITY_NAME AS"收货市",
        AREA.CITY_AREA_NAME AS"收货县/区",
        torder.address AS"具体地址",
        CASE
        WHEN op.pay_type_id IS NULL THEN
        CONCAT("0","%")
        WHEN op.pay_type_id =0 THEN
        CONCAT("0.55","%")
        WHEN op.pay_type_id = 1 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id = 2 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id = 3 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id = 4 THEN
        CONCAT("0.55","%")
        WHEN op.pay_type_id =5 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id =6 THEN
        CONCAT("0.55","%")
        WHEN op.pay_type_id =7 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id =8 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id =9 THEN
        CONCAT("0.6","%")
        END "手续费比例",
        CASE
        WHEN op.pay_type_id IS NULL THEN
        CONCAT("0","%")
        WHEN op.pay_type_id =0 THEN
        CONCAT('',FORMAT(0.55 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id = 1 THEN
        CONCAT('',FORMAT(0.6 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id = 2 THEN
        CONCAT('',FORMAT(0.6 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id = 3 THEN
        0
        WHEN op.pay_type_id = 4 THEN
        CONCAT('',FORMAT(0.55 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id =5 THEN
        CONCAT('',FORMAT(0.6 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id =6 THEN
        CONCAT('',FORMAT(0.55 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id =7 THEN
        0
        WHEN op.pay_type_id =8 THEN
        CONCAT('',FORMAT(0.6 /100 * ol.pay_price /100,2),"")
        WHEN op.pay_type_id =9 THEN
        CONCAT('',FORMAT(0.6 /100 * ol.pay_price /100,2),"")
        END "手续费",
        CONCAT('5','%') AS "服务费比例",
        CONCAT('',FORMAT(5 /100 * (ol.pay_price + ol.pay_mbean_price+ol.pay_mmh_coupon_price) / 100,2)) AS "服务费",

        op.pay_freight_price / 100 AS "运费",
        torder.order_no AS "订单号",
        CASE torder.order_type
        WHEN 1 THEN
        "普通订单"
        WHEN 2 THEN
        "妈豆订单"
        WHEN 3 THEN
        "扫码付订单"
        WHEN 4 THEN
        "门店扫码"
        WHEN 5 THEN
        "门店订单"
        END AS "订单类型",
        CASE torder.delivery_way
        WHEN 1 THEN
        "妈妈好配送"
        WHEN 2 THEN
        "上门自提"
        WHEN 3 THEN
        "快递配送"
        END AS"配送方式",
        "" AS "妈妈好配送人员姓名",
        "" AS "妈妈好配送人员所属试点城市",
        IFNULL(shareItem.ITEM_NAME, tmp_item.item_name) AS "商品名称",
        IFNULL(shareItem.BARCODE_1, tmp_item.bar_code) AS "商品条码",
        IFNULL(shareItem.ITEMID, tmp_item.item_id) AS "商品SKU",
        IFNULL(style.STYLE_ID, tmp_item.style_id) AS "款式ID",
        IFNULL(style.STYLE_NUM_ID, tmp_item.style_num_id) AS "款式编码",
        IFNULL(brand.b_name, tmp_item.brand_name) AS "品牌名称",
        ftype.gt_name AS "商品大类",
        CASE torder.warehouse_type
        WHEN 0 THEN
        "门店发货"
        WHEN 1 THEN
        "分仓发货"
        WHEN 2 THEN
        "总仓发货"
        WHEN 3 THEN
        "总仓发货"
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
        END AS "所属分公司",
        IFNULL(gbd.div_name, tmp_item.DIV_NAME) AS "事业部一级",
        IFNULL(division.div_name, tmp_item.RPT_DIV_NAME) AS "事业部二级",
        ol.good_item_id AS "商品ITEM_NUM_ID",
        ol.allocated_count AS"商品数量",
        FORMAT(ol.pay_unit_price / 100,2) AS"市场价格",
        FORMAT(ol.pay_price / 100,2) AS"商品实付金额",
        FORMAT(ol.third_party_discount / 100,2) AS "支付优惠金额",
        FORMAT(ol.pay_mbean_price / 100,2) AS"妈豆优惠",
        FORMAT(ol.pay_gb_price / 100,2) AS"GB妈豆优惠",
        FORMAT(ol.pay_mothercare_price / 100,2) AS"MC妈豆优惠",
        FORMAT(ol.pay_group_coupon_price / 100,2) AS "集团优惠券承担部分",
        FORMAT(ol.pay_mmh_coupon_price / 100,2) AS '妈妈好优惠券承担部分',
        voucher.voucher_name AS"优惠券名称",
        CASE op.pmt_purchase_type
        WHEN 1 THEN
        "新生儿优惠"
        WHEN 2 THEN
        "每月福利"
        END AS "所属福利",
        tmp2.`name` AS "原始-导购员姓名",
        tmp2.promoter_job_num as "原始-导购工号",
        tmp2.mobile as "原始-导购手机",
        tmp3.`gb_cort_sub_unit_no` AS "原始-导购所在门店ID",
        tmp3.`short_name` AS "原始-导购所在门店",
        tmp5.`name` AS "临时-导购员姓名",
        tmp5.promoter_job_num as "临时-导购工号",
        tmp5.mobile as "临时-导购手机",
        tmp6.`gb_cort_sub_unit_no` AS "临时-导购所在门店ID",
        tmp6.`short_name` AS "临时-导购所在门店",
        promoter.`name` AS"导购员姓名",
        promoter.promoter_job_num as "导购工号",
        promoter.mobile as "导购手机",
        freeze.rate AS '导购佣金比例',
        FORMAT(freeze.freeze_money / 100,2) AS '导购佣金',
        case coupon.coupon_cost
        when  0 then "集团职能部门"
        when  1 then "妈妈好承担"
        when  2 then "发货单位承担"
        when  3 then "Familyby GB事业部承担"
        when  4 then "护理用品事业部承担"
        when  5 then "婴儿服饰事业部承担"
        when  6 then "国际代理事业部承担"
        when  7 then "好孩子汽车座事业部承担"
        when  8 then "家居棉纺品事业部承担"
        when  9 then "Happydino事业部承担"
        when  10 then "运动用品事业部承担"
        when  11 then "Mothercare事业部承担"
        when  12 then "好孩子童车事业部承担"
        when  13 then "GBBU事业部"
        when  14 then "LC事业部"
        end AS "优惠券承担方"
        FROM
        mamahao_warehouse.t_order_line ol
        LEFT JOIN mamahao_warehouse.t_order torder ON torder.order_no = ol.order_no
        LEFT JOIN mamahao_warehouse.t_order_pay AS op ON torder.order_no = op.order_no
        LEFT JOIN mamahao_warehouse.GB_CITY_AREA AS AREA ON area.CITY_AREA_NUM_ID = torder.county
        LEFT JOIN mamahao_warehouse.GB_PRV prv ON area.PRV_NUM_ID = prv.PRV_NUM_ID
        LEFT JOIN mamahao_warehouse.GB_CITY city ON area.CITY_NUM_ID = city.CITY_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_div gbdiv ON gbdiv.div_num_id = torder.company_id
        LEFT JOIN mamahao_warehouse.gb_share_item shareItem ON ol.good_item_id = shareItem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.tmp_item tmp_item ON tmp_item.item_num_id = ol.good_item_id
        LEFT JOIN mamahao_warehouse.gb_division division ON division.div_num_id = shareItem.RPT_DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_style style ON style.STYLE_NUM_ID = shareItem.STYLE_NUM_ID AND style.DIV_NUM_ID =
        shareItem.DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division gbd ON style.DIV_NUM_ID = gbd.div_num_id
        LEFT JOIN mamahao_warehouse.t_brand brand ON brand.b_id = style.BRAND_ID
        LEFT JOIN mamahao_warehouse.t_goods_type ftype ON ftype.gt_id = style.STYLE_CATELOG_FIRST
        LEFT JOIN mamahao_warehouse.t_goods_type goodstype ON goodstype.gt_id = style.STYLE_CATELOG_THIRD
        LEFT JOIN mamahao_warehouse.t_share_freeze freeze ON ol.order_line_id = freeze.order_line_id
        LEFT JOIN mamahao_warehouse.t_order par ON torder.parent_order_no = par.order_no
        LEFT JOIN mamahao_warehouse.t_order_coupon coupon ON coupon.order_line_id = ol.order_line_id
        LEFT JOIN mamahao_warehouse.t_voucher voucher ON coupon.coupon_id = voucher.voucher_id
        LEFT JOIN mamahao_warehouse.t_member_relationship tmr ON torder.member_id = tmr.member_id
        LEFT JOIN mamahao_warehouse.t_share_promoter promoter ON tmr.promoter_member_id = promoter.member_id


        #-- 长期的导购 -->
        LEFT JOIN  mamahao_warehouse.t_member_relationship tmp1 on tmp1.member_id = torder.member_id
        LEFT JOIN mamahao_warehouse.t_share_promoter tmp2 ON tmp1.promoter_member_id = tmp2.member_id
        LEFT JOIN mamahao_warehouse.t_share_org tmp3 ON tmp2.service_id = tmp3.org_id

        #-- 临时的导购，同一个用户+同一个门店+下单同一天+绑定在下单之前 -->
        LEFT JOIN  mamahao_warehouse.t_member_temp_relationship tmp4 on tmp4.member_id = torder.member_id
        and torder.shop_id = tmp4.shop_id
        and torder.created_time > tmp4.create_time
        and  DATE_FORMAT(torder.created_time,"%Y-%m-%d") = DATE_FORMAT(tmp4.create_time,"%Y-%m-%d")
        LEFT JOIN mamahao_warehouse.t_share_promoter tmp5 ON tmp4.promoter_member_id = tmp5.member_id
        LEFT JOIN mamahao_warehouse.t_share_org tmp6 ON tmp5.service_id = tmp6.org_id

        LEFT JOIN (
        SELECT
        ol.order_line_id,
        MAX(tmp4.create_time) AS "maxTime"
        FROM
        mamahao_warehouse.t_order_line ol
        LEFT JOIN mamahao_warehouse.t_order torder ON torder.order_no = ol.order_no
        LEFT JOIN mamahao_warehouse.t_member_temp_relationship tmp4 ON tmp4.member_id = torder.member_id
        AND torder.shop_id = tmp4.shop_id
        AND torder.created_time > tmp4.create_time
        AND DATE_FORMAT(
        torder.created_time,
        "%Y-%m-%d"
        ) = DATE_FORMAT(
        tmp4.create_time,
        "%Y-%m-%d"
        )
        WHERE
        torder.order_no = ol.order_no
        AND torder.order_state IN (0, 4, 5, 6, 9)
        AND torder.order_type = 3
        AND torder.payment_time BETWEEN '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        AND (
        torder.relation_type IS NULL
        OR torder.relation_type != 4
        )
        GROUP BY
        ol.order_line_id
        ) AS ttt ON ttt.order_line_id = ol.order_line_id AND ttt.maxTime = tmp4.create_time

        WHERE
        torder.order_no = ol.order_no
        AND torder.order_state IN (0, 4, 5, 6, 9)
        AND torder.order_type = 3
        AND torder.payment_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        AND (torder.relation_type IS NULL OR torder.relation_type != 4)
        AND (
        tmp4.create_time IS NULL
        OR tmp4.create_time = ttt.maxTime
        )
        GROUP BY
        ol.order_line_id;