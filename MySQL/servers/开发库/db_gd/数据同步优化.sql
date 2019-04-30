#-----------------自增序列---------------------------------


drop table t_seq;
create table t_seq (
	name varchar(50) not null primary key,
	start_value int not null,
	now_value int not null,
	increment_value int not null default 1,
	max_value int not null
);

delete from t_seq;
insert into t_seq values('stock_log_id',10000,10000,1,99999);
select * from t_seq;



drop function  nextval;

create function nextval(str varchar(50)) returns integer
begin
	declare j int ;
	declare i int;
	select now_value ,max_value into i,j from t_seq where name=str for update;
	if i=j then 
		update t_seq set now_value=start_value where name=str;
	else 
	update t_seq
		set now_value=i+increment_value
	where name=str;
	end if;
 return i;
end;

select nextval("sycn_batch_id");

select * from t_seq;
delete from t_seq;
insert into t_seq values('sync_batch_id',1000,1000,1,9999);

###########################################


select concat("alter table  ",table_name," add column sync_batch_id bigint(18);" )from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev' and TABLE_NAME like 'GB%TEMP';

select concat("create table ",table_name,"_HIS as select * from ",table_name," where 1=2;" )from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev' and TABLE_NAME like 'GB%TEMP';

select concat("alter table  ",table_name,"_HIS add column sync_status int(2);" )from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev' and TABLE_NAME like 'GB%TEMP';

select concat("select '",table_name,"', count(1) from   ",table_name," union all" )from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev' and TABLE_NAME like 'GB%TEMP_HIS';

select concat("delete from  ",table_name," where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),\"%Y%m%d%H%i%s\")*10000;" )from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev' and TABLE_NAME like 'GB%TEMP_HIS';

select * from gb_brand_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;


select * from GB_APPAREL_SIZE_TEMP;

alter table  GB_APPAREL_SIZE_TEMP add column sync_batch_id bigint(18);
create table GB_APPAREL_SIZE_TEMP_his as select * from GB_APPAREL_SIZE_TEMP where 1=2;
alter table  GB_APPAREL_SIZE_TEMP_his add column sync_status int(2);



alter table  gb_acc_inv_own_stk_temp add column sync_batch_id bigint(18);
alter table  gb_apparel_colour_temp add column sync_batch_id bigint(18);
alter table  gb_arc_apparel_season_temp add column sync_batch_id bigint(18);
alter table  gb_brand_temp add column sync_batch_id bigint(18);
alter table  gb_catelog_pty1_temp add column sync_batch_id bigint(18);
alter table  gb_catelog_pty2_temp add column sync_batch_id bigint(18);
alter table  gb_catelog_pty3_temp add column sync_batch_id bigint(18);
alter table  gb_city_area_temp add column sync_batch_id bigint(18);
alter table  gb_city_temp add column sync_batch_id bigint(18);
alter table  gb_consumer_tran_unit_temp add column sync_batch_id bigint(18);
alter table  gb_cort_orn_sub_temp add column sync_batch_id bigint(18);
alter table  gb_cort_orn_temp add column sync_batch_id bigint(18);
alter table  gb_cort_sub_unit_temp add column sync_batch_id bigint(18);
alter table  gb_div_market_item_temp add column sync_batch_id bigint(18);
alter table  gb_div_temp add column sync_batch_id bigint(18);
alter table  gb_division_temp add column sync_batch_id bigint(18);
alter table  gb_item_barcode_temp add column sync_batch_id bigint(18);
alter table  gb_mg_item_price_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_depreciate_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_exceptfltr_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_hdr_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_level_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_levelfltr_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_levelfltr_sub_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_subunit_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_bl_vip_dtl_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_gift_item_lable_temp add column sync_batch_id bigint(18);
alter table  gb_pmt_pcy_item_lable_temp add column sync_batch_id bigint(18);
alter table  gb_price_collect_hdr_temp add column sync_batch_id bigint(18);
alter table  gb_price_collect_temp add column sync_batch_id bigint(18);
alter table  gb_prj_type_temp add column sync_batch_id bigint(18);
alter table  gb_prv_temp add column sync_batch_id bigint(18);
alter table  gb_share_item_temp add column sync_batch_id bigint(18);
alter table  gb_storage_o2o_temp add column sync_batch_id bigint(18);
alter table  gb_storage_temp add column sync_batch_id bigint(18);
alter table  gb_style_temp add column sync_batch_id bigint(18);
alter table  gb_sub_unit_item_temp add column sync_batch_id bigint(18);
alter table  gb_total_sales_temp add column sync_batch_id bigint(18);
alter table  gb_unit_temp add column sync_batch_id bigint(18);




