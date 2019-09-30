select * from t_tk_order ;
select * from  t_tk_refund_order;



	


select * from 	t_member_star where staff_id is not null  limit 100

select * from u_staff where staff_work_number='wgnfd' limit 1;								
								
								
								
select * from t_star_member_sales order by create_time desc limit 100;

select * from t_star_member_sales where order_no='MPOS152160164850715test';
			
	select * from db_gd.t_order where order_no='MPOS152160164850715test';		
	
	select * from db_gd.t_order_line where order_no='MPOS152160164850715test';	
	
	select * from db_gd.u_order_line where order_no='MPOS152160164850715test';			
	
select  * from  db_gd.gb_share_item  where item_num_id=434883 limit 100;

select  * from  db_gd.gb_style where style_num_id= 915859
	
		select * from db_gd.u_order where order_no='MPOS152160164850715test';		
		
				select * from db_gd.u_refund_basic where  order_no='MPOS152160164850715test';		

		select * from db_gd.u_refund_goods where  refund_no='MTH152160375654809test';		
	
# 设置用户信息	
update db_gd.t_order set member_id=1777169,member_name='1777169' where order_no='10315031332';
			
select * from db_gd.t_order where order_no='10315031332';
			
select * from db_gd.t_order  where payment_time is not null;
	select * from db_gd.t_tk_order where trade_id='595796608023149216' for update;
			

select * from t_star_member_asset_log order by create_time desc  limit 100;

select * from t_member where member_id=1995051;
16612345678


update `mamahao-user`.t_member set relation_id=2223336889 where member_id=1995051;


1_20170721093419.jpg

#------------------------自有订单

	# 查看数据
	
select * from t_star_member_sales where order_no='MPOS152160164850715test';
select * from t_star_member_sales_detail where order_no='MPOS152160164850715test';
select * from t_star_member_asset_log where out_serial_number='MPOS152160164850715test';



#------重置数据--------------

update `mamahao-user`.t_member_star set staff_id=888 where member_id in (1995051,1995405);

delete from `db_gd`.`t_tk_order` where trade_id='569786080564134122';
INSERT INTO `db_gd`.`t_tk_order`(`pk_id`, `trade_id`, `trade_parent_id`, `pay_price`, `alipay_total_price`, `tk_total_rate`, `total_commission_rate`, `income_rate`, `total_commission_fee`, `item_title`, `item_price`, `item_id`, `item_num`, `item_img`, `adzone_id`, `refund_tag`, `order_type`, `tk_status`, `special_id`, `relation_id`, `pub_id`, `member_id`, `site_id`, `site_name`, `adzone_name`, `click_time`, `tk_create_time`, `paid_time`, `tk_earning_time`, `create_time`, `update_time`, `remark`) 
VALUES (4, '569786080564134122', '569786080564134122', 9.91, 9.91, 0.20, 0.20, 0.20, 0.02, '浙江电信10元手机话费快充直冲 中国电信10元自动充值 极速缴花费', 9.91, '592489231244', 1, 'http://img.alicdn.com/bao/uploaded/i7/T1nntsXgpsXXb1upjX.jpg', 109255250425, 0, 2, 3, NULL, 2223731011, 474130182, 1995051, NULL, NULL, NULL, NULL, '2019-08-07 16:08:19', '2019-08-07 16:08:27', '2019-08-07 16:10:25', '2019-08-17 15:43:40', '2019-08-19 16:24:35', NULL);
update db_gd.t_order  set confirm_good_time='2019-08-23 22:09:19',
payment_time='2019-08-23 22:09:19' ,
created_time ='2019-08-23 22:09:19' 
where  order_no='MPOS152160164850715test';
 delete from t_star_member_sales where order_no='MPOS152160164850715test';
  delete from t_star_member_sales_detail where order_no='MPOS152160164850715test';
	delete from t_star_member_asset_log where out_serial_number='MPOS152160164850715test';
	
	
	#------------------自有订单入账操作---------------------
update t_star_member_sales set entry_time=CURRENT_DATE-1 where order_no='MPOS152160164850715test';
update t_star_member_sales_detail set entry_time=CURRENT_DATE-1  where order_no='MPOS152160164850715test';

#------------------------淘宝订单

SELECT * FROM t_star_member_sales_detail WHERE (member_id = 1995051 AND sale_type IN (4, 3, 6, 5) AND sale_month > 201808 AND operate_type = 1) 

	# 查看数据
	
