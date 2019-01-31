select 'gb_acc_inv_own_stk_temp_his', count(1) from   gb_acc_inv_own_stk_temp_his union all
select 'gb_apparel_colour_temp_his', count(1) from   gb_apparel_colour_temp_his union all
select 'gb_arc_apparel_season_temp_his', count(1) from   gb_arc_apparel_season_temp_his union all
select 'gb_brand_temp_his', count(1) from   gb_brand_temp_his union all
select 'gb_catelog_pty1_temp_his', count(1) from   gb_catelog_pty1_temp_his union all
select 'gb_catelog_pty2_temp_his', count(1) from   gb_catelog_pty2_temp_his union all
select 'gb_catelog_pty3_temp_his', count(1) from   gb_catelog_pty3_temp_his union all
select 'gb_city_area_temp_his', count(1) from   gb_city_area_temp_his union all
select 'gb_city_temp_his', count(1) from   gb_city_temp_his union all
select 'gb_consumer_tran_unit_temp_his', count(1) from   gb_consumer_tran_unit_temp_his union all
select 'gb_cort_orn_sub_temp_his', count(1) from   gb_cort_orn_sub_temp_his union all
select 'gb_cort_orn_temp_his', count(1) from   gb_cort_orn_temp_his union all
select 'gb_cort_sub_unit_temp_his', count(1) from   gb_cort_sub_unit_temp_his union all
select 'gb_div_market_item_temp_his', count(1) from   gb_div_market_item_temp_his union all
select 'gb_div_temp_his', count(1) from   gb_div_temp_his union all
select 'gb_division_temp_his', count(1) from   gb_division_temp_his union all
select 'gb_item_barcode_temp_his', count(1) from   gb_item_barcode_temp_his union all
select 'gb_mg_item_price_temp_his', count(1) from   gb_mg_item_price_temp_his union all
select 'gb_pmt_pcy_bl_depreciate_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_depreciate_dtl_temp_his union all
select 'gb_pmt_pcy_bl_exceptfltr_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_exceptfltr_dtl_temp_his union all
select 'gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp_his union all
select 'gb_pmt_pcy_bl_hdr_temp_his', count(1) from   gb_pmt_pcy_bl_hdr_temp_his union all
select 'gb_pmt_pcy_bl_level_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_level_dtl_temp_his union all
select 'gb_pmt_pcy_bl_levelfltr_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_levelfltr_dtl_temp_his union all
select 'gb_pmt_pcy_bl_levelfltr_sub_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_levelfltr_sub_dtl_temp_his union all
select 'gb_pmt_pcy_bl_subunit_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_subunit_dtl_temp_his union all
select 'gb_pmt_pcy_bl_vip_dtl_temp_his', count(1) from   gb_pmt_pcy_bl_vip_dtl_temp_his union all
select 'gb_pmt_pcy_gift_item_lable_temp_his', count(1) from   gb_pmt_pcy_gift_item_lable_temp_his union all
select 'gb_pmt_pcy_item_lable_temp_his', count(1) from   gb_pmt_pcy_item_lable_temp_his union all
select 'gb_price_collect_hdr_temp_his', count(1) from   gb_price_collect_hdr_temp_his union all
select 'gb_price_collect_temp_his', count(1) from   gb_price_collect_temp_his union all
select 'gb_prj_type_temp_his', count(1) from   gb_prj_type_temp_his union all
select 'gb_prv_temp_his', count(1) from   gb_prv_temp_his union all
select 'gb_share_item_temp_his', count(1) from   gb_share_item_temp_his union all
select 'gb_storage_o2o_temp_his', count(1) from   gb_storage_o2o_temp_his union all
select 'gb_storage_temp_his', count(1) from   gb_storage_temp_his union all
select 'gb_style_temp_his', count(1) from   gb_style_temp_his union all
select 'gb_sub_unit_item_temp_his', count(1) from   gb_sub_unit_item_temp_his union all
select 'gb_total_sales_temp_his', count(1) from   gb_total_sales_temp_his union all
select 'gb_unit_temp_his', count(1) from   gb_unit_temp_his union all
select 'GB_APPAREL_SIZE_TEMP_his', count(1) from   GB_APPAREL_SIZE_TEMP_his ;

