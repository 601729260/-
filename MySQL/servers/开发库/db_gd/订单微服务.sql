
#############################
oparent.order_no "order_no_parent",
	oparent.order_batch_no "order_batch_no_parent",
	oparent.serial_number "serial_number_parent",
	oparent.order_state "order_state_parent",
	oparent.order_type "order_type_parent",
	oparent.relation_type "relation_type_parent",
	oparent.order_source "order_source_parent",
	oparent.parent_order_no "parent_order_no_parent",
	oparent.member_id "member_id_parent",
	oparent.member_name "member_name_parent",
	oparent.created_time "created_time_parent",
	oparent.modified_time "modified_time_parent",
	oparent.shop_id "shop_id_parent",
	oparent.shop_name "shop_name_parent",
	oparent.shop_province "shop_province_parent",
	oparent.shop_city "shop_city_parent",
	oparent.shop_county "shop_county_parent",
	oparent.company_id "company_id_parent",
	oparent.warehouse_type "warehouse_type_parent",
	oparent.warehouse_id "warehouse_id_parent",
	oparent.warehouse_name "warehouse_name_parent",
	oparent.address "address_parent",
	oparent.province "province_parent",
	oparent.city "city_parent",
	oparent.county "county_parent",
	oparent.dealing_type "dealing_type_parent",
	oparent.consignee_name "consignee_name_parent",
	oparent.consignee_phone "consignee_phone_parent",
	oparent.delivery_way "delivery_way_parent",
	oparent.delivery_time "delivery_time_parent",
	oparent.confirm_good_time "confirm_good_time_parent",
	oparent.delay_receipt_time "delay_receipt_time_parent",
	oparent.delay_receipt_day "delay_receipt_day_parent",
	oparent.payment_time "payment_time_parent",
	oparent.finish_time "finish_time_parent",
	oparent.cancel_time "cancel_time_parent",
	oparent.expire_time "expire_time_parent",
	oparent.invoice_type "invoice_type_parent",
	oparent.invoice_title "invoice_title_parent",
	oparent.remark "remark_parent",
	oparent.tml_num_id "tml_num_id_parent",
	oparent.virtual_store_id "virtual_store_id_parent",
	oparent.platform_source "platform_source_parent",
	oparent.pick_type "pick_type_parent",
	oparent.pick_shop_id "pick_shop_id_parent",
	oparent.refund_state "refund_state_parent",
	oparent.shift_status "shift_status_parent",
	opparent.pay_total_price "pay_total_price_parent",
	opparent.pay_price "pay_price_parent",
	opparent.pay_freight_price "pay_freight_price_parent",
	opparent.pay_shop_act_id "pay_shop_act_id_parent",
	opparent.pay_shop_act_price "pay_shop_act_price_parent",
	opparent.pay_coupon_price "pay_coupon_price_parent",
	opparent.pay_mbean_price "pay_mbean_price_parent",
	opparent.pay_mbean_count "pay_mbean_count_parent",
	opparent.pay_mothercare_price "pay_mothercare_price_parent",
	opparent.pay_mothercare_count "pay_mothercare_count_parent",
	opparent.pay_gb_price "pay_gb_price_parent",
	opparent.pay_gb_count "pay_gb_count_parent",
	opparent.get_integral "get_integral_parent",
	opparent.coupon_id "coupon_id_parent",
	opparent.pay_type_id "pay_type_id_parent",
	opparent.pay_account "pay_account_parent",
	opparent.pay_shop_price "pay_shop_price_parent",
	opparent.distribution_section "distribution_section_parent",
	opparent.pmt_all_reduce_price "pmt_all_reduce_price_parent",
	opparent.pmt_part_reduce_price "pmt_part_reduce_price_parent",
	opparent.pmt_group_price "pmt_group_price_parent",
	opparent.pmt_buy_more_price "pmt_buy_more_price_parent",
	opparent.pmt_sale_price "pmt_sale_price_parent",
	o.order_no,
	o.order_batch_no,
	o.serial_number,
	o.order_state,
	o.order_type,
	o.relation_type,
	o.order_source,
	o.parent_order_no,
	o.member_id,
	o.member_name,
	o.created_time,
	o.modified_time,
	o.shop_id,
	o.shop_name,
	o.shop_province,
	o.shop_city,
	o.shop_county,
	o.company_id,
	o.warehouse_type,
	o.warehouse_id,
	o.warehouse_name,
	o.address,
	o.province,
	o.city,
	o.county,
	o.dealing_type,
	o.consignee_name,
	o.consignee_phone,
	o.delivery_way,
	o.delivery_time,
	o.confirm_good_time,
	o.delay_receipt_time,
	o.delay_receipt_day,
	o.payment_time,
	o.finish_time,
	o.cancel_time,
	o.expire_time,
	o.invoice_type,
	o.invoice_title,
	o.remark,
	o.tml_num_id,
	o.virtual_store_id,
	o.platform_source,
	o.pick_type,
	o.pick_shop_id,
	o.refund_state,
	o.shift_status,
	op.pay_total_price,
	op.pay_price,
	op.pay_freight_price,
	op.pay_shop_act_id,
	op.pay_shop_act_price,
	op.pay_coupon_price,
	op.pay_mbean_price,
	op.pay_mbean_count,
	op.pay_mothercare_price,
	op.pay_mothercare_count,
	op.pay_gb_price,
	op.pay_gb_count,
	op.get_integral,
	op.coupon_id,
	op.pay_type_id,
	op.pay_account,
	op.pay_shop_price,
	op.distribution_section,
	op.pmt_all_reduce_price,
	op.pmt_part_reduce_price,
	op.pmt_group_price,
	op.pmt_buy_more_price,
	op.pmt_sale_price 