select * from t_star_member_sales where order_no='153050104306979';
select * from t_star_member_sales_detail where order_no='MPOS153040170982423' and barcode=6955680216101;
select * from t_star_member_asset_log where out_serial_number='153050104306979';
select * from db_gd.t_order where order_no='153050104306979';

#------重置数据--------------
delete from t_star_member_sales where order_no='602043937776131858';
  delete from t_star_member_sales_detail where order_no='602043937776131858';
	delete from t_star_member_asset_log where out_serial_number='602043937776131858';

#------------------------淘宝订单

SELECT * FROM t_star_member_sales_detail WHERE (member_id = 1995051 AND sale_type IN (4, 3, 6, 5) AND sale_month > 201808 AND operate_type = 1) 

	# 查看数据
	
select * from t_star_member_sales where order_no='609970914895131858';
select * from t_star_member_sales_detail where order_no in ('609915104065131858','609962017875651066');
select * from t_star_member_asset_log where out_serial_number='609970914895131858';
select * from db_gd.t_tk_order where trade_parent_id in ('609970914895131858','609962017875651066');
select * from db_gd.t_tk_refund_order where trade_parent_id='609970914895131858';


delete from t_star_member_sales where order_no='600501025102131858';
delete from t_star_member_sales_detail where order_no='600501025102131858';
delete from t_star_member_asset_log where out_serial_number='600501025102131858';


select * from `mamahao-user`.t_member where member_id in (2041164,2041190);


2239485184  2399656610   2041190

#------重置数据--------------
;


delete from t_star_member_sales where order_no='585884513503125142';
  delete from t_star_member_sales_detail where order_no='585884513503125142';
	delete from t_star_member_asset_log where out_serial_number='585884513503125142';

#---- 入账重置数据------------------

delete from t_star_member_asset_log where out_serial_number='585899105160418386';
update t_star_member_sales set entry_time=curdate()-1 ,sale_status=2 where order_no='585899105160418386';

SELECT
*
FROM
	t_star_member_sales 
WHERE
	( entry_time <= '2019-08-23 11:38:36'  ) 
	OR ( sale_type IN ( 7, 8 ) AND sale_status = 2 ) 




select * from db_gd.t_tk_order where trade_parent_id='604725505084131858';
select * from t_star_member_sales where order_no='604725505084131858';
select * from t_star_member_sales_detail where order_no='604725505084131858';




delete from t_star_member_sales where order_no='604725505084131858';
delete from t_star_member_sales_detail where order_no='604725505084131858';
delete from t_star_member_asset_log where out_serial_number='604725505084131858';



select * from db_gd.t_tk_order where trade_parent_id='609915104065131858';
select * from t_star_member_sales where order_no='609915104065131858';
select * from t_star_member_sales_detail where order_no='609970914895131858';
select * from t_star_member_asset_log where out_serial_number='609915104065131858';


select * from t_star_member_sales where member_phone=18768488799;
select * from t_star_member_sales_detail where member_phone=18768488799;

92924	150210184008230	1995051	16612345678	

select * from t_star_member_sales where member_id=2041026;
select * from t_star_member_sales_detail where member_id=2041026;
select * from t_star_member_asset_log where member_id=2041026;



delete from t_star_member_sales where member_id=2041026;
delete from t_star_member_sales_detail where member_id=2041026;
delete from t_star_member_asset_log where member_id=2041026;


select * from t_star_member_asset;

select * from t_star_asset_log;


create index index_sales_detail_id on t_star_member_sales_detail(`sales_detail_id`);
alter table t_star_member_sales_detail drop   PRIMARY KEY ;
alter table t_star_member_sales_detail add PRIMARY key(order_no,member_id,item_num_id,operate_type);

select * from t_star_member_sales_detail where order_no='MPOS148210133226797';


select order_no,member_id,item_num_id,operate_type, count(1) from t_star_member_sales_detail group by order_no,member_id,item_num_id,operate_type having count(1)>1;



add primary key PK_testNoPK (id

#------------------用户纬度查看-------------------

select * from db_gd.t_order where order_no='152290130249424';
select * from t_star_member_sales where member_id=2040986 and sale_status=2 order by order_time desc;

select * from t_star_member_sales_detail where member_id=2040986 and sale_status=2 order by order_time desc;




select * from t_star_member_sales_detail where member_id=2041024 where ;





