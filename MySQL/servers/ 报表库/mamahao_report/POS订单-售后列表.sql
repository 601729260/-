  #pos退款，商品级别  导出的sql
        SELECT
        pos_refund_basic.pos_refund_order_no "app订单号",
        tmp_refund_goods.pos_refund_no "app退款单号",
        pos_refund_basic.pos_gb_back_tml_num_id "pos退款小票号",
        CASE
        WHEN torder.order_type = 3
        AND torder.relation_type = 3 THEN
        "特卖会"
        ELSE
        "门店扫码"
        END "订单来源",
        CASE pos_refund_basic.pos_refund_status
        WHEN - 1 THEN
        '作废'
        WHEN 1 THEN
        '等待退款中'
        WHEN 2 THEN
        '退款完成'
        END "退款状态",
        case
        when torder.serial_number is not NULL and torder.relation_type is null and torder.dealing_type  = 2 and torder.platform_source = 1 and torder.order_type = 1 and pos_refund_basic.pos_refund_pay_type_id = 9 then "微信1263836101"
        when torder.platform_source = 1 and torder.order_type = 1 and torder.relation_type = 8 then "微信1263836101"
        when pos_refund_basic.pos_refund_pay_type_id = 2 THEN "微信1263836101"
        when pos_refund_basic.pos_refund_pay_type_id = 9 THEN "微信1264915301"
        when pos_refund_basic.pos_refund_pay_type_id = 0 THEN "老支付宝"
        when pos_refund_basic.pos_refund_pay_type_id = 4 THEN "支付宝"
        when pos_refund_basic.pos_refund_pay_type_id = 7 THEN "代拍账户"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 1 THEN "银联-云闪付账户"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 5 THEN "微信公众号"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 3 THEN "妈妈好账户"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 11 THEN "储值卡"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 15 THEN "银联-苹果账户"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 16 THEN "银联-华为账户"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 17 THEN "银联-小米账户"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 18 THEN "银联-三星账户"
        end "支付账户",
        CASE
        WHEN pos_refund_basic.pos_refund_pay_type_id = 0 THEN
        "支付宝支付(v1.0)"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 1 THEN
        "银联-云闪付支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 2 THEN
        "微信支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 3 THEN
        "妈豆支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 4 THEN
        "支付宝支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 5 THEN
        "微信公众号支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 6 THEN
        "测试支付宝支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 7 THEN
        "代拍支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 8 THEN
        "测试微商城jsapi支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 9 THEN
        "微商城jsapi支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 11 THEN
        "充值余额"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 15 THEN "银联-苹果支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 16 THEN "银联-华为支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 17 THEN  "银联-小米支付"
        WHEN pos_refund_basic.pos_refund_pay_type_id = 18 THEN  "银联-三星支付"
        END "支付方式",
        CONCAT("-", FORMAT(tmp_refund_goods.refund_real_price / 100,2)) "退款金额(元)",
        pos_refund_basic.pos_refund_serial_number "交易流水号",
        pos_refund_basic.pos_refund_member_id "用户id",
        pos_refund_basic.pos_create_time "退款申请时间",
        pos_refund_basic.pos_pay_time "退款时间",- (IFNULL(tmp_refund_goods.refund_card_price,0)/100) as "余额支付",
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
        tmp_refund_goods.refund_goods_item_id "商品ITEM_NUM_ID",
        tmp_refund_goods.refund_goods_count AS "退款商品数量",
        CASE
        WHEN shareItem.ITEM_NAME IS NOT NULL THEN
        shareItem.ITEM_NAME
        ELSE
        tmp_item.item_name
        END AS "商品名称",

        CASE
        WHEN shareItem.BARCODE_1 IS NOT NULL THEN
        shareItem.BARCODE_1
        ELSE
        ''
        END AS "商品条码",

        CASE
        WHEN shareItem.ITEMID IS NOT NULL THEN
        shareItem.ITEMID
        ELSE
        tmp_item.item_id
        END AS "商品SKU",
        CASE
        WHEN style.STYLE_NUM_ID IS NOT NULL THEN
        style.STYLE_NUM_ID
        ELSE
        tmp_item.style_id
        END AS "款式ID",
        CASE
        WHEN style.STYLE_ID IS NOT NULL THEN
        style.STYLE_ID
        ELSE
        tmp_item.style_num_id
        END AS "款式编码",
        CASE
        WHEN brand.b_name IS NOT NULL THEN
        brand.b_name
        ELSE
        tmp_item.brand_name
        END AS "品牌名称",
        CASE
        WHEN ftype.gt_name IS NOT NULL THEN
        ftype.gt_name
        ELSE
        tmp_item.type_name1
        END AS "商品大类",
        gbd.div_name AS "事业部一级",
        division.div_name AS "事业部二级",
        FORMAT(tmp_refund_goods.refund_mbean_count / 100,2) AS"妈豆优惠",
        FORMAT(tmp_refund_goods.refund_gb_point_count / 100,2) AS"GB妈豆优惠",
        FORMAT(tmp_refund_goods.refund_mc_point_count / 2,2) AS"MC妈豆优惠",
        0  AS "集团优惠券承担部分",
        0 AS '妈妈好优惠券承担部分',
        "" AS"优惠券名称"
        FROM
        mamahao_warehouse.t_pos_refund_goods tmp_refund_goods
        LEFT JOIN mamahao_warehouse.t_pos_refund_basic pos_refund_basic ON tmp_refund_goods.pos_refund_no = pos_refund_basic.pos_refund_no # 商品
        LEFT JOIN mamahao_warehouse.gb_share_item shareItem ON tmp_refund_goods.refund_goods_item_id = shareItem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division division ON division.div_num_id = shareItem.RPT_DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_style style ON style.STYLE_NUM_ID = shareItem.STYLE_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division gbd ON style.DIV_NUM_ID = gbd.div_num_id
        LEFT JOIN mamahao_warehouse.t_brand brand ON brand.b_id = style.BRAND_ID
        LEFT JOIN mamahao_warehouse.t_goods_type ftype ON ftype.gt_id = style.STYLE_CATELOG_FIRST
        LEFT JOIN mamahao_warehouse.t_goods_type goodstype ON goodstype.gt_id = style.STYLE_CATELOG_THIRD
        LEFT JOIN mamahao_warehouse.tmp_item tmp_item ON tmp_item.item_num_id = tmp_refund_goods.refund_goods_item_id
        LEFT JOIN mamahao_warehouse.t_order torder ON pos_refund_basic.pos_refund_order_no = torder.order_no
        LEFT JOIN mamahao_warehouse.gb_div gbdiv ON gbdiv.div_num_id = torder.company_id # 导购
        LEFT JOIN mamahao_warehouse.t_member_relationship tmp1 ON tmp1.member_id = torder.member_id
        LEFT JOIN mamahao_warehouse.t_share_promoter tmp2 ON tmp1.promoter_member_id = tmp2.member_id
        LEFT JOIN mamahao_warehouse.t_share_org tmp3 ON tmp2.service_id = tmp3.org_id # 导购
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
        LEFT JOIN mamahao_warehouse.t_share_promoter tmp5 ON tmp4.promoter_member_id = tmp5.member_id
        LEFT JOIN mamahao_warehouse.t_share_org tmp6 ON tmp5.service_id = tmp6.org_id
        LEFT JOIN (
        SELECT
        rb.pos_refund_id,
        MAX(tmp4.create_time) AS "maxTime"
        FROM
        mamahao_warehouse.t_pos_refund_basic rb
        LEFT JOIN mamahao_warehouse.t_order torder ON rb.pos_refund_order_no = torder.order_no
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
        pos_create_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        and pos_refund_type = 1
        GROUP BY
        rb.pos_refund_id
        ) AS ttt ON ttt.pos_refund_id = pos_refund_basic.pos_refund_id
        AND tmp4.create_time = ttt.maxTime
        WHERE
        tmp_refund_goods.create_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        AND (
        torder.relation_type IS NULL
        OR torder.relation_type != 4
        )
        AND (
        tmp4.create_time IS NULL
        OR tmp4.create_time = ttt.maxTime
        )
        and pos_refund_basic.pos_refund_status = 2
        and pos_refund_basic.pos_refund_type = 1
        GROUP BY tmp_refund_goods.pos_refund_goods_id;