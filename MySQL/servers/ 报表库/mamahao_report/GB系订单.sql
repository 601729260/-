     SELECT
        par.order_batch_no "批次号",
        case
        when torder.sub_type = 0 then "销售订单"
        when torder.sub_type = 1 then "拆单新单"
        when torder.sub_type = 2 then "换货新单"
        end AS "销售类型",
        torder.created_time "下单时间",
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
        torder.serial_number "交易号",
        torder.tml_num_id "好孩子单号",
        case
        when torder.serial_number is not NULL and torder.relation_type is null and torder.dealing_type  = 2 and torder.platform_source = 1 and torder.order_type = 1 and op.pay_type_id = 9 then "微信1263836101"
        when op.mch_id = '1264915301' THEN "微信1263836301"
        when op.mch_id = '1263836101' THEN "微信1263836101"
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
        END "支付方式",
        op.pay_price / 100 AS "订单实付金额（含运费）",
        FORMAT(ol.sub_pay_price / 100,2) AS "余额支付",
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
            CONCAT('',FORMAT(5 /100 * (ol.pay_price + ol.pay_mbean_price + ol.pay_mmh_coupon_price + op.pay_freight_price) / 100,2)) AS "服务费",
        CASE when tmp_orderfree.coupon_id is not null then 0 else op.pay_freight_price / 100 end AS "运费",
        torder.order_no AS "订单号",
        CASE torder.order_type
        WHEN torder.order_type = 1 THEN
        CASE
        WHEN torder.relation_type = 4 THEN "代拍订单"
        WHEN torder.dealing_type = 2 THEN
        "验货付款订单"
        ELSE "普通订单"
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
        when torder.platform_source = 1 and torder.order_type = 1 and torder.relation_type = 8 then "小程序"
        WHEN  torder.platform_source = 1 THEN "app订单"
        WHEN  torder.platform_source = 2 THEN "云订单"
        WHEN  torder.platform_source = 3 THEN "微商城订单"
        END AS "订单来源",
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
        shareItem.ITEM_NAME AS"商品名称",
        shareItem.BARCODE_1 AS "商品条码",
        shareItem.ITEMID AS"商品SKU",
        style.STYLE_NUM_ID AS"款式ID",
        style.STYLE_ID AS"款式编码",
        brand.b_name AS"品牌名称",
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
        "MPOS总仓发货"
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
        WHEN torder.warehouse_type in (4,5) THEN
        "妈妈好"
        END AS "所属分公司",
        gbd.div_name AS "事业部一级",
        division.div_name AS "事业部二级",
        ftype.gt_name AS"商品大类",
        ol.allocated_count AS"商品数量",
        FORMAT(ol.pay_unit_price / 100,2) AS"吊牌价",
        FORMAT(IFNULL(ol.pay_pmt_price,ol.pay_unit_price) / 100,2) AS"促销价",
        FORMAT(ol.pay_price / 100,2) AS"商品实付金额",
        FORMAT(ol.third_party_discount / 100,2) AS "支付优惠金额",
        FORMAT(IFNULL(ol.pmt_all_reduce_price,0) / 100,2) AS"满减金额",
        FORMAT(ol.pay_mbean_price / 100,2) AS"妈豆优惠",
        FORMAT(ol.pay_gb_price / 100,2) AS"GB妈豆优惠",
        FORMAT(ol.pay_mothercare_price / 100,2) AS"MC妈豆优惠",
        FORMAT(ol.pay_group_coupon_price / 100,2) AS "集团优惠券承担部分",
        FORMAT(ol.pay_mmh_coupon_price / 100,2) AS "妈妈好优惠券承担部分",
        voucher.voucher_name AS"优惠券名称",
        CASE
        WHEN op.pmt_purchase_type = 0 OR op.pmt_purchase_type IS  null THEN
        ""
        WHEN op.pmt_purchase_type = 1 THEN
        "新生儿优惠"
        WHEN op.pmt_purchase_type = 2 THEN
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

        IFNULL(promoter.`name`, staff_binding.staff_name) AS"导购员姓名",
        IFNULL(promoter.promoter_job_num,staff_binding.staff_work_number) AS "导购工号",
        IFNULL(promoter.mobile, staff_binding.staff_phone) AS "导购手机",
        IFNULL(shareOrg.`gb_cort_sub_unit_no` , gcs_shop_binding.SUB_UNIT_NUM_ID) AS "导购所在门店ID",
        IFNULL(shareOrg.`short_name`, gcs_shop_binding.SUB_UNIT_NAME) AS "导购所在门店",
        IFNULL(freeze.rate, percentage_record.calculate_ratio) AS "导购佣金比例",
        IFNULL(freeze.freeze_money / 100, percentage_record.binding_income) AS "导购佣金",


        auction.cps_name AS "经销商",
        auction.cps_sim_name AS "微信公众账号",
        CONCAT('',auction.cps_rate,'%') AS "微分销佣金比例",
        FORMAT(auction.cps_money / 100 ,2) AS "微分销佣金",
        CASE
        WHEN ext.mark_type IS NULL THEN "暂无"
        WHEN ext.mark_type = 1 THEN "CPS-代销"
        WHEN ext.mark_type = 2 THEN "CPS-经销"
        WHEN ext.mark_type = 3 THEN "CPS-赠品"
        WHEN ext.mark_type = 4 THEN "平台赠品"
        END AS "订单标记类型",
        case
        when torder.sub_type = 0 then "销售订单"
        when torder.sub_type = 1 then "拆单新单"
        when torder.sub_type = 2 then "换货新单"
        end AS "订单子类型",
        voucher.voucher_template_id  voucherTemplateId,
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
        end AS "优惠券承担方",
        t1.commission_amount1 "直属佣金",
        t1.member_phone1 "直属入账手机号",
        t2.commission_amount2 "间接佣金",
        t2.member_phone2 "间接入账手机号",
        torder.achievement_owner_name "业绩归属方"
        FROM
        mamahao_warehouse.t_order_line ol
        LEFT JOIN mamahao_warehouse.t_order torder ON torder.order_no = ol.order_no
        LEFT JOIN mamahao_warehouse.t_order_free tmp_orderfree on torder.order_no = tmp_orderfree.order_no
        LEFT JOIN mamahao_warehouse.t_order_pay AS op ON torder.order_no = op.order_no
        LEFT JOIN mamahao_warehouse.GB_CITY_AREA AS AREA ON area.CITY_AREA_NUM_ID = torder.county
        LEFT JOIN mamahao_warehouse.GB_PRV prv ON area.PRV_NUM_ID = prv.PRV_NUM_ID
        LEFT JOIN mamahao_warehouse.GB_CITY city ON area.CITY_NUM_ID = city.CITY_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_div gbdiv ON gbdiv.div_num_id = torder.company_id
        LEFT JOIN mamahao_warehouse.gb_share_item shareItem ON ol.good_item_id = shareItem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division division ON division.div_num_id = shareItem.RPT_DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_style style ON style.STYLE_NUM_ID = shareItem.STYLE_NUM_ID AND style.DIV_NUM_ID =
        shareItem.DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division gbd ON style.DIV_NUM_ID = gbd.div_num_id
        LEFT JOIN mamahao_warehouse.t_brand brand ON brand.b_id = style.BRAND_ID
        LEFT JOIN mamahao_warehouse.t_goods_type ftype ON ftype.gt_id = style.STYLE_CATELOG_FIRST
        LEFT JOIN mamahao_warehouse.t_goods_type goodstype ON goodstype.gt_id = style.STYLE_CATELOG_THIRD
        LEFT JOIN mamahao_warehouse.t_order par ON torder.parent_order_no = par.order_no
        LEFT JOIN mamahao_warehouse.t_order_coupon coupon ON coupon.order_line_id = ol.order_line_id
        LEFT JOIN mamahao_warehouse.t_voucher voucher ON coupon.coupon_id = voucher.voucher_id
        LEFT JOIN mamahao_warehouse.t_share_freeze freeze ON ol.order_line_id = freeze.order_line_id
        LEFT JOIN mamahao_warehouse.t_share_promoter promoter ON freeze.promoter_member_id = promoter.member_id
        LEFT JOIN mamahao_warehouse.t_share_org shareOrg ON promoter.service_id = shareOrg.org_id
        LEFT JOIN mamahao_warehouse.t_order_instead_auction auction ON auction.order_no = torder.order_no
        LEFT JOIN mamahao_warehouse.t_order_unit_ext ext ON torder.order_no = ext.order_no

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

        LEFT JOIN
        (SELECT
        percentage_record.order_no,
        CAST(percentage_record.order_line_id AS SIGNED) AS order_line_id,
        MAX(
        CASE
        WHEN percentage_record.staff_type IN(1,2,3,4)
        THEN percentage_record.staff_id
        ELSE ""
        END)  AS "binding_id",
        SUM(
        CASE
        WHEN percentage_record.staff_type IN(1,2,3,4)
        THEN percentage_record.income
        ELSE 0
        END) AS "binding_income",
        percentage_record.`calculate_ratio`

        FROM
        mamahao_warehouse.u_achievement_percentage_record percentage_record
        WHERE percentage_record.order_buy_type = 1
        GROUP BY percentage_record.order_no,percentage_record.order_line_id) percentage_record
        ON ol.order_no = percentage_record.order_no
        AND ol.order_line_id = percentage_record.order_line_id
        LEFT JOIN mamahao_warehouse.u_staff staff_binding
        ON percentage_record.binding_id = staff_binding.`staff_id`
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
        WHERE
        torder.order_no = ol.order_no
        and torder.dealing_type not in (4,5)
        and (
        #-- 所有正常状态 -->
        (torder.order_state IN (0, 4, 5, 6, 9) AND torder.order_type IN (1,2,6,9))
        OR
        #-- 取消状态，普通订单（被完全拆分）-->
        (torder.order_state = 2 and torder.split_flag = 2 and torder.dealing_type = 1)
        )
        AND torder.payment_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        AND (torder.relation_type IS NULL OR torder.relation_type != 4)


        # 4=gb系统同步的，5=mpos系统同步的
        AND torder.dealing_type  IN (1,2,3)
        #只需要 1:GB订单 2：mothercart订单
        AND torder.order_source IN(1,2)
        #过滤 3-不含扫码付订单
        AND torder.order_type NOT IN(3)

        GROUP BY ol.order_line_id
        UNION ALL


        SELECT
        parent.order_batch_no AS "批次号",
        CASE refundLine.refund_type
        WHEN 1 THEN
        "退货退款订单"
        WHEN 2 THEN
        "退款订单"
        WHEN 3 THEN
        "拆单退单"
        WHEN 4 THEN
        "换货退单"
        END AS "销售类型",

        refundLine.apply_time AS"下单时间",

        CASE
        WHEN refundLine.pay_status = 4 THEN
        CASE refundLine.sub_status
        WHEN 0 THEN "退款完成"
        WHEN 1 THEN "退款完成(未签收等待验货)"
        WHEN 2 THEN  "退款完成(已签收等待验货)"
        END
        ELSE "退款完成"
        END  AS "退款状态",
        IFNULL(refundLine.end_time,refundLine.refund_time) AS"支付时间",
        refundLine.refund_serial_number AS"交易号",
        refundLine.gb_back_tml_num_id AS"好孩子单号",
        case
        when torder.serial_number is not NULL and torder.relation_type is null and torder.dealing_type  = 2 and torder.platform_source = 1 and torder.order_type = 1 and op.pay_type_id = 9 then "微信1263836101"
        when op.mch_id = '1264915301' THEN "微信1263836301"
        when op.mch_id = '1263836101' THEN "微信1263836101"
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
        "银联-云闪付"
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
        CONCAT(
        '-',
        FORMAT(
        refundLine.refund_amount / 100,
        2
        )
        ) AS "订单实付金额(含运费)",
        CONCAT(
        '-',
        FORMAT(refundLine.member_card_price / 100,
        2
        )) AS "余额支付",
        prv.PRV_NAME AS"收货省",
        city.CITY_NAME AS"收货市",
        AREA.CITY_AREA_NAME AS"收货县/区",
        torder.address AS"具体地址",
        CASE
        WHEN op.pay_type_id IS NULL THEN
        CONCAT("-0","%")
        WHEN op.pay_type_id =0 THEN
        CONCAT("0.55","%")
        WHEN op.pay_type_id = 1 THEN
        CONCAT("0.6","%")
        WHEN op.pay_type_id = 2 THEN
        CONCAT("-0.6","%")
        WHEN op.pay_type_id = 3 THEN
        CONCAT("-0.6","%")
        WHEN op.pay_type_id = 4 THEN
        CONCAT("0.55","%")
        WHEN op.pay_type_id =5 THEN
        CONCAT("-0.6","%")
        WHEN op.pay_type_id =6 THEN
        CONCAT("0.55","%")
        WHEN op.pay_type_id =7 THEN
        CONCAT("-0.6","%")
        WHEN op.pay_type_id =8 THEN
        CONCAT("-0.6","%")
        WHEN op.pay_type_id =9 THEN
        CONCAT("-0.6","%")
        END "手续费比例",
    
            CASE
            WHEN op.pay_type_id IS NULL THEN
            CONCAT("-0","")
            WHEN op.pay_type_id =0 THEN
            CONCAT('-',FORMAT(0.55 /100 * refundLine.refund_amount/100,2),"")
            WHEN op.pay_type_id = 1 THEN
            CONCAT('-',FORMAT(0.6 /100 * refundLine.refund_amount/100,2),"")
            WHEN op.pay_type_id = 2 THEN
            CONCAT('-',FORMAT(0.6 /100* refundLine.refund_amount /100,2),"")
            WHEN op.pay_type_id = 3 THEN
            -0
            WHEN op.pay_type_id = 4 THEN
            CONCAT('-',FORMAT(0.55 /100 * refundLine.refund_amount/100,2),"")
            WHEN op.pay_type_id =5 THEN
            CONCAT('-',FORMAT(0.6 /100* refundLine.refund_amount /100,2),"")
            WHEN op.pay_type_id =6 THEN
            CONCAT('-',FORMAT(0.55 /100 * refundLine.refund_amount /100,2),"")
            WHEN op.pay_type_id =7 THEN
            -0
            WHEN op.pay_type_id =8 THEN
            CONCAT('-',FORMAT(0.6 /100 * refundLine.refund_amount /100,2),"")
            WHEN op.pay_type_id =9 THEN
            CONCAT('-',FORMAT(0.6 /100 * refundLine.refund_amount /100,2),"")
            END "手续费",
            CONCAT('-','5%') AS "服务费比例",
            CONCAT('-',FORMAT(5 /100 * 0,2)) AS "服务费",
        '-0.00' AS "运费",
        refundLine.refund_line_no "订单号",

        CASE torder.order_type
        WHEN 1 THEN
        CASE
        WHEN torder.relation_type = 4 THEN "代拍订单"
        WHEN torder.dealing_type = 2 THEN
        "验货付款订单"
        ELSE "普通订单"
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
        when torder.platform_source = 1 and torder.order_type = 1 and torder.relation_type = 8 then "小程序"
        WHEN  torder.platform_source = 1 THEN "app订单"
        WHEN  torder.platform_source = 2 THEN "云订单"
        WHEN  torder.platform_source = 3 THEN "微商城订单"
        END AS "订单来源",
        CASE refundLine.refund_way
        WHEN 1 THEN
        "门店上门取件退货"
        WHEN 2 THEN
        "自己送货到门退货"
        WHEN 3 THEN
        "快递上门取件退货"
        END AS"配送方式",
        '' AS "妈妈好配送人员姓名",
        '' AS "妈妈好配送人员所属试点城市",
        shareItem.ITEM_NAME AS"商品名称",
        shareItem.BARCODE_1 AS "商品条码",
        shareItem.ITEMID AS"商品SKU",
        style.STYLE_NUM_ID AS"款式ID",
        style.STYLE_ID AS "款式编码",
        brand.b_name AS"品牌名称",
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
        "MPOS总仓发货"
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
        WHEN torder.warehouse_type in (4,5) THEN
        "妈妈好"
        END AS "所属分公司",
        gbd.div_name AS "事业部一级",
        division.div_name AS "事业部二级",
        ftype.gt_name "商品大类",
        CONCAT(
        '-',
        FORMAT(
        refundLine.refund_goods_count,
        0
        )
        ) AS "数量",
        CONCAT(
        '-',
        FORMAT(tol.pay_unit_price / 100, 2)
        ) AS"吊牌价",
        CONCAT(
        '-',
        FORMAT(IFNULL(tol.pay_pmt_price,tol.pay_unit_price) / 100, 2)
        ) AS"促销价",
        CONCAT(
        '-',
        FORMAT(refundLine.refund_amount / 100, 2)
        ) AS"商品实付金额",
        CONCAT(
        '-',
        FORMAT(refundLine.third_party_price / 100, 2)
        ) AS "支付优惠金额",
        0 AS"满减金额",
        CONCAT(
        '-',
        FORMAT(refundLine.mbean_price / 100, 2)
        ) AS"妈豆优惠",
        CONCAT(
        '-',
        FORMAT(refundLine.gb_price / 100, 2)
        ) AS"GB妈豆优惠",
        CONCAT(
        '-',
        FORMAT(
        refundLine.mc_price / 100,
        2
        )
        ) AS "MC妈豆优惠",
        CONCAT(
        '-',
        FORMAT(
        refundLine.pay_group_coupon_price / 100,
        2
        )
        ) AS "集团优惠券承担部分",
        CONCAT(
        '-',
        FORMAT(
        refundLine.pay_mmh_coupon_price / 100,
        2
        )
        ) AS '妈妈好优惠券承担部分',
        voucher.voucher_name "优惠券名称",
        CASE
        WHEN op.pmt_purchase_type = 0 OR op.pmt_purchase_type IS  null THEN
        ""
        WHEN op.pmt_purchase_type = 1 THEN
        "新生儿优惠"
        WHEN op.pmt_purchase_type = 2 THEN
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

        IFNULL(promoter.`name`, staff_binding.staff_name) AS"导购员姓名",
        IFNULL(promoter.promoter_job_num,staff_binding.staff_work_number) AS "导购工号",
        IFNULL(promoter.mobile, staff_binding.staff_phone) AS "导购手机",
        IFNULL(shareOrg.`gb_cort_sub_unit_no` , gcs_shop_binding.SUB_UNIT_NUM_ID) AS "导购所在门店ID",
        IFNULL(shareOrg.`short_name`, gcs_shop_binding.SUB_UNIT_NAME) AS "导购所在门店",
        IFNULL(freeze.rate, percentage_record.calculate_ratio) AS "导购佣金比例",
        CONCAT( '-',IFNULL( freeze.freeze_money / 100   ,  percentage_record.binding_income)) AS "导购佣金",

        auction.cps_name AS "经销商",
        auction.cps_sim_name AS "微信公众账号",
        CONCAT('',auction.cps_rate,'%') AS "微分销佣金比例",
        FORMAT(auction.cps_money / 100 ,2) AS "微分销佣金",
        CASE
        WHEN ext.mark_type IS NULL THEN "暂无"
        WHEN ext.mark_type = 1 THEN "CPS-代销"
        WHEN ext.mark_type = 2 THEN "CPS-经销"
        WHEN ext.mark_type = 3 THEN "CPS-赠品"
        WHEN ext.mark_type = 4 THEN "平台赠品"
        END AS "订单标记类型",
        case
        when refundLine.refund_type = 3 then "拆单退单"
        when refundLine.refund_type = 4 then "换货退单"
        when refundLine.refund_type = 2 then "退款单"
        when refundLine.refund_type = 1 then "退货单"
        end
        AS "订单子类型",
        voucher.voucher_template_id  voucherTemplateId,
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
        end AS "优惠券承担方",
        t1.commission_amount1 "直属佣金",
        t1.member_phone1 "直属入账手机号",
        t2.commission_amount2 "间接佣金",
        t2.member_phone2 "间接入账手机号",
        torder.achievement_owner_name "业绩归属方"
        FROM
        mamahao_warehouse.t_refund_line AS refundLine
        LEFT JOIN mamahao_warehouse.t_order AS torder ON refundLine.order_no = torder.order_no
        LEFT JOIN mamahao_warehouse.t_order_line tol ON refundLine.real_order_line_id = tol.order_line_id
        LEFT JOIN mamahao_warehouse.t_order parent ON torder.parent_order_no = parent.order_no
        LEFT JOIN mamahao_warehouse.t_order_pay op ON torder.order_no = op.order_no
        LEFT JOIN mamahao_warehouse.gb_div ON torder.company_id = gb_div.DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.GB_CITY_AREA AS AREA ON area.CITY_AREA_NUM_ID = torder.county
        LEFT JOIN mamahao_warehouse.GB_PRV prv ON area.PRV_NUM_ID = prv.PRV_NUM_ID
        LEFT JOIN mamahao_warehouse.GB_CITY city ON area.CITY_NUM_ID = city.CITY_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_div gbdiv ON gbdiv.div_num_id = torder.company_id
        LEFT JOIN mamahao_warehouse.gb_share_item shareItem ON tol.good_item_id = shareItem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division division ON division.div_num_id = shareItem.RPT_DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_style style ON style.STYLE_NUM_ID = shareItem.STYLE_NUM_ID
        AND style.DIV_NUM_ID = shareItem.DIV_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division gbd ON style.DIV_NUM_ID = gbd.div_num_id
        LEFT JOIN mamahao_warehouse.t_brand brand ON brand.b_id = style.BRAND_ID
        LEFT JOIN mamahao_warehouse.t_goods_type ftype ON ftype.gt_id = style.STYLE_CATELOG_FIRST
        LEFT JOIN mamahao_warehouse.t_goods_type goodstype ON goodstype.gt_id = style.STYLE_CATELOG_THIRD
        LEFT JOIN mamahao_warehouse.t_order_transfer ttran ON torder.order_no = ttran.tr_order_no
        LEFT JOIN mamahao_warehouse.t_order_coupon coupon ON coupon.order_line_id = tol.order_line_id
        LEFT JOIN mamahao_warehouse.t_voucher voucher ON coupon.coupon_id = voucher.voucher_id
        LEFT JOIN mamahao_warehouse.t_share_freeze freeze ON tol.order_line_id = freeze.order_line_id
        LEFT JOIN mamahao_warehouse.t_share_promoter promoter ON freeze.promoter_member_id = promoter.member_id
        LEFT JOIN mamahao_warehouse.t_share_org shareOrg ON promoter.service_id = shareOrg.org_id
        LEFT JOIN mamahao_warehouse.t_order_instead_auction auction ON auction.order_no = torder.order_no
        LEFT JOIN mamahao_warehouse.t_order_unit_ext ext ON refundLine.order_no = ext.order_no


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

        LEFT JOIN
        (SELECT
        percentage_record.order_no,
        CAST(percentage_record.order_line_id AS SIGNED) AS order_line_id,
        MAX(
        CASE
        WHEN percentage_record.staff_type IN(1,2,3,4)
        THEN percentage_record.staff_id
        ELSE ""
        END)  AS "binding_id",
        SUM(
        CASE
        WHEN percentage_record.staff_type IN(1,2,3,4)
        THEN percentage_record.income
        ELSE 0
        END) AS "binding_income",
        percentage_record.`calculate_ratio`

        FROM
        mamahao_warehouse.u_achievement_percentage_record percentage_record
        WHERE percentage_record.order_buy_type = 2
        GROUP BY percentage_record.order_no,percentage_record.order_line_id) percentage_record
        ON refundLine.refund_line_no = percentage_record.order_no
        AND refundLine.real_order_line_id = percentage_record.order_line_id
        LEFT JOIN mamahao_warehouse.u_staff staff_binding
        ON percentage_record.binding_id = staff_binding.`staff_id`



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
        LEFT JOIN
        (#线上逆向
        SELECT
        order_line_id,
        SUM(commission_amount) AS commission_amount1,
        member_phone AS member_phone1
        FROM
        mamahao_warehouse.t_star_member_sales_detail
        WHERE sale_type IN (3, 4, 5, 7)
        AND operate_type = 2
        AND refund_no IS NOT NULL
        AND u_order_line_id IS NULL
        GROUP BY order_line_id) t1 ON t1.order_line_id = tol.order_line_id
        LEFT JOIN
        (SELECT
        order_line_id,
        SUM(commission_amount) AS commission_amount2,
        member_phone AS member_phone2
        FROM
        mamahao_warehouse.t_star_member_sales_detail
        WHERE sale_type IN (6, 8)
        AND operate_type = 2
        AND refund_no IS NOT NULL
        AND u_order_line_id IS NULL
        GROUP BY order_line_id) t2 ON t2.order_line_id = tol.order_line_id
        WHERE
        (
        (
        refundLine.pay_status = 4
        AND refundLine.refund_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        )
        or
        (
        refundLine.exchange_status in (7,8)
        AND refundLine.end_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'
        )
        )
        # 4=gb系统同步的，5=mpos系统同步的
        AND torder.dealing_type  IN (1,2,3)
        #只需要 1:GB订单 2：mothercart订单
        AND torder.order_source IN(1,2)
        #过滤 3-不含扫码付订单
        AND torder.order_type NOT IN(3)
        AND (torder.relation_type IS NULL OR torder.relation_type != 4)
        group by refundLine.refund_line_id;


