select * from t_operational_price where city_num_id=0 limit 100;


select * from t_operational_price where city_num_id=0 and begin_time<=curdate() and end_time>=curdate() and type=0 and effective=0 limit 100;

9138


#--------------验证全国及城市
select * from t_operational_price where id=9138 limit 100;
181375

update t_operational_price set effective=

#---------------城市信息-----------------
select * from gb_city;

select * from gb_prv;

select * from gb_cort_sub_unit where  SUB_UNIT_NUM_ID=38644;

SELECT
	tmp1.id,
	tmp1.style_num_id,
	tmp1.item_num_id,
	tmp1.city_num_id,
	tmp1.shop_id,
	#shop.online_sub_unit_name AS shop_name,
	tmp1.price,
	tmp1.begin_time,
	tmp1.end_time,
	tmp1.create_time,
	tmp1.create_user,
	s.style_id,
	gsi.itemId,
	s.style_title,
	s.style_pic AS pic,
	gc.city_name AS city_name 
FROM
	t_operational_price tmp1
	LEFT JOIN gb_style s ON tmp1.style_num_id = s.style_num_id
	LEFT JOIN gb_share_item gsi ON tmp1.item_num_id = gsi.item_num_id
	LEFT JOIN gb_city gc ON tmp1.city_num_id = gc.city_num_id
	#LEFT JOIN gb_cort_sub_unit shop ON tmp1.shop_id = shop.SUB_UNIT_NUM_ID 
WHERE
	`type` = 0 
	AND tmp1.effective = 0
	AND tmp1.style_num_id = 181375
	#AND gsi.itemId = ? 
ORDER BY
	tmp1.id DESC 
	LIMIT 0,10
	
	
#-------------------------查询导入的数据-----------------------------

select * from  t_operational_price where item_num_id=5089;

select * from gb_style where style_num_id= limit 100;

select * from gb_share_item   limit 100;

#吊牌价
select * from t_daily_standard_price_1_0;