select * from (
select 'gb_acc_inv_own_stk_temp' as table_name, count(1) as count from   gb_acc_inv_own_stk_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_apparel_colour_temp' as table_name, count(1) as count from   gb_apparel_colour_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_arc_apparel_season_temp' as table_name, count(1) as count from   gb_arc_apparel_season_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_brand_temp' as table_name, count(1) as count from   gb_brand_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_catelog_pty1_temp' as table_name, count(1) as count from   gb_catelog_pty1_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_catelog_pty2_temp' as table_name, count(1) as count from   gb_catelog_pty2_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_catelog_pty3_temp' as table_name, count(1) as count from   gb_catelog_pty3_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_city_area_temp' as table_name, count(1) as count from   gb_city_area_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_city_temp' as table_name, count(1) as count from   gb_city_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_consumer_tran_unit_temp' as table_name, count(1) as count from   gb_consumer_tran_unit_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_cort_orn_sub_temp' as table_name, count(1) as count from   gb_cort_orn_sub_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_cort_orn_temp' as table_name, count(1) as count from   gb_cort_orn_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_cort_sub_unit_temp' as table_name, count(1) as count from   gb_cort_sub_unit_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_div_market_item_temp' as table_name, count(1) as count from   gb_div_market_item_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_div_temp' as table_name, count(1) as count from   gb_div_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_division_temp' as table_name, count(1) as count from   gb_division_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_item_barcode_temp' as table_name, count(1) as count from   gb_item_barcode_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_mg_item_price_temp' as table_name, count(1) as count from   gb_mg_item_price_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_depreciate_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_depreciate_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_exceptfltr_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_exceptfltr_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_hdr_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_hdr_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_level_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_level_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_levelfltr_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_levelfltr_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_levelfltr_sub_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_levelfltr_sub_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_subunit_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_subunit_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_bl_vip_dtl_temp' as table_name, count(1) as count from   gb_pmt_pcy_bl_vip_dtl_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_gift_item_lable_temp' as table_name, count(1) as count from   gb_pmt_pcy_gift_item_lable_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_pmt_pcy_item_lable_temp' as table_name, count(1) as count from   gb_pmt_pcy_item_lable_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_price_collect_hdr_temp' as table_name, count(1) as count from   gb_price_collect_hdr_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_price_collect_temp' as table_name, count(1) as count from   gb_price_collect_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_prj_type_temp' as table_name, count(1) as count from   gb_prj_type_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_prv_temp' as table_name, count(1) as count from   gb_prv_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_share_item_temp' as table_name, count(1) as count from   gb_share_item_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_storage_o2o_temp' as table_name, count(1) as count from   gb_storage_o2o_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_storage_temp' as table_name, count(1) as count from   gb_storage_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_style_temp' as table_name, count(1) as count from   gb_style_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_sub_unit_item_temp', count(1) as count from   gb_sub_unit_item_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_total_sales_temp', count(1) as count from   gb_total_sales_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'gb_unit_temp', count(1) from   gb_unit_temp  where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000") union all
select 'GB_APPAREL_SIZE_TEMP', count(1) from   GB_APPAREL_SIZE_TEMP where sync_batch_id<DATE_FORMAT(now(),"%Y%m%d0000000000")) a where count>0;