create table gb_acc_inv_own_stk_temp_HIS as select * from gb_acc_inv_own_stk_temp where 1=2;
create table gb_apparel_colour_temp_HIS as select * from gb_apparel_colour_temp where 1=2;
create table gb_arc_apparel_season_temp_HIS as select * from gb_arc_apparel_season_temp where 1=2;
create table gb_brand_temp_HIS as select * from gb_brand_temp where 1=2;
create table gb_catelog_pty1_temp_HIS as select * from gb_catelog_pty1_temp where 1=2;
create table gb_catelog_pty2_temp_HIS as select * from gb_catelog_pty2_temp where 1=2;
create table gb_catelog_pty3_temp_HIS as select * from gb_catelog_pty3_temp where 1=2;
create table gb_city_area_temp_HIS as select * from gb_city_area_temp where 1=2;
create table gb_city_temp_HIS as select * from gb_city_temp where 1=2;
create table gb_consumer_tran_unit_temp_HIS as select * from gb_consumer_tran_unit_temp where 1=2;
create table gb_cort_orn_sub_temp_HIS as select * from gb_cort_orn_sub_temp where 1=2;
create table gb_cort_orn_temp_HIS as select * from gb_cort_orn_temp where 1=2;
create table gb_cort_sub_unit_temp_HIS as select * from gb_cort_sub_unit_temp where 1=2;
create table gb_div_market_item_temp_HIS as select * from gb_div_market_item_temp where 1=2;
create table gb_div_temp_HIS as select * from gb_div_temp where 1=2;
create table gb_division_temp_HIS as select * from gb_division_temp where 1=2;
create table gb_item_barcode_temp_HIS as select * from gb_item_barcode_temp where 1=2;
create table gb_mg_item_price_temp_HIS as select * from gb_mg_item_price_temp where 1=2;
create table gb_pmt_pcy_bl_depreciate_dtl_temp_HIS as select * from gb_pmt_pcy_bl_depreciate_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_exceptfltr_dtl_temp_HIS as select * from gb_pmt_pcy_bl_exceptfltr_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp_HIS as select * from gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_hdr_temp_HIS as select * from gb_pmt_pcy_bl_hdr_temp where 1=2;
create table gb_pmt_pcy_bl_level_dtl_temp_HIS as select * from gb_pmt_pcy_bl_level_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_levelfltr_dtl_temp_HIS as select * from gb_pmt_pcy_bl_levelfltr_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_levelfltr_sub_dtl_temp_HIS as select * from gb_pmt_pcy_bl_levelfltr_sub_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_subunit_dtl_temp_HIS as select * from gb_pmt_pcy_bl_subunit_dtl_temp where 1=2;
create table gb_pmt_pcy_bl_vip_dtl_temp_HIS as select * from gb_pmt_pcy_bl_vip_dtl_temp where 1=2;
create table gb_pmt_pcy_gift_item_lable_temp_HIS as select * from gb_pmt_pcy_gift_item_lable_temp where 1=2;
create table gb_pmt_pcy_item_lable_temp_HIS as select * from gb_pmt_pcy_item_lable_temp where 1=2;
create table gb_price_collect_hdr_temp_HIS as select * from gb_price_collect_hdr_temp where 1=2;
create table gb_price_collect_temp_HIS as select * from gb_price_collect_temp where 1=2;
create table gb_prj_type_temp_HIS as select * from gb_prj_type_temp where 1=2;
create table gb_prv_temp_HIS as select * from gb_prv_temp where 1=2;
create table gb_share_item_temp_HIS as select * from gb_share_item_temp where 1=2;
create table gb_storage_o2o_temp_HIS as select * from gb_storage_o2o_temp where 1=2;
create table gb_storage_temp_HIS as select * from gb_storage_temp where 1=2;
create table gb_style_temp_HIS as select * from gb_style_temp where 1=2;
create table gb_sub_unit_item_temp_HIS as select * from gb_sub_unit_item_temp where 1=2;
create table gb_total_sales_temp_HIS as select * from gb_total_sales_temp where 1=2;
create table gb_unit_temp_HIS as select * from gb_unit_temp where 1=2;



