#create table wgn_order_0 as select * from wgn_order where 1=2;
#create table wgn_order_1 as select * from wgn_order where 1=2;
#create table wgn_order_item_0 as select * from wgn_order_item where 1=2;
#create table wgn_order_item_1 as select * from wgn_order_item where 1=2;
SELECT
	* 
FROM
	wgn_order;
INSERT INTO wgn_order_1
VALUES
	( 5, 4 );
INSERT INTO wgn_order
VALUES
	( 5, 4 );
DELETE 
FROM
	wgn_order;
SELECT
	* 
FROM
	wgn_order_1;
SELECT
	* 
FROM
	wgn_order;
SELECT
	* 
FROM
	wgn_order_0;
SELECT
	b.STYLE_NUM_ID 商品款式,
	b.item_num_id 商品规格,
	b.depreciate 价格,
	b.mg_unit_num_id 分公司 id,
	b.sub_unit_num_id 门店 id 
FROM
	gb_pmt_pcy_item_lable b 
	LIMIT 10;
SELECT
	t.s 
FROM
	t_daily_shop_pmt_price t 
	LIMIT 10;
SELECT
	* 
FROM
	t_daily_shop_pmt_price 
WHERE
	item_num_id = 758;
SELECT
	* 
FROM
	t_daily_company_pmt_price 
WHERE
	item_num_id = 758;
	
	
	
SELECT
	* 
FROM
	t_daily_custom_price 
WHERE
	item_num_Id = 758;
	
	
	
	
DELETE 
FROM
	t_daily_shop_pmt_price_8 
WHERE
	id = 30045;