select 'gb_acc_inv_own_stk_temp', count(1) from   gb_acc_inv_own_stk_temp union all
select 'gb_apparel_colour_temp', count(1) from   gb_apparel_colour_temp union all
select 'gb_arc_apparel_season_temp', count(1) from   gb_arc_apparel_season_temp union all
select 'gb_brand_temp', count(1) from   gb_brand_temp union all
select 'gb_catelog_pty1_temp', count(1) from   gb_catelog_pty1_temp union all
select 'gb_catelog_pty2_temp', count(1) from   gb_catelog_pty2_temp union all
select 'gb_catelog_pty3_temp', count(1) from   gb_catelog_pty3_temp union all
select 'gb_city_area_temp', count(1) from   gb_city_area_temp union all
select 'gb_city_temp', count(1) from   gb_city_temp union all
select 'gb_consumer_tran_unit_temp', count(1) from   gb_consumer_tran_unit_temp union all
select 'gb_cort_orn_sub_temp', count(1) from   gb_cort_orn_sub_temp union all
select 'gb_cort_orn_temp', count(1) from   gb_cort_orn_temp union all
select 'gb_cort_sub_unit_temp', count(1) from   gb_cort_sub_unit_temp union all
select 'gb_div_market_item_temp', count(1) from   gb_div_market_item_temp union all
select 'gb_div_temp', count(1) from   gb_div_temp union all
select 'gb_division_temp', count(1) from   gb_division_temp union all
select 'gb_item_barcode_temp', count(1) from   gb_item_barcode_temp union all
select 'gb_mg_item_price_temp', count(1) from   gb_mg_item_price_temp union all
select 'gb_pmt_pcy_bl_depreciate_dtl_temp', count(1) from   gb_pmt_pcy_bl_depreciate_dtl_temp union all
select 'gb_pmt_pcy_bl_exceptfltr_dtl_temp', count(1) from   gb_pmt_pcy_bl_exceptfltr_dtl_temp union all
select 'gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp', count(1) from   gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp union all
select 'gb_pmt_pcy_bl_hdr_temp', count(1) from   gb_pmt_pcy_bl_hdr_temp union all
select 'gb_pmt_pcy_bl_level_dtl_temp', count(1) from   gb_pmt_pcy_bl_level_dtl_temp union all
select 'gb_pmt_pcy_bl_levelfltr_dtl_temp', count(1) from   gb_pmt_pcy_bl_levelfltr_dtl_temp union all
select 'gb_pmt_pcy_bl_levelfltr_sub_dtl_temp', count(1) from   gb_pmt_pcy_bl_levelfltr_sub_dtl_temp union all
select 'gb_pmt_pcy_bl_subunit_dtl_temp', count(1) from   gb_pmt_pcy_bl_subunit_dtl_temp union all
select 'gb_pmt_pcy_bl_vip_dtl_temp', count(1) from   gb_pmt_pcy_bl_vip_dtl_temp union all
select 'gb_pmt_pcy_gift_item_lable_temp', count(1) from   gb_pmt_pcy_gift_item_lable_temp union all
select 'gb_pmt_pcy_item_lable_temp', count(1) from   gb_pmt_pcy_item_lable_temp union all
select 'gb_price_collect_hdr_temp', count(1) from   gb_price_collect_hdr_temp union all
select 'gb_price_collect_temp', count(1) from   gb_price_collect_temp union all
select 'gb_prj_type_temp', count(1) from   gb_prj_type_temp union all
select 'gb_prv_temp', count(1) from   gb_prv_temp union all
select 'gb_share_item_temp', count(1) from   gb_share_item_temp union all
select 'gb_storage_o2o_temp', count(1) from   gb_storage_o2o_temp union all
select 'gb_storage_temp', count(1) from   gb_storage_temp union all
select 'gb_style_temp', count(1) from   gb_style_temp union all
select 'gb_sub_unit_item_temp', count(1) from   gb_sub_unit_item_temp union all
select 'gb_total_sales_temp', count(1) from   gb_total_sales_temp union all
select 'gb_unit_temp', count(1) from   gb_unit_temp union all
select 'GB_APPAREL_SIZE_TEMP', count(1) from   GB_APPAREL_SIZE_TEMP ;

select * from gb_style_temp ;




select count(1) from gb_style_temp;

select * from gb_style_temp_his  order by sync_batch_id limit 100;

select count(1) from (select style_id from gb_style_temp_his group by style_id ) t ;

####################################################
修复数据的脚本
####################################################



INSERT INTO GB_STYLE ( SERIES, STYLE_NUM_ID, STYLE_ID, STYLE_DESC, SEASON_NUM_ID, DIV_NUM_ID, UPDATE_TIME, ENTRY_TIME, CREATE_DOC_TIME ) SELECT
SERIES,
STYLE_NUM_ID,
REPLACE ( STYLE_ID, "\n", "" ) AS STYLE_ID,
STYLE_DESC,
SEASON_NUM_ID,
DIV_NUM_ID,
NOW( ),
ENTRY_TIME,
CREATE_DOC_TIME 
FROM
	GB_STYLE_TEMP T1 