alter table  gb_acc_inv_own_stk_temp_HIS add column sync_status int(2);
alter table  gb_apparel_colour_temp_HIS add column sync_status int(2);
alter table  gb_arc_apparel_season_temp_HIS add column sync_status int(2);
alter table  gb_brand_temp_HIS add column sync_status int(2);
alter table  gb_catelog_pty1_temp_HIS add column sync_status int(2);
alter table  gb_catelog_pty2_temp_HIS add column sync_status int(2);
alter table  gb_catelog_pty3_temp_HIS add column sync_status int(2);
alter table  gb_city_area_temp_HIS add column sync_status int(2);
alter table  gb_city_temp_HIS add column sync_status int(2);
alter table  gb_consumer_tran_unit_temp_HIS add column sync_status int(2);
alter table  gb_cort_orn_sub_temp_HIS add column sync_status int(2);
alter table  gb_cort_orn_temp_HIS add column sync_status int(2);
alter table  gb_cort_sub_unit_temp_HIS add column sync_status int(2);
alter table  gb_div_market_item_temp_HIS add column sync_status int(2);
alter table  gb_div_temp_HIS add column sync_status int(2);
alter table  gb_division_temp_HIS add column sync_status int(2);
alter table  gb_item_barcode_temp_HIS add column sync_status int(2);
alter table  gb_mg_item_price_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_depreciate_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_exceptfltr_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_hdr_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_level_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_levelfltr_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_levelfltr_sub_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_subunit_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_bl_vip_dtl_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_gift_item_lable_temp_HIS add column sync_status int(2);
alter table  gb_pmt_pcy_item_lable_temp_HIS add column sync_status int(2);
alter table  gb_price_collect_hdr_temp_HIS add column sync_status int(2);
alter table  gb_price_collect_temp_HIS add column sync_status int(2);
alter table  gb_prj_type_temp_HIS add column sync_status int(2);
alter table  gb_prv_temp_HIS add column sync_status int(2);
alter table  gb_share_item_temp_HIS add column sync_status int(2);
alter table  gb_storage_o2o_temp_HIS add column sync_status int(2);
alter table  gb_storage_temp_HIS add column sync_status int(2);
alter table  gb_style_temp_HIS add column sync_status int(2);
alter table  gb_sub_unit_item_temp_HIS add column sync_status int(2);
alter table  gb_total_sales_temp_HIS add column sync_status int(2);
alter table  gb_unit_temp_HIS add column sync_status int(2);




select  * from gb_brand_temp_his limit 100;

select * from gb_brand limit 100;

select * from gb_brand_temp;

select * from gb_brand_temp_his;

select date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000 from dual;


select * from gb_item_barcode_temp_his;

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
select 'gb_unit_temp_his', count(1) from   gb_unit_temp_his ;

alter table gb_item_barcode_temp drop PRIMARY KEY;
truncate table  gb_item_barcode_temp;

select * from gb_brand  where series=562;



delete from  gb_acc_inv_own_stk_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_apparel_colour_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_arc_apparel_season_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_brand_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_catelog_pty1_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_catelog_pty2_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_catelog_pty3_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_city_area_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_city_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_consumer_tran_unit_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_cort_orn_sub_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_cort_orn_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_cort_sub_unit_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_div_market_item_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_div_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_division_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_item_barcode_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_mg_item_price_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_depreciate_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_exceptfltr_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_exceptfltr_sub_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_hdr_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_level_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_levelfltr_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_levelfltr_sub_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_subunit_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_bl_vip_dtl_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_gift_item_lable_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_pmt_pcy_item_lable_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_price_collect_hdr_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_price_collect_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_prj_type_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_prv_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_share_item_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_storage_o2o_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_storage_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_style_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_sub_unit_item_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_total_sales_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;
delete from  gb_unit_temp_his where sync_batch_id<date_format(DATE_SUB(NOW(),INTERVAL 30 DAY),"%Y%m%d%H%i%s")*10000;