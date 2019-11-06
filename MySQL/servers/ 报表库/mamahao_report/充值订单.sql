# 明细

SELECT
        "充值单" AS "单据类型",
        tmp_order.order_no "单号",
        tmp_orderline.item_id "卡项ID",
        CASE tmp_orderline.card_type
        WHEN 0 THEN
        "储值卡"
        WHEN 1 THEN
        "次数卡"
        WHEN 2 THEN
        "时间卡"
        WHEN 3 THEN
        "综合卡"
        WHEN 4 THEN
        "赠送卡"
        END "卡项类型",
        tmp_orderline.item_name "卡项名称",
        CASE tmp_order.order_channel
        WHEN 1 THEN
        "MPOS"
        WHEN 2 THEN
        "APP"
        ELSE
        "无"
        END "充值方式",
	    CASE item_record.publish_owner
            WHEN 1 THEN
            "妈妈好"
            WHEN 2 THEN
            "winbb"
            WHEN 3 THEN
            "swinlove"
             WHEN 4 THEN
            "mothercare"
             WHEN 5 THEN
            "好孩子E家"
        END "发行方",
        CASE tmp_orderlinepay.pay_type
        WHEN 1 THEN
         CONCAT("支付宝",if(tmp_orderlinepay.pay_channel=1,"2118",""))
        WHEN 2 THEN
        CONCAT("微信",if(tmp_orderlinepay.pay_channel=1,"2118",tmp_orderlinepay.common_id))
        WHEN 3 THEN
        "银联-云闪付"
        WHEN 8 THEN
        "现金"
        WHEN 9 THEN
        "银行卡"
        WHEN 10 THEN
        "瑞祥卡"
        WHEN 15 THEN  "银联-苹果支付"
        WHEN  16 THEN "银联-华为支付"
        WHEN  17 THEN "银联-小米支付"
        WHEN 18 THEN  "银联-三星支付"
        END "付款方式",
        if(tmp_orderlinepay.pay_channel=1,tmp_order.pay_order_no ,"") "银联商务交易号",
        tmp_orderlinepay.pay_serial_number "流水号",
        tmp_orderlinepay.common_value / 100 "付款金额(元)",
        (SELECT
        IFNULL(SUM(common_value) / 100,0)
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (19)) AS "支付优惠金额",
        tmp_orderlinepay.pay_time "付款时间",
        tmp_orderline.emp_name "充值员工",tmp_order.s_id "门店ID",
        tmp_order.s_name "门店名称",
        "妈妈好" as "分公司"
        FROM
        mamahao_warehouse.u_order_Line tmp_orderline
        LEFT JOIN mamahao_warehouse.u_order_line_pay tmp_orderlinepay ON tmp_orderlinepay.order_line_id = tmp_orderline.order_line_id
        LEFT JOIN mamahao_warehouse.u_order tmp_order ON tmp_orderline.order_no = tmp_order.order_no
        LEFT JOIN mamahao_warehouse.u_card_item_record item_record ON item_record.order_no = tmp_order.order_no
        WHERE
        tmp_orderline.item_type = 2
        AND tmp_orderlinepay.pay_time >='2019-09-01 00:00:00'
        AND tmp_orderlinepay.pay_time  <='2019-09-30 23:59:59'
        AND tmp_order.order_state IN (0, 4, 5, 7)
        AND tmp_orderlinepay.payment_type = 0
        and tmp_orderlinepay.pay_type in (1,2,3,8,9,10,15,16,17,18)
        GROUP BY
        tmp_orderline.order_line_id
        union all
        SELECT
        "退卡单" AS "单据类型",
        tmp_refund.order_no "单号",
        tmp_refundgoods.item_id "卡项ID",
        (select item_name from mamahao_warehouse.u_order_line where item_type = 2 and item_id = tmp_refundgoods.item_id limit 1) as "卡项类型",
        tmp_refundgoods.item_name "卡项名称",
        "MPOS" AS "充值方式",
        CASE item_record.publish_owner
        WHEN 1 THEN
        "妈妈好"
        WHEN 2 THEN
        "winbb"
        WHEN 3 THEN
        "swinlove"
          WHEN 4 THEN
            "mothercare"
             WHEN 5 THEN
            "好孩子E家"
        END "发行方",
        CASE tmp_refundpay.pay_type
        WHEN 1 THEN
         CONCAT("支付宝",if(tmp_refundpay.pay_channel=1,"2118",""))
        WHEN 2 THEN
        CONCAT("微信",if(tmp_refundpay.pay_channel=1,"2118",tmp_refundpay.common_id))
        WHEN 3 THEN
        "银联-云闪付"
        WHEN 8 THEN
        "现金"
        WHEN 9 THEN
        "银行卡"
        WHEN 10 THEN
        "瑞祥卡"
         WHEN 15 THEN "银联-苹果支付"
        WHEN  16 THEN "银联-华为支付"
        WHEN  17 THEN "银联-小米支付"
        WHEN 18 THEN  "银联-三星支付"
        END "付款方式",
        if(tmp_refundpay.pay_channel=1,tmp_refundpay.pay_order_no ,"") "银联商务交易号",
        tmp_refundpay.pay_serial_number "流水号",
        - (
        tmp_refundpay.common_value / 100
        ) "付款金额(元)",
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
                    AND pay_type IN(19)
                )
            ELSE
                0
            END
         )  AS "支付优惠金额" ,
        tmp_refundpay.create_time "付款时间",
        "" as "充值员工" ,
        tmp_refund.s_id "门店ID",
        tmp_refund.s_name "门店名称",
        "妈妈好" as "分公司"
        FROM
        mamahao_warehouse.u_refund_basic tmp_refund
        LEFT JOIN mamahao_warehouse.u_refund_goods tmp_refundgoods ON tmp_refund.refund_no = tmp_refundgoods.refund_no
        LEFT JOIN mamahao_warehouse.u_refund_pay tmp_refundpay ON tmp_refund.refund_no = tmp_refundpay.refund_no
        LEFT JOIN (select DISTINCT publish_owner ,order_no from mamahao_warehouse.u_card_item_record  ) item_record ON item_record.order_no = tmp_refund.order_no
        WHERE
        mamahao_warehouse.tmp_refundgoods.item_type = 2
        AND tmp_refund.refund_status = 0
        AND tmp_refundpay.pay_type in (1,2,3,8,9,10,15,16,17,18)
        AND tmp_refundpay.create_time >= '2019-09-01 00:00:00'
        AND tmp_refundpay.create_time <='2019-09-30 23:59:59'；
				
				
				
				