FROM
	t_order oparent
	INNER JOIN t_order_pay opparent ON oparent.order_no = opparent.order_no
	INNER JOIN t_order o ON oparent.order_no = o.parent_order_no
	INNER JOIN t_order_pay op ON o.order_no = op.order_no 
WHERE
	oparent.logic_relative_no = 10315032543
	AND oparent.order_batch_no IS NOT NULL ;
	
	
	
	############订货单##########################################
select * from t_order  limit 100;
select * from t_order_pay limit 100;
 SELECT * FROM t_order_distribution limit 100;
 SELECT * FROM t_order_line limit 100;
 
select * from t_order where order_no=10315036908   limit 100;
select * from t_order_pay where order_no=10315036908;



select * from t_order  t1 where delivery_way=1 and exists(select 1  from t_order_distribution t2 where t1.order_no=t2.order_no) limit 100;

	
select * from t_order where delivery_way=1 and order_no=11719338325 limit 100;
select * from db_gd_dev.t_order_pay t where order_no=11719338325 limit 100;
select * from t_order_distribution where order_no=11719338325 limit 100;
 SELECT * FROM t_order_line where order_no=11719338325 limit  100;
 
 
 ##############退货单################################
 
 SELECT * FROM t_refund_line rl limit 100;

  SELECT * FROM t_refund_line rl where refund_line_no=10420328279 limit 100;
	SELECT
	GST.DIV_NUM_ID AS divNumId,
	GST.ITEM_NUM_ID AS itemNumId,
	GST.ITEMID AS itemId,
	GST.STYLE_NUM_ID AS styleNumId,
	GS.STYLE_TITLE AS styleTitle,
	GS.STYLE_SMALL_TITLE AS styleSmallTitle,
	GS.STYLE_TITLE AS itemName,
	GS.BRAND_ID AS bandId,
	GST.ITEM_PIC AS itemPic,
	GST.STYLE_DESC AS itemDesc,
	GST.BARCODE_1 AS itemBarCode,
	GAC.COLOR_NAME AS colorName,
	GAS.SIZE_NAME AS sizeName,
	GST.COLOR_NAME AS colorName1,
	GST.SIZE_NAME AS sizeName1,
	GST.ITEM_PIC AS pic,
	GS.STYLE_ID AS styleId,
	GS.STYLE_CATELOG_FIRST AS firstType,
	GS.STYLE_CATELOG_SEC AS secType,
	GS.STYLE_CATELOG_THIRD AS goodsType,
	GST.RPT_DIV_NUM_ID AS rptDivNumId,
	GS.IS_NOT_SALE AS isNotSale,
	GST.PACKAGE_SIGN AS packageSign,
	GS.self_goods AS selfGoods 