WHERE
	NOT EXISTS ( SELECT 1 FROM GB_STYLE T2 WHERE T2.STYLE_NUM_ID = T1.STYLE_NUM_ID ) 
	AND T1.SYNC_BATCH_ID = 201809270327136045;





ALTER TABLE GB_STYLE_TEMP DROP PRIMARY KEY;

UPDATE GB_CONSUMER_TRAN_UNIT T1
INNER JOIN GB_CONSUMER_TRAN_UNIT_TEMP T2 ON T2.SERIES = T1.SERIES 
SET T1.SERIES = T2.SERIES,
T1.TRAN_SIM_NAME = T2.TRAN_SIM_NAME,
T1.TRAN_SIM_NUM_ID = T2.TRAN_SIM_NUM_ID 
WHERE
	T2.SYNC_BATCH_ID = 201809130836264291;


INSERT INTO GB_CONSUMER_TRAN_UNIT ( SERIES, TRAN_SIM_NAME, TRAN_SIM_NUM_ID ) SELECT
SERIES,
TRAN_SIM_NAME,
TRAN_SIM_NUM_ID 
FROM
	GB_CONSUMER_TRAN_UNIT_TEMP T1 
WHERE
	NOT EXISTS ( SELECT 1 FROM GB_CONSUMER_TRAN_UNIT T2 WHERE T2.SERIES = T1.SERIES ) 
	AND T1.SYNC_BATCH_ID = 201809130836264291;



DELETE 
FROM
	GB_CONSUMER_TRAN_UNIT_TEMP 
WHERE
	SYNC_BATCH_ID = 201809130836264291;


ALTER TABLE GB_CONSUMER_TRAN_UNIT_TEMP DROP PRIMARY KEY;


UPDATE GB_CORT_ORN_SUB T1
INNER JOIN GB_CORT_ORN_SUB_TEMP T2 ON T2.ORN_SUB_NUM_ID = T1.ORN_SUB_NUM_ID 
SET T1.ORN_NUM_ID = T2.ORN_NUM_ID,
T1.ORN_SUB_NUM_ID = T2.ORN_SUB_NUM_ID,
T1.ORN_SUB_NAME = T2.ORN_SUB_NAME 
WHERE
	T2.SYNC_BATCH_ID IN ( 201808271056431527, 201809031106366733, 201809041406351578, 201810051556038584, 201810101105589954, 201810151645532552, 201810151705532558 );


INSERT INTO GB_CORT_ORN_SUB ( ORN_NUM_ID, ORN_SUB_NUM_ID, ORN_SUB_NAME ) SELECT
ORN_NUM_ID,
ORN_SUB_NUM_ID,
ORN_SUB_NAME 
FROM
	GB_CORT_ORN_SUB_TEMP T1 
WHERE
	NOT EXISTS ( SELECT 1 FROM GB_CORT_ORN_SUB T2 WHERE T2.ORN_SUB_NUM_ID = T1.ORN_SUB_NUM_ID ) 
	AND T1.SYNC_BATCH_ID IN ( 201808271056431527, 201809031106366733, 201809041406351578, 201810051556038584, 201810101105589954, 201810151645532552, 201810151705532558 );




DELETE 
FROM
	GB_CORT_ORN_SUB_temp 
WHERE
	SYNC_BATCH_ID IN ( 201808271056431527, 201809031106366733, 201809041406351578, 201810051556038584, 201810101105589954, 201810151645532552, 201810151705532558 );



ALTER TABLE GB_CORT_ORN_SUB_temp DROP PRIMARY KEY;
#------------------------------

select * from GB_STORAGE_O2O_temp limit 100;