#统计


SELECT
        tmp1.mmh_member_id AS "用户ID",
        member.`member_phone` AS "手机号",
        SUM(tmp1.item_unit_price) /100 AS "所选日期内充值累计",
        (serial_number.goods_pay + serial_number.service_pay) /100  AS '所选日期内消耗累计',
        serial_number.goods_pay /100  AS '所选日期商品消耗累计',
        serial_number.service_pay  /100  AS '所选日期服务消耗累计',
        item_detail.rest_value_sum  /100  AS "截止到统计时间内的用户账户余额"
        FROM mamahao_warehouse.u_order_line tmp1
        LEFT JOIN mamahao_warehouse.t_member member ON tmp1.`mmh_member_id` = member.`member_id`
        LEFT JOIN mamahao_warehouse.u_order order_temp ON tmp1.`order_no` = order_temp.`order_no`
        LEFT JOIN (
        SELECT serial_number.member_phone,
        SUM(CASE serial_number.pro_name WHEN '商品订单' THEN serial_number.bill_value ELSE 0 END) AS "goods_pay",
        SUM(CASE serial_number.pro_name WHEN '服务消费' THEN serial_number.bill_value ELSE 0 END) AS "service_pay"
        FROM mamahao_warehouse.u_card_serial_number serial_number
        WHERE serial_number.bill_time BETWEEN  CONCAT('2018-10-04', " 00:00:00")  AND CONCAT('2018-12-04', " 23:59:59")
        AND serial_number.bill_type IN (1,4)  AND serial_number.card_type = 0 GROUP BY serial_number.member_phone
        ) serial_number ON serial_number.`member_phone` = member.`member_phone`
        LEFT JOIN (
        SELECT
        tem_record.`member_phone`, SUM(rest_value) AS rest_value_sum
        FROM
        mamahao_warehouse.u_card_item_record tem_record
        RIGHT JOIN mamahao_warehouse.u_card_item_detail item_detail
        ON tem_record.`card_item_record_id` = item_detail.`card_item_record_id`
        WHERE tem_record.`card_item_type` = 0
        AND tem_record.`status` = 0
        GROUP BY tem_record.`member_phone`
        ) item_detail ON item_detail.`member_phone` = member.`member_phone`

        WHERE tmp1.item_type = 2
        AND tmp1.create_time BETWEEN  '2019-09-01 00:00:00'  AND '2019-09-30 23:59:59'

        AND order_temp.order_state IN (0,4,5,7)
        GROUP BY tmp1.mmh_member_id
				
				
				
				
	