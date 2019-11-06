drop table weibao_offline_order ;
create  table weibao_offline_order (批次号 varchar(64) ,
销售类型 varchar(64) ,	
下单时间 varchar(64) ,
下单渠道 varchar(64) ,
订单状态 varchar(64) ,
支付时间 varchar(64) ,
交易流水号 varchar(64) ,
好孩子单号 varchar(64) ,
支付账户 varchar(64) ,
支付方式 varchar(64) ,
吊牌价 varchar(64) ,
促销价 varchar(64) ,
议价金额 varchar(64) ,
满减金额 varchar(64) ,
充值余额 varchar(64) ,
商品数量 varchar(64) ,
运费 varchar(64) ,
实付金额 varchar(64) ,
支付优惠金额 varchar(64) ,
妈豆优惠 varchar(64) ,
优惠券金额 varchar(64) ,
voucherTemplateId varchar(64) ,
优惠券名称 varchar(64) ,
收货省 varchar(64) ,
收货市 varchar(64),
收货县区 varchar(64) ,
具体地址 varchar(64) ,
手续费比例 varchar(64) ,
订单号 varchar(64) ,
订单类型 varchar(64) ,
订单来源 varchar(64) ,
配送方式 varchar(64) ,
妈妈好配送人员姓名 varchar(64) ,
妈妈好配送人员所属试点城市 varchar(64) ,
商品名称 varchar(64) ,
商品条码 varchar(64) ,
商品SKU varchar(64) ,
款式ID varchar(64) ,
款式编码 varchar(64) ,
品牌名称 varchar(64) ,
发货类型 varchar(64) ,
发货方 varchar(64) ,
门店仓库编码 varchar(64) ,
所属分公司 varchar(64) ,
事业部一级 varchar(64) ,
事业部二级 varchar(64) ,
商品类别 varchar(64) ,
一级类目 varchar(64) ,
二级类目 varchar(64) ,
三级类目 varchar(64) ,
所属福利 varchar(64) ,
订单标记类型 varchar(64) ,
订单子类型 varchar(64) ,
优惠券承担方 varchar(64) ,
采购进价 varchar(64) ,
采购进价总额 varchar(64) ,
门店成本价 varchar(64) ,
门店成本价总额 varchar(64) ,
门店服务导购姓名 varchar(64) ,
门店服务导购工号 varchar(64) ,
门店服务导购提成 varchar(64) ,
会员所属导购姓名 varchar(64) ,
会员所属导购工号 varchar(64) ,
导购所属门店名称 varchar(64) ,
导购所属门店ID varchar(64) ,
导购佣金 varchar(64) ,
直属佣金 varchar(64) ,
直属入账手机号 varchar(64) ,
间接佣金 varchar(64) ,
间接入账手机号 varchar(64) ,
业绩归属方 varchar(64) ,
储值卡折扣金额 varchar(64) ,
多买 varchar(64) ,
集团优惠券承担部分 varchar(64) ,
妈妈好优惠券承担部分 varchar(64) ,
订单实付金额 varchar(64) ,
银联商务交易号 varchar(64) ,
门店ID varchar(64) ,
门店名称 varchar(64) ,
分公司 varchar(64) ,
商品类别2 varchar(64) ,
商品ID varchar(64) ,
商品事业部  varchar(64),
月份 varchar(64));

#delete from weibao_offline_order where 月份<=DATE_FORMAT(curdate(),'%Y%m');

