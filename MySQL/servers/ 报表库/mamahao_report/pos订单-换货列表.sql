SELECT
        tmp_ex_goods.pos_exchange_no "换货单号",
        tmp_ex_basic.source_tml_num "换货小票号",
        tmp_ex_basic.original_order_no "原APP订单号",
        tmp_ex_basic.serial_number "流水号",
        CASE tmp_ex_basic.pay_type_id
        WHEN 2 THEN
        "微信"
        WHEN 4 THEN
        "支付宝"
        WHEN 1 THEN
        "银联-云闪付支付"
        WHEN 15 THEN  "银联-苹果支付"
        WHEN  16 THEN "银联-华为支付"
        WHEN  17 THEN "银联-小米支付"
        WHEN 18 THEN  "银联-三星支付"
        END "支付类型",
        CASE tmp_ex_basic.pay_type_id
        WHEN 2 THEN
        "微信1263836101"
        WHEN 4 THEN
        "支付宝"
        WHEN 1 THEN
        "银联-云闪付账户"
        WHEN 15 THEN  "银联-苹果账户"
        WHEN  16 THEN "银联-华为账户"
        WHEN  17 THEN "银联-小米账户"
        WHEN 18 THEN  "银联-三星账户"
        END "支付账户",
        tmp_ex_basic.sid "发货体ID",
        tmp_ex_basic.sname "发货体名称",
        CASE tmp_ex_basic.stype
        WHEN 0 THEN
        "门店"
        WHEN 1 THEN
        "分仓"
        ELSE
        "总仓"
        END "发货类型",
        tmp_ex_goods.goods_item_id "商品ID",
        CASE tmp_ex_goods.old_goods_flag
        WHEN 0 THEN
        '新商品'
        WHEN 1 THEN
        '退回商品'
        END "商品类型",
        tmp_ex_goods.goods_count "商品数量",
        FORMAT(tmp_ex_goods.pay_price/100,2) "支付金额(元)",
        tmp_ex_basic.success_time "换货时间",
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
        gbdiv.div_name "所属分公司"
        FROM
        mamahao_warehouse.t_pos_exchange_goods tmp_ex_goods
        LEFT JOIN mamahao_warehouse.t_pos_exchange_basic tmp_ex_basic ON tmp_ex_goods.pos_exchange_no = tmp_ex_basic.pos_exchange_no
        LEFT JOIN mamahao_warehouse.gb_share_item shareItem ON tmp_ex_goods.goods_item_id = shareItem.ITEM_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division division ON division.div_num_id = shareItem.RPT_DIV_NUM_ID #商品一级事业部
        LEFT JOIN mamahao_warehouse.gb_style style ON style.STYLE_NUM_ID = shareItem.STYLE_NUM_ID
        LEFT JOIN mamahao_warehouse.gb_division gbd ON style.DIV_NUM_ID = gbd.div_num_id #商品二级事业部
        LEFT JOIN mamahao_warehouse.t_brand brand ON brand.b_id = style.BRAND_ID #商品品牌
        LEFT JOIN mamahao_warehouse.t_goods_type ftype ON ftype.gt_id = style.STYLE_CATELOG_FIRST #一级类目
        LEFT JOIN mamahao_warehouse.tmp_item tmp_item ON tmp_item.item_num_id = tmp_ex_goods.goods_item_id #临时商品
        LEFT JOIN mamahao_warehouse.t_order tmp_order on tmp_order.order_no = tmp_ex_basic.original_order_no
        LEFT JOIN mamahao_warehouse.gb_div gbdiv ON gbdiv.div_num_id = tmp_order.company_id
        WHERE
        tmp_ex_goods.old_goods_flag = 0 #被换商品
        AND tmp_ex_basic.exchange_status = 1 #换货成功
        AND tmp_ex_basic.serial_number IS NOT NULL #存在支付
        AND tmp_ex_basic.success_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'