FROM
	GB_SHARE_ITEM GST
	LEFT JOIN GB_STYLE GS ON GST.STYLE_NUM_ID = GS.STYLE_NUM_ID
	LEFT JOIN GB_APPAREL_COLOUR GAC ON GST.COLOR_NUM_ID = GAC.COLOR_NUM_ID
	LEFT JOIN GB_APPAREL_SIZE GAS ON GST.SIZE_NUM_ID = GAS.SIZE_NUM_ID 
	AND GAS.DIV_NUM_ID = GST.DIV_NUM_ID 
WHERE
	GST.ITEM_NUM_ID = 809029
	LIMIT 1


####################获取退款明细###############################

SELECT rl.* FROM t_refund_line rl WHERE 1 = 1 and rl.refund_line_no = 10420328279 order by rl.refund_line_id DESC LIMIT 1 

select * from t_refund_line where order_no=11427670000;

SELECT
	tmp1.order_no "orderNo",
	tmp_mem.member_id "memberId",
	tmp_mem.member_phone "memberPhone",
	tmp1.shop_id "shopId",
	tmp1.warehouse_id "warehouseId",
	tmp_dis.area_id "areaId",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.ONLINE_SUB_UNIT_NAME ELSE tmp_stor.STORAGE_NAME 
	END "platformName",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.TELEPHONE ELSE tmp_stor.TELEPHONE 
	END "platformTel",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.ADR ELSE tmp_stor.ADR 
	END "platformAddr",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.MAPLOCATION_X ELSE tmp_stor.MAPLOCATION_X 
	END "platformLng",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.MAPLOCATION_Y ELSE tmp_stor.MAPLOCATION_Y 
	END "platformLat",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		concat( '工作日 ', tmp_sub.BEGIN_OPEN_HOURS, '-', tmp_sub.END_OPEN_HOURS, ' ', '节假日 ', tmp_sub.HD_BG_OPEN_HOURS, '-', tmp_sub.HD_ED_OPEN_HOURS ) ELSE NULL 
	END "platformBizTime",
	tmp_dis.receiver_name "userName",
	tmp_dis.phone_num "userPhone",
	tmp1.address "userAddr",
	tmp_dis.lng "userLng",
	tmp_dis.lat "userLat",
	tmp1.invoice_type "invoiceType",
	tmp1.invoice_title "invoiceTitle" 
FROM
	t_order tmp1
	LEFT JOIN t_ebiz_user tmp_mem ON tmp_mem.member_id = tmp1.member_id
	LEFT JOIN t_order_distribution tmp_dis ON tmp_dis.order_no = tmp1.order_no
	LEFT JOIN gb_cort_sub_unit tmp_sub ON tmp_sub.SUB_UNIT_NUM_ID = tmp1.shop_id
	LEFT JOIN gb_storage tmp_stor ON tmp_stor.STORAGE_NUM_ID = tmp1.warehouse_id 
WHERE
	tmp1.order_no = 11427670000;
	
	
	SELECT
	tmp1.order_no "orderNo",
	tmp_mem.member_id "memberId",
	tmp_mem.member_phone "memberPhone",
	tmp1.shop_id "shopId",
	tmp1.warehouse_id "warehouseId",
	tmp_dis.area_id "areaId",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.ONLINE_SUB_UNIT_NAME ELSE tmp_stor.STORAGE_NAME 
	END "platformName",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.TELEPHONE ELSE tmp_stor.TELEPHONE 
	END "platformTel",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.ADR ELSE tmp_stor.ADR 
	END "platformAddr",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.MAPLOCATION_X ELSE tmp_stor.MAPLOCATION_X 
	END "platformLng",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		tmp_sub.MAPLOCATION_Y ELSE tmp_stor.MAPLOCATION_Y 
	END "platformLat",