INSERT INTO `db_gd_dev`.`t_daily_shop_pmt_price_8` ( `id`, `style_num_id`, `item_num_id`, `shop_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	( 30045, 202431, 758, 38, 4740, '2018-05-25', '2018-05-23 22:05:16', NULL );
SELECT
	* 
FROM
	t_daily_shop_pmt_price_8;
	
	
DELETE 
FROM
	t_daily_shop_pmt_price_8 
WHERE
	id = 30046;
INSERT INTO `db_gd_dev`.`t_daily_shop_pmt_price_8` ( `id`, `style_num_id`, `item_num_id`, `shop_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	( 30046, 202431, 1544, 38, 8000, '2018-05-25', '2018-05-23 22:05:16', NULL );
SELECT
	* 
FROM
	t_daily_shop_pmt_price_8;	
	
	
	
	
	
	
INSERT INTO `db_gd_dev`.`t_daily_shop_pmt_price_9` ( `id`, `style_num_id`, `item_num_id`, `shop_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	( 30045, 202431, 758, 38, 4740, '2018-05-25', '2018-05-23 22:05:16', NULL );
SELECT
	* 
FROM
	t_daily_shop_pmt_price_9;
SELECT
	* 
FROM
	t_daily_shop_pmt_price_8;
SELECT
	* 
FROM
	t_daily_shop_pmt_price_9;
INSERT INTO `db_gd_dev`.`t_daily_shop_pmt_price` ( `id`, `style_num_id`, `item_num_id`, `shop_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	( 30046, 202431, 717383, 90000092, 4740, '2018-05-24', '2018-05-23 22:05:16', NULL );
	
---------------------	
delete from t_daily_company_pmt_price where id=138;
INSERT INTO `db_gd_dev`.`t_daily_company_pmt_price` ( `id`, `item_num_id`, `style_num_id`, `company_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	( 138, 758, 169076, 31, 7700, '2018-05-25', '2018-05-23 22:05:44', '2018-05-23 22:05:44' );
SELECT
	* 
FROM
	t_daily_company_pmt_price where item_num_id=758;
	
delete from t_daily_company_pmt_price where id=139;
INSERT INTO `db_gd_dev`.`t_daily_company_pmt_price` ( `id`, `item_num_id`, `style_num_id`, `company_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	( 139, 195594, 169076, 31, 400, '2018-05-25', '2018-05-23 22:05:44', '2018-05-23 22:05:44' );
SELECT
	* 
FROM
	t_daily_company_pmt_price where item_num_id=758;	
	
----------------------	
	
	
	
	

select max(id) from t_daily_country_pmt_price;
	
INSERT INTO `db_gd_dev`.`t_daily_country_pmt_price` ( `item_num_id`, `style_num_id`, `price`, `valid_date`, `create_time`, `update_time` )
VALUES
	(  758, 169076, 6000, '2018-05-25', '2018-05-23 22:05:52', '2018-05-23 22:05:52' );
SELECT
	* 
FROM
	t_daily_country_pmt_price where item_num_id=758;

create table gb_pmt_pcy_item_lable_bak as select * from gb_pmt_pcy_item_lable;
select count(1) from gb_pmt_pcy_item_lable_bak;

select * from gb_pmt_pcy_item_lable limit 10;
	
	
INSERT INTO ``(`reserved_no`, `type_num_id`, `begin_day`, `end_day`, `begin_tm`, `end_tm`, `description`, `mg_unit_num_id`, `item_num_id`, `last_updtme`, `levelgroup_id`, `levelfltr_id`, `levelfltr_count`, `depreciate`, `sub_unit_num_id`, `sub_qty`, `sub_amount`, `fltr_begin_qty`, `fltr_end_qty`, `fltr_begin_amount`, `fltr_end_amount`, `group_begin_qty`, `group_end_qty`, `group_begin_amount`, `group_end_amount`, `group_pack_price`, `group_discount`, `group_decrease_amount`, `group_fitler_qty_matching`, `group_just_one`, `batch_no`, `level_description`, `STYLE_NUM_ID`, `SUB_PMT_TYPE_NUM_ID`, `SUB_PMT_VALUE`, `DIV_NUM_ID`, `ticketid`, `CANCELSIGN`, `group_standard_price_sign`, `group_multiple_sign`, `syn_update_time`) VALUES (5000151327, 1, '2018-04-12 00:00:00', '2018-12-31 00:00:00', '0', '23:59:59', '发饰促销', 0, 456298, '2018-04-11 15:22:40', 1, 0, 0, 39.00, 90062810, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.00, 0, 1, 334, '0', 919710, 3, 39.0000, 66, '0', 'N', 0, 9999, '2018-04-12 06:43:46');
	
	
	----------------------------------
	
  select 'gb_pmt_pcy_item_lable_0',count(1) from gb_pmt_pcy_item_lable_0 union all
	select 'gb_pmt_pcy_item_lable_1',count(1) from gb_pmt_pcy_item_lable_1 union all
	select 'gb_pmt_pcy_item_lable_2',count(1) from gb_pmt_pcy_item_lable_2 union all
	select 'gb_pmt_pcy_item_lable_3',count(1) from gb_pmt_pcy_item_lable_3 union all
	select 'gb_pmt_pcy_item_lable_4',count(1) from gb_pmt_pcy_item_lable_4 union all
	select 'gb_pmt_pcy_item_lable_5',count(1) from gb_pmt_pcy_item_lable_5 union all
	select 'gb_pmt_pcy_item_lable_6',count(1) from gb_pmt_pcy_item_lable_6 union all
	select 'gb_pmt_pcy_item_lable_7',count(1) from gb_pmt_pcy_item_lable_7 union all
	select 'gb_pmt_pcy_item_lable_8',count(1) from gb_pmt_pcy_item_lable_8 union all
	select 'gb_pmt_pcy_item_lable_9',count(1) from gb_pmt_pcy_item_lable_9 ;


	select 't_daily_shop_pmt_price_0',count(1) from t_daily_shop_pmt_price_0 union all
	select 't_daily_shop_pmt_price_1',count(1) from t_daily_shop_pmt_price_1 union all
	select 't_daily_shop_pmt_price_2',count(1) from t_daily_shop_pmt_price_2 union all
	select 't_daily_shop_pmt_price_3',count(1) from t_daily_shop_pmt_price_3 union all
	select 't_daily_shop_pmt_price_4',count(1) from t_daily_shop_pmt_price_5 union all
	select 't_daily_shop_pmt_price_5',count(1) from t_daily_shop_pmt_price_5 union all
	select 't_daily_shop_pmt_price_6',count(1) from t_daily_shop_pmt_price_6 union all
	select 't_daily_shop_pmt_price_7',count(1) from t_daily_shop_pmt_price_7 union all
	select 't_daily_shop_pmt_price_8',count(1) from t_daily_shop_pmt_price_8 union all
	select 't_daily_shop_pmt_price_9',count(1) from t_daily_shop_pmt_price_9 union all
	select 't_daily_company_pmt_price',count(1) from t_daily_company_pmt_price union all
	select 't_daily_country_pmt_price',count(1) from t_daily_country_pmt_price ;
	
	
  truncate table t_daily_company_pmt_price;
	insert into t_daily_company_pmt_price select * from t_daily_company_pmt_price_bak;
	
	select count(1) from t_daily_company_pmt_price_bak;
	
	truncate table t_daily_country_pmt_price;
	insert into t_daily_country_pmt_price select * from t_daily_country_pmt_price_bak;
	select count(1) from t_daily_country_pmt_price_bak;
	
	truncate table t_daily_shop_pmt_price_9;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	