DELIMITER //
CREATE PROCEDURE weibao_offline_order()
BEGIN
truncate table weibao_offline_order;
insert into weibao_offline_order 
SELECT
        tmp_order.order_no AS "批次号",
				"销售单" AS "销售类型",
				tmp_orderline.create_time "下单时间",
        "线下" AS "下单渠道",
	      CASE
        tmp_order.order_state
        WHEN 0
        THEN "已完成"
        WHEN 4
        THEN "待发货"
        WHEN 5
        THEN "待收货"
        WHEN 7
        THEN "待评价"
        END "订单状态",	
        tmp_orderlinepay.pay_time "支付时间",				
				tmp_orderlinepay.pay_serial_number "交易流水号",
				"" as "好孩子单号",
        CASE
        tmp_orderlinepay.pay_type
        WHEN 1
        THEN "支付宝"
        WHEN 2
        THEN CONCAT(
        "微信",
        if(tmp_orderlinepay.pay_channel=1,"2118",tmp_orderlinepay.common_id)
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
        END "支付账户",
        CASE
        tmp_orderlinepay.pay_type
        WHEN 1 THEN
        CONCAT("支付宝",if(tmp_orderlinepay.pay_channel=1,"2118",""))
        WHEN 2 THEN
        CONCAT("微信",if(tmp_orderlinepay.pay_channel=1,"2118",tmp_orderlinepay.common_id))
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
        WHEN 15 THEN "银联-苹果支付"
        WHEN  16 THEN "银联-华为支付"
        WHEN  17 THEN "银联-小米支付"
        WHEN 18 THEN  "银联-三星支付"
        ELSE "无效支付方式"
        END "支付方式",
        tmp_orderline.item_unit_price / 100 "吊牌价",
        IFNULL(
        tmp_orderline.act_price / 100,
        tmp_orderline.item_unit_price / 100
        ) "促销价",
        (SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (108)) "议价金额",
        (SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (104)) "满减金额",
        
        (SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (4)) "充值余额",
				tmp_orderline.item_count "商品数量",
				        "" AS "运费",
				case tmp_orderlinepay.pay_type
        when 4 then 0
        else
        tmp_orderline.payment_amount / 100 end as "实付金额",				
				(SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (19)) AS "支付优惠金额",
				(SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (6)) "妈豆优惠",
				(SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (5)) "优惠券金额",
				tvo.voucher_template_id voucherTemplateId,
        (select tv.voucher_name from mamahao_warehouse.t_voucher  tv  where tv.voucher_id in (
        select uolp.common_id from mamahao_warehouse.u_order_line_pay uolp
        where uolp.order_line_id = tmp_orderline.order_line_id and uolp.pay_type IN (5))
        limit 1
        ) AS "优惠券名称",
        "" AS "收货省",
        "" AS "收货市",
        "" AS "收货县区",
        "" AS "具体地址",
        "" AS "手续费比例",
        tmp_order.order_no "订单号",



        CASE
        tmp_order.order_type
        WHEN 1
        THEN "普通订单"
        WHEN 2
        THEN "APP充值单"
        WHEN 3
        THEN "并卡单"
        WHEN 4
        THEN "预售单"
        WHEN 5
        THEN "寄存单"
        END "订单类型",
				"" as "订单来源",
	      CASE
        tmp_order.delivery_way
        WHEN 1
        THEN "配送"
        WHEN 2
        THEN "自提"
        ELSE "快递"
        END "配送方式",			
				"" as "妈妈好配送人员姓名",
				"" as "妈妈好配送人员所属试点城市",				


        tmp_orderline.item_name "商品名称",
        tmp_gbshareitem.BARCODE_1 AS "商品条码",
        tmp_gbshareitem.ITEMID AS "商品SKU",
        tmp_gbstyle.STYLE_NUM_ID AS "款式ID",
        tmp_gbstyle.STYLE_ID AS "款式编码",
        tmp_brand.b_name AS "品牌名称",
        CASE tmp_order.s_type WHEN 1 THEN "门店" ELSE "仓库" END "发货类型",
        tmp_order.s_name "发货方",
        tmp_order.s_id "门店仓库编码",
        "妈妈好" AS "所属分公司",
        "妈妈好" AS "事业部一级",
        "唯宝" AS "事业部二级",
				CASE
        tmp_orderline.item_type
        WHEN 1
        THEN "服务"
        WHEN 2
        THEN "卡项"
        ELSE "商品"
        END "商品类别",
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


        item_ext.purchase_price / 100 AS "采购进价",
        item_ext.purchase_price * tmp_orderline.item_count / 100 AS "采购进价总额",
        item_ext.cost_price / 100 AS "门店成本价",
        item_ext.cost_price * tmp_orderline.item_count / 100 AS "门店成本价总额",
        staff_serve.staff_name
        AS "门店服务导购姓名",
        staff_serve.staff_work_number
        AS "门店服务导购工号",
        CASE
        WHEN percentage_record.serve_income IS NULL
        THEN 0
        ELSE percentage_record.serve_income
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
        ELSE percentage_record.binding_income
        END
        AS "导购佣金",
 
        t1.commission_amount1 "直属佣金",
        t1.member_phone1 "直属入账手机号",
        t2.commission_amount2 "间接佣金",
        t2.member_phone2 "间接入账手机号",
        tmp_order.s_name as "业绩归属方",
				0 AS "储值卡折扣金额",
        (SELECT
        SUM(common_value) / 100
        FROM
        mamahao_warehouse.u_order_line_pay
        WHERE order_line_id = tmp_orderline.order_line_id
        AND pay_type IN (109)) "多买",
		    0 AS "集团优惠券承担部分",
        0 AS "妈妈好优惠券承担部分",
				"" AS "订单实付金额",
				if(tmp_orderlinepay.pay_channel=1,tmp_order.pay_order_no ,"") "银联商务交易号",
			  tmp_order.s_id "门店ID",
        tmp_order.s_name "门店名称",
        "唯宝" AS "分公司",		
        tmp_goodstype.gt_name "商品类别2",		
        tmp_orderline.item_id "商品ID"	,
				"唯宝" AS "商品事业部",
				DATE_FORMAT(tmp_orderlinepay.pay_time,'%Y%m') as '月份'
        FROM
        mamahao_warehouse.u_order_line tmp_orderline
        LEFT JOIN mamahao_warehouse.u_order tmp_order
        ON tmp_order.order_no = tmp_orderline.order_no
        LEFT JOIN mamahao_warehouse.u_order_line_pay tmp_orderlinepay
        ON tmp_orderline.order_line_id = tmp_orderlinepay.order_line_id
        LEFT JOIN mamahao_warehouse.gb_share_item tmp_gbshareitem
        ON tmp_orderline.item_id = tmp_gbshareitem.ITEM_NUM_ID

        LEFT JOIN mamahao_warehouse.gb_style tmp_gbstyle
        ON tmp_gbshareitem.STYLE_NUM_ID = tmp_gbstyle.STYLE_NUM_ID
        LEFT JOIN mamahao_warehouse.t_goods_type tmp_goodstype
        ON tmp_goodstype.gt_id = tmp_gbstyle.STYLE_CATELOG_FIRST
        LEFT JOIN mamahao_warehouse.t_goods_type tmp_goodstype_sec
        ON tmp_goodstype_sec.gt_id = tmp_gbstyle.style_catelog_sec
        LEFT JOIN mamahao_warehouse.t_goods_type tmp_goodstype_third
        ON tmp_goodstype_third.gt_id = tmp_gbstyle.style_catelog_third
        LEFT JOIN mamahao_warehouse.t_brand tmp_brand
        ON tmp_brand.b_id = tmp_gbstyle.BRAND_ID

        LEFT JOIN mamahao_warehouse.gb_share_item_ext item_ext
        ON tmp_orderline.item_id = item_ext.ITEM_NUM_ID

        left join(
        SELECT
        uolp.order_line_id,tv.voucher_cost,tv.voucher_template_id
        FROM mamahao_warehouse.u_order_line_pay uolp
        LEFT JOIN mamahao_warehouse.t_voucher tv ON uolp.common_id=tv.voucher_id
        WHERE uolp.pay_type = 5
        AND uolp.pay_time BETWEEN  concat(DATE_ADD(DATE_ADD(curdate(),INTERVAL -1 month),interval -day(curdate())+1 day),' 00:00:00')  AND concat(DATE_FORMAT(last_day(curdate()),'%Y-%m-%d'),' 23:59:59')) tvo
        on  tmp_orderline.order_line_id = tvo.order_line_id


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
        WHERE percentage_record.order_buy_type = 1
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

        WHERE tmp_order.order_state IN (0, 4, 5, 7)
        AND tmp_orderlinepay.payment_type = 0
        AND tmp_orderlinepay.pay_type not IN(5,6)
        #移除商品类型为卡项的商品
        AND tmp_orderline.item_type IN(1,3)
        AND tmp_orderlinepay.pay_time  BETWEEN  concat(DATE_ADD(DATE_ADD(curdate(),INTERVAL -1 month),interval -day(curdate())+1 day),' 00:00:00')  AND concat(DATE_FORMAT(last_day(curdate()),'%Y-%m-%d'),' 23:59:59')
        GROUP BY tmp_orderline.order_line_id;
			
END //
	
DELIMITER;



call weibao_offline_order();


select 批次号,
销售类型,
下单时间,
下单渠道,
订单状态,
支付时间,
交易流水号,
好孩子单号,
支付账户,
支付方式,
吊牌价,
促销价,
议价金额,
满减金额,
充值余额,
商品数量,
运费,
实付金额,
支付优惠金额,
妈豆优惠,
优惠券金额,
voucherTemplateId,
优惠券名称,
收货省,
收货市,
收货县区,
具体地址,
手续费比例,
订单号,
订单类型,
订单来源,
配送方式,
妈妈好配送人员姓名,
妈妈好配送人员所属试点城市,
商品名称,
商品条码,
商品SKU,
款式ID,
款式编码,
品牌名称,
发货类型,
发货方,
门店仓库编码,
所属分公司,
事业部一级,
事业部二级,
商品类别,
一级类目,
二级类目,
三级类目,
所属福利,
订单标记类型,
订单子类型,
优惠券承担方,
采购进价,
采购进价总额,
门店成本价,
门店成本价总额,
门店服务导购姓名,
门店服务导购工号,
门店服务导购提成,
会员所属导购姓名,
会员所属导购工号,
导购所属门店名称,
导购所属门店ID,
导购佣金,
直属佣金,
直属入账手机号,
间接佣金,
间接入账手机号,
业绩归属方,
储值卡折扣金额,
多买,
集团优惠券承担部分,
妈妈好优惠券承担部分,
订单实付金额,
银联商务交易号,
门店ID,
门店名称,
分公司,
商品类别2,
商品ID,
商品事业部 
from weibao_offline_order ;	
				
				select now() from dual;
				
				select  concat(DATE_ADD(DATE_ADD(curdate(),INTERVAL -1 month),interval -day(curdate())+1 day),' 00:00:00') from dual;
				select DATE_FORMAT(curdate(),'%Y%m') from dual;
        select concat(DATE_ADD(curdate(),interval -day(curdate())+1 day),' 00:00:00') from dual;
				select concat(DATE_FORMAT(last_day(curdate()),'%Y-%m-%d'),' 23:59:59') from dual;
				
				
	
				select * from weibao_offline_order;
				
				
				