CASE
		
		WHEN tmp1.shop_id IS NOT NULL THEN
		concat( '工作日 ', tmp_sub.BEGIN_OPEN_HOURS, '-', tmp_sub.END_OPEN_HOURS, ' ', '节假日 ', tmp_sub.HD_BG_OPEN_HOURS, '-', tmp_sub.HD_ED_OPEN_HOURS ) ELSE NULL 
	END "platformBizTime",
	tmp_dis.receiver_name "userName",
	tmp_dis.phone_num "userPhone",
	tmp1.address "userAddr",
	tmp_dis.lng "userLng",
	tmp_dis.lat "userLat",
	tmp1.invoice_type "invoiceType",
	tmp1.invoice_title "invoiceTitle" 
FROM
	t_order tmp1
	LEFT JOIN t_ebiz_user tmp_mem ON tmp_mem.member_id = tmp1.member_id
	LEFT JOIN t_order_distribution tmp_dis ON tmp_dis.order_no = tmp1.order_no
	LEFT JOIN gb_cort_sub_unit tmp_sub ON tmp_sub.SUB_UNIT_NUM_ID = tmp1.shop_id
	LEFT JOIN gb_storage tmp_stor ON tmp_stor.STORAGE_NUM_ID = tmp1.warehouse_id 
WHERE
	tmp_dis.phone_num is not null
	and tmp_dis.area_id is not null limit 100;
	
	
	select * from t_refund_line where order_no in (
	select tmp1.order_no 
	FROM
	t_order tmp1
	LEFT JOIN t_ebiz_user tmp_mem ON tmp_mem.member_id = tmp1.member_id
	LEFT JOIN t_order_distribution tmp_dis ON tmp_dis.order_no = tmp1.order_no
	LEFT JOIN gb_cort_sub_unit tmp_sub ON tmp_sub.SUB_UNIT_NUM_ID = tmp1.shop_id
	LEFT JOIN gb_storage tmp_stor ON tmp_stor.STORAGE_NUM_ID = tmp1.warehouse_id 
WHERE
	tmp_dis.phone_num is not null
	and tmp_dis.area_id is not null ) limit 100;
	
	
	
	#################queryEmployeeSimpleInfo###########################
	 select
        employeeen0_.emp_id as emp_id1_2_0_,
        employeeen0_.emp_create_time as emp_crea2_2_0_,
        employeeen0_.emp_head_pic as emp_head3_2_0_,
        employeeen0_.emp_last_login_time as emp_last4_2_0_,
        employeeen0_.emp_last_off_duty_time as emp_last5_2_0_,
        employeeen0_.emp_last_on_duty_time as emp_last6_2_0_,
        employeeen0_.emp_level as emp_leve7_2_0_,
        employeeen0_.emp_lock_state as emp_lock8_2_0_,
        employeeen0_.emp_login_name as emp_logi9_2_0_,
        employeeen0_.emp_login_pwd as emp_log10_2_0_,
        employeeen0_.emp_name as emp_nam11_2_0_,
        employeeen0_.emp_phone as emp_pho12_2_0_,
        employeeen0_.emp_update_time as emp_upd13_2_0_,
        employeeen0_.emp_work_state as emp_wor14_2_0_,
        services1_.emp_id as emp_id6_4_1_,
        services1_.emp_service_id as emp_serv1_4_1_,
        services1_.emp_service_id as emp_serv1_4_2_,
        services1_.scs_id as scs_id5_4_2_,
        services1_.create_time as create_t2_4_2_,
        services1_.emp_id as emp_id6_4_2_,
        services1_.service_type as service_3_4_2_,
        services1_.update_time as update_t4_4_2_,
        cityentity2_.scs_id as scs_id1_8_3_,
        cityentity2_.city_id as city_id2_8_3_,
        cityentity2_.city_name as city_nam3_8_3_,
        cityentity2_.create_time as create_t4_8_3_,
        cityentity2_.sps_id as sps_id8_8_3_,
        cityentity2_.service_type as service_5_8_3_,
        cityentity2_.status as status6_8_3_,
        cityentity2_.update_time as update_t7_8_3_ 
    from
        t_dispatch_employee employeeen0_ 
    left outer join
        t_dispatch_employee_service services1_ 
            on employeeen0_.emp_id=services1_.emp_id 
    left outer join
        t_dispatch_service_city_suport cityentity2_ 
            on services1_.scs_id=cityentity2_.scs_id  limit 100;
	
	 select
        employeeen0_.emp_id as emp_id1_2_0_,
        employeeen0_.emp_create_time as emp_crea2_2_0_,
        employeeen0_.emp_head_pic as emp_head3_2_0_,
        employeeen0_.emp_last_login_time as emp_last4_2_0_,
        employeeen0_.emp_last_off_duty_time as emp_last5_2_0_,
        employeeen0_.emp_last_on_duty_time as emp_last6_2_0_,
        employeeen0_.emp_level as emp_leve7_2_0_,
        employeeen0_.emp_lock_state as emp_lock8_2_0_,
        employeeen0_.emp_login_name as emp_logi9_2_0_,
        employeeen0_.emp_login_pwd as emp_log10_2_0_,
        employeeen0_.emp_name as emp_nam11_2_0_,
        employeeen0_.emp_phone as emp_pho12_2_0_,
        employeeen0_.emp_update_time as emp_upd13_2_0_,
        employeeen0_.emp_work_state as emp_wor14_2_0_,
        services1_.emp_id as emp_id6_4_1_,
        services1_.emp_service_id as emp_serv1_4_1_,
        services1_.emp_service_id as emp_serv1_4_2_,
        services1_.scs_id as scs_id5_4_2_,
        services1_.create_time as create_t2_4_2_,
        services1_.emp_id as emp_id6_4_2_,
        services1_.service_type as service_3_4_2_,
        services1_.update_time as update_t4_4_2_,
        cityentity2_.scs_id as scs_id1_8_3_,
        cityentity2_.city_id as city_id2_8_3_,
        cityentity2_.city_name as city_nam3_8_3_,
        cityentity2_.create_time as create_t4_8_3_,
        cityentity2_.sps_id as sps_id8_8_3_,
        cityentity2_.service_type as service_5_8_3_,
        cityentity2_.status as status6_8_3_,
        cityentity2_.update_time as update_t7_8_3_ 
    from
        t_dispatch_employee employeeen0_ 
    left outer join
        t_dispatch_employee_service services1_ 
            on employeeen0_.emp_id=services1_.emp_id 
    left outer join
        t_dispatch_service_city_suport cityentity2_ 
            on services1_.scs_id=cityentity2_.scs_id 
    where
        employeeen0_.emp_id=1000104;
				
				
	######################queryEmployeeFullInfoByLoginName#################			
				
 select
        employeeen0_.emp_id as emp_id1_2_,
        employeeen0_.emp_create_time as emp_crea2_2_,
        employeeen0_.emp_head_pic as emp_head3_2_,
        employeeen0_.emp_last_login_time as emp_last4_2_,
        employeeen0_.emp_last_off_duty_time as emp_last5_2_,
        employeeen0_.emp_last_on_duty_time as emp_last6_2_,
        employeeen0_.emp_level as emp_leve7_2_,
        employeeen0_.emp_lock_state as emp_lock8_2_,
        employeeen0_.emp_login_name as emp_logi9_2_,
        employeeen0_.emp_login_pwd as emp_log10_2_,
        employeeen0_.emp_name as emp_nam11_2_,
        employeeen0_.emp_phone as emp_pho12_2_,
        employeeen0_.emp_update_time as emp_upd13_2_,
        employeeen0_.emp_work_state as emp_wor14_2_ 
    from
        t_dispatch_employee employeeen0_ 
    where
        employeeen0_.emp_login_name=?