UPDATE GB_STORAGE_O2O T1
INNER JOIN GB_STORAGE_O2O_TEMP T2 ON T2.STORAGE_NUM_ID = T1.STORAGE_NUM_ID 
SET T1.SERIES = T2.SERIES,
T1.STORAGE_NUM_ID = T2.STORAGE_NUM_ID,
T1.STATE_SIGN = T2.STATE_SIGN,
T1.AUTO_SIGN = T2.AUTO_SIGN,
T1.SUB_UNIT_NUM_ID = T2.SUB_UNIT_NUM_ID,
T1.FROM_STORAGE_NUM_ID = T2.FROM_STORAGE_NUM_ID,
T1.TYPE_NUM_ID = T2.TYPE_NUM_ID,
T1.MG_UNIT_NUM_ID = T2.MG_UNIT_NUM_ID,
T1.CANCELSIGN = T2.CANCELSIGN 
WHERE
	T2.SYNC_BATCH_ID IN ( 201901301644039288 );


INSERT INTO GB_STORAGE_O2O ( SERIES, STORAGE_NUM_ID, STATE_SIGN, AUTO_SIGN, SUB_UNIT_NUM_ID, FROM_STORAGE_NUM_ID, TYPE_NUM_ID, MG_UNIT_NUM_ID, CANCELSIGN ) SELECT
SERIES,
STORAGE_NUM_ID,
STATE_SIGN,
AUTO_SIGN,
SUB_UNIT_NUM_ID,
FROM_STORAGE_NUM_ID,
TYPE_NUM_ID,
MG_UNIT_NUM_ID,
CANCELSIGN 
FROM
	GB_STORAGE_O2O_TEMP T1 
WHERE
	NOT EXISTS ( SELECT 1 FROM GB_STORAGE_O2O T2 WHERE T2.STORAGE_NUM_ID = T1.STORAGE_NUM_ID ) 
	AND T1.SYNC_BATCH_ID IN ( 201901301644039288 );




DELETE 
FROM
	GB_STORAGE_O2O_TEMP 
WHERE
	SYNC_BATCH_ID IN ( 201901301644039288);

#===================
ALTER TABLE GB_STORAGE_O2O_TEMP DROP PRIMARY KEY;



select distinct sync_batch_id from gb_cort_orn_temp;


UPDATE GB_CORT_ORN T1
			INNER JOIN GB_CORT_ORN T2 ON 
			T2.ORN_NUM_ID=T1.ORN_NUM_ID 
		SET
			T1.ORN_NUM_ID = T2.ORN_NUM_ID, 
			T1.ORN_NAME = T2.ORN_NAME
			where  T2.SYNC_BATCH_ID in (201809041406351577,
201810051546038581)

INSERT INTO GB_CORT_ORN
		(	 
			ORN_NUM_ID,
			ORN_NAME
		)SELECT 
	 		ORN_NUM_ID,
	 		ORN_NAME
		FROM GB_CORT_ORN_TEMP T1 WHERE NOT EXISTS(
			SELECT 1 FROM GB_CORT_ORN T2
			 WHERE 
			 T2.ORN_NUM_ID = T1.ORN_NUM_ID
		) and T1.SYNC_BATCH_ID in (201809041406351577,
201810051546038581)
		
		delete from GB_CORT_ORN_TEMP where SYNC_BATCH_ID in (201809041406351577,
201810051546038581);

#---------------------gb_cort_orn_sub_temp----------------------------------
select * from  gb_cort_orn_sub_temp ;
select * from  gb_cort_orn_sub_temp_his;

select * from gb_cort_orn_sub_temp where sync_batch_id=201810221655466503;


UPDATE GB_CORT_ORN_SUB T1
			INNER JOIN GB_CORT_ORN_SUB_TEMP T2 ON 
			T2.ORN_SUB_NUM_ID=T1.ORN_SUB_NUM_ID 
		SET
			T1.ORN_NUM_ID = T2.ORN_NUM_ID, 
			T1.ORN_SUB_NUM_ID = T2.ORN_SUB_NUM_ID, 
			T1.ORN_SUB_NAME = T2.ORN_SUB_NAME
			where  T2.SYNC_BATCH_ID in (201810241045446761,201810241115446767
			);
			
			
			
INSERT INTO GB_CORT_ORN_SUB
		(	 
			ORN_NUM_ID,
			ORN_SUB_NUM_ID,
			ORN_SUB_NAME
		)SELECT 
	 		ORN_NUM_ID,
	 		ORN_SUB_NUM_ID,
	 		ORN_SUB_NAME
		FROM GB_CORT_ORN_SUB_TEMP T1 WHERE NOT EXISTS(
			SELECT 1 FROM GB_CORT_ORN_SUB T2
			 WHERE 
			 T2.ORN_SUB_NUM_ID = T1.ORN_SUB_NUM_ID
		) and T1.SYNC_BATCH_ID in (201810241045446761,201810241115446767
			);
		
		delete from GB_CORT_ORN_SUB_TEMP where SYNC_BATCH_ID in (201810241045446761,201810241115446767
			);
		
select * from GB_CORT_ORN_SUB_TEMP where SYNC_BATCH_ID=1


select * from  gb_cort_orn_sub_temp ;
select * from gb_cort_orn_sub where orn_sub_num_id in (157,158);



#=========================GB_STORAGE_O2O_TEMP=====================

select * from GB_STORAGE_O2O_temp;

	UPDATE GB_STORAGE_O2O T1
			INNER JOIN GB_STORAGE_O2O_TEMP T2 ON 
			T2.STORAGE_NUM_ID = T1.STORAGE_NUM_ID
			 <!-- AND
			T2.FROM_STORAGE_NUM_ID = T1.FROM_STORAGE_NUM_ID -->
		SET
			T1.SERIES = T2.SERIES, 
			T1.STORAGE_NUM_ID = T2.STORAGE_NUM_ID, 
			T1.STATE_SIGN = T2.STATE_SIGN, 
			T1.AUTO_SIGN = T2.AUTO_SIGN, 
			T1.SUB_UNIT_NUM_ID = T2.SUB_UNIT_NUM_ID, 
			T1.FROM_STORAGE_NUM_ID = T2.FROM_STORAGE_NUM_ID,
			T1.TYPE_NUM_ID = T2.TYPE_NUM_ID,
			T1.MG_UNIT_NUM_ID = T2.MG_UNIT_NUM_ID,
			T1.CANCELSIGN = T2.CANCELSIGN
		where  T2.SYNC_BATCH_ID
		in (201810291645397631,
       201810291645397631,
       201811081435299395);


INSERT INTO GB_STORAGE_O2O
		(	 
			SERIES,
			STORAGE_NUM_ID,
			STATE_SIGN,
			AUTO_SIGN,
			SUB_UNIT_NUM_ID,
			FROM_STORAGE_NUM_ID,
			TYPE_NUM_ID,
			MG_UNIT_NUM_ID,
			CANCELSIGN
		)SELECT 
	 		SERIES,
	 		STORAGE_NUM_ID,
	 		STATE_SIGN,
	 		AUTO_SIGN,
	 		SUB_UNIT_NUM_ID,
	 		FROM_STORAGE_NUM_ID,
	 		TYPE_NUM_ID,
	 		MG_UNIT_NUM_ID,
			CANCELSIGN
		FROM GB_STORAGE_O2O_TEMP T1 WHERE NOT EXISTS(
			SELECT 1 FROM GB_STORAGE_O2O T2
			 WHERE 
			 T2.STORAGE_NUM_ID = T1.STORAGE_NUM_ID<!--  AND
			 T2.FROM_STORAGE_NUM_ID = T1.FROM_STORAGE_NUM_ID -->
		) and T1.SYNC_BATCH_ID in (201810291645397631,
       201810291645397631,
       201811081435299395);

delete from   GB_STORAGE_O2O_TEMP where SYNC_BATCH_ID in (201810291645397631,
       201810291645397631,
       201811081435299395);


#========================================

select distinct sync_batch_id from gb_share_item_temp;