Hibernate: 
    select
        employeeen0_.emp_id as emp_id1_2_,
        employeeen0_.emp_create_time as emp_crea2_2_,
        employeeen0_.emp_head_pic as emp_head3_2_,
        employeeen0_.emp_last_login_time as emp_last4_2_,
        employeeen0_.emp_last_off_duty_time as emp_last5_2_,
        employeeen0_.emp_last_on_duty_time as emp_last6_2_,
        employeeen0_.emp_level as emp_leve7_2_,
        employeeen0_.emp_lock_state as emp_lock8_2_,
        employeeen0_.emp_login_name as emp_logi9_2_,
        employeeen0_.emp_login_pwd as emp_log10_2_,
        employeeen0_.emp_name as emp_nam11_2_,
        employeeen0_.emp_phone as emp_pho12_2_,
        employeeen0_.emp_update_time as emp_upd13_2_,
        employeeen0_.emp_work_state as emp_wor14_2_ 
    from
        t_dispatch_employee employeeen0_ 
    where
        employeeen0_.emp_login_name=?

##############################queryEmployeeWorkload######################
select UNIX_TIMESTAMP() from dual;


   select
        dispatchen0_.disp_type as col_0_0_,
        dispatchen0_.disp_sub_type as col_1_0_,
        sum(case 
            when (dispatchen0_.disp_state in (2 ,
            3 ,
            4)) 
            and (date_format(dispatchen0_.disp_create_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=1 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (2 ,
            3 ,
            4)) 
            and (date_format(dispatchen0_.disp_create_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=2 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (2 ,
            3 ,
            4)) 
            and (date_format(dispatchen0_.disp_create_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=3 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (2 ,
            3 ,
            4)) 
            and (date_format(dispatchen0_.disp_create_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=4 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (2 ,
            3 ,
            4)) 
            and (date_format(dispatchen0_.disp_create_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=5 then cast(1 as signed) 
            else cast(0 as signed) 
        end) as col_2_0_,
        sum(case 
            when (dispatchen0_.disp_state in (5 ,
            6 ,
            7)) 
            and (date_format(dispatchen0_.disp_finish_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=1 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (5 ,
            6 ,
            7)) 
            and (date_format(dispatchen0_.disp_finish_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=2 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (5 ,
            6 ,
            7)) 
            and (date_format(dispatchen0_.disp_finish_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=3 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (5 ,
            6 ,
            7)) 
            and (date_format(dispatchen0_.disp_finish_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=4 then cast(1 as signed) 
            when (dispatchen0_.disp_state in (5 ,
            6 ,
            7)) 
            and (date_format(dispatchen0_.disp_finish_time,
            ?) between ? and ?) 
            and dispatchen0_.disp_type=5 then cast(1 as signed) 
            else cast(0 as signed) 
        end) as col_3_0_ 
    from
        t_dispatch dispatchen0_ 
    where
        (
            date_format(dispatchen0_.disp_create_time, ?) between ? and ? 
            or date_format(dispatchen0_.disp_finish_time, ?) between ? and ?
        ) 
        and dispatchen0_.disp_emp_Id=1000104 
    group by
        dispatchen0_.disp_type


   select
       *
    from
        t_dispatch dispatchen0_ 
    where
				dispatchen0_.disp_emp_Id=1000104 
    group by
        dispatchen0_.disp_type

2017-10-21 15:43:49

SELECT UNIX_TIMESTAMP("2017-10-20 15:43:49");

SELECT UNIX_TIMESTAMP("2017-12-21 15:43:49");


############################