delete from gb_share_item_temp where item_num_id=314625;



			
			
			INSERT INTO GB_SHARE_ITEM
		(	 
			SERIES,
			DIV_NUM_ID,
			ITEM_NUM_ID,
			ITEMID,
			STYLE_NUM_ID,
			STYLE_DESC,
			PRO_SKU,
			ITEM_NAME,
			APPLY_SEX_NUM_ID,
			BRAND_ID,
			UNIT_NUM_ID,
			BARCODE_1,
			PTY_NUM_1,
			PTY_NUM_2,
			PTY_NUM_3,
			COLOR_NUM_ID,
			SIZE_NUM_ID,
			UPDATE_TIME,
			RPT_DIV_NUM_ID,
			PACKAGE_SIGN,
			S_YEAR_SEASON,
			GB_BRAND_NUM_ID
		)SELECT 
	 		SERIES,
	 		DIV_NUM_ID,
	 		ITEM_NUM_ID,
	 		ITEMID,
	 		STYLE_NUM_ID,
	 		STYLE_DESC,
	 		PRO_SKU,
	 		ITEM_NAME,
	 		APPLY_SEX_NUM_ID,
	 		BRAND_ID,
	 		UNIT_NUM_ID,
	 		BARCODE_1,
	 		PTY_NUM_1,
	 		PTY_NUM_2,
	 		PTY_NUM_3,
	 		COLOR_NUM_ID,
	 		SIZE_NUM_ID,
	 		NOW(),
	 		RPT_DIV_NUM_ID,
			PACKAGE_SIGN,
			S_YEAR_SEASON,
			BRAND_ID 
		FROM GB_SHARE_ITEM_TEMP T1 WHERE NOT EXISTS(
			SELECT 1 FROM GB_SHARE_ITEM T2
			 WHERE 
			 T2.BARCODE_1 = T1.BARCODE_1
		)
		and not exists(select 1 FROM GB_SHARE_ITEM T3
			 WHERE 
			 T3.item_num_id = T1.item_num_id)
		and T1.SYNC_BATCH_ID  in (201812141105076315,
201812141105096316,
201812141105206321);
		
				delete from  GB_SHARE_ITEM_TEMP where SYNC_BATCH_ID  in （201812141105076315,
201812141105096316,
201812141105206321);
				
				
				select gt_name from t_goods_type where gt_id =0 limit 1;
				
				select style_catelog_first from gb_style limit 1;
				
				
		select * from u_stock_log_detail where barcode='6970673110013' and id='MMH2018121310014338';
		
		select * from u_stock_log where id='MMH2018121310014350';
		
		
				select * from u_stock_log_his where id='MMH2018121310014350';
				
				
		update u_stock_log set status=5 where id='MMH2018121310014350';
		
		select * from u_stock_log_detail where  id='MMH2018121310014350';
		
		select * from u_goods_stock_log where id='MMH2018121310014350';
		
		
		select * from u_stock_log_detail where id='MMH2018121010013379' and barcode='3760179012316';
		
		update u_stock_log_detail set cost_price='98.00' ,total_cost_price=from_num*cost_price  where id='MMH2018121010013379' and barcode='3760179012316';
		
		
		#########################################################
		
		
		select distinct sync_batch_id from GB_BRAND_TEMP ;
		
INSERT INTO GB_BRAND(	 SERIES,
			 BRAND_NUM_ID,
			 BRAND_NAME
		)SELECT SERIES , BRAND_NUM_ID ,BRAND_NAME
		FROM GB_BRAND_TEMP T1 WHERE NOT EXISTS(
			SELECT 1 FROM GB_BRAND T2
			 WHERE 
			 T2.BRAND_NUM_ID=T1.BRAND_NUM_ID
		)
		and T1.SYNC_BATCH_ID='201901121004226553';
		
		
		
	UPDATE GB_BRAND T1 
			INNER JOIN GB_BRAND_TEMP T2 ON 
			T2.BRAND_NUM_ID=T1.BRAND_NUM_ID 
			SET
			T1.SERIES 		= 	T2.SERIES, 
			T1.BRAND_NAME = 	T2.BRAND_NAME
			where T2.SYNC_BATCH_ID='201901121004226553';
		
	

INSERT INTO GB_BRAND_TEMP_HIS
	(SYNC_BATCH_ID,
		SYNC_STATUS,
		SERIES,
		BRAND_NUM_ID,
		BRAND_NAME
		)
		select 
		SYNC_BATCH_ID,
		1,
		SERIES,
		BRAND_NUM_ID,
		BRAND_NAME from 
			GB_BRAND_TEMP T2 where T2.SYNC_BATCH_ID='201901121004226553';
			
			
delete from GB_BRAND_TEMP where SYNC_BATCH_ID='201901121004226553';
			
			

		
		
		