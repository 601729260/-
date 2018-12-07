SELECT
	item_num_id AS sku,
	style_num_id AS '商品ID',
	price / 100 AS '价格' 
FROM
	t_daily_standard_price_2;
SELECT
	concat( 'sku', ',', '商品ID', ',', '价格' ) UNION ALL
SELECT
	concat( item_num_id, ',', style_num_id, ',', price / 100 ) 
FROM
	t_daily_standard_price_2 
	LIMIT 100;#---------供应商导出服务
1,
'购销',
2,
'代销',
3,
'联营'



#----------------------------------供应商

SELECT
	provider_id AS 供应商ID,
	provider_name AS 供应商名称,
	linkman_name AS 联系人,
	contact_number AS 联系电话,
	( CASE WHEN bussiness_model_type = '1' 
	THEN '1购销' WHEN bussiness_model_type = '2' 
	THEN '2代销' WHEN bussiness_model_type = '3' 
	THEN '3联营' END ) AS 经营方式,
	(
	CASE	
			WHEN clearing_type = '1' THEN
			'1预付款' 
			WHEN clearing_type = '2' THEN
			'2月结' 
			WHEN clearing_type = '3' THEN
			'3实销月结' 
			WHEN clearing_type = '4' THEN
			'4票到' 
			WHEN clearing_type = '5' THEN
			'5货到' 
		  END 
		) AS 结算方式,
		concat( clearng_cycle, "天" ) AS 结算周期 ,
		opening_bank_name as 开户行,
		bank_account as 开户帐号,
		bank_account_name as 户名,
		tax_account as 税务登记号,
		provider_prv_name as 省份,
		provider_city_name as 城市,
		provider_area_name as 地区,
		provider_add as 详细地址
		
FROM
	t_provider_info;
	where provider_name in ('北京慧康美达科技有限公司','常熟妈宝孕婴有限公司','常熟市飞扬儿童用品销售有限公司','福建爱得利用品有限公司','好孩子商贸（中国）有限公司','昆山虹浩母婴用品商行','昆山皇家之星婴童用品有限公司','上海菩宁国际贸易有限公司','苏州贝怡商贸有限公司','苏州能瑞商贸有限公司');

	
	alter table t_provider_info add cooperate_status_name varchar(32) comment '合作状态名称';
	alter table t_provider_info add cooperate_status int(11) comment '合作状态';
	
	
	insert into t_provider_info(
	provider_id ,
	provider_name ,
	linkman_name ,
	contact_number,
	bussiness_model_type,
	clearing_type ,
	clearng_cycle ,
		opening_bank_name,
		bank_account ,
		bank_account_name ,
		tax_account ,
		provider_prv_name ,
		provider_city_name ,
		provider_area_name ,
		provider_add, 
		cooperate_status_name	)	
values (
	t_provider_info;
	

select * from t_provider_info where provider_name in ('北京慧康美达科技有限公司','常熟妈宝孕婴有限公司','常熟市飞扬儿童用品销售有限公司','福建爱得利用品有限公司','好孩子商贸（中国）有限公司','昆山虹浩母婴用品商行','昆山皇家之星婴童用品有限公司','上海菩宁国际贸易有限公司','苏州贝怡商贸有限公司','苏州能瑞商贸有限公司');


	
	select replace(contact_number,'.0','') from t_provider_info;
	
	update t_provider_info set contact_number=replace(contact_number,'.0','');
	
	
	select provider_name ,count(1) from t_provider_info   group by provider_name having count(1)>1;
	
	select  * from t_provider_info where provider_name='南通蓝岳商贸有限公司';
	
	
	
	select * from gb_style limit 10 ;
	select * from gb_style_ext limit 10;
	select * from gb_share_item limit 10;
	
	select barcode_1,item_num_id,
	a.style_num_id,
	b.unit,
	c.STYLE_ID,c.style_title,
	concat(a.color_name,'/',a.size_name)
	from gb_share_item a ,
	gb_style_ext b ,
	gb_style c 
	where a.style_num_id=b.style_num_id
	and a.style_num_id=c.style_num_id
	and barcode_1 in ();
	
	
	select provider_name,count(1) from t_provider_info group by provider_name having count(1)>1;
	
	
	select * from t_provider_info where provider_id in (
	select min(seq_id)  from (select provider_id ,provider_name from t_provider_info group by provider_id,provider_name having count(1)>1) b ) order by provider_id;
	
	create table t_provider_info_bak20181030 as select * from t_provider_info;
	delete from t_provider_info where seq_id in ( select seq_id from  (
	select provider_id,provider_name ,min(seq_id),count(1)  from t_provider_info group by provider_id,provider_name having count(1)>1) b);
	
	create table wgn_tmp as select provider_id,provider_name ,min(seq_id) as seq_id  from t_provider_info group by provider_id,provider_name having count(1)>1;
	delete from t_provider_info where seq_id in (select seq_id from wgn_tmp);
	drop table wgn_tmp;
	
	
	#------------------------
	
	select * from t_gb_stock limit 11;
	select  * from t_provider_goods;
	
	
	
	
	
	
	select item_num_id,barcode_1 from gb_share_item where barcode_1 in (
	select barcode_1 from gb_share_item where STYLE_NUM_ID in  (
select STYLE_NUM_ID from  gb_style where STYLE_NUM_ID in (
select STYLE_NUM_ID from gb_share_item where ITEM_NUM_ID in (
  select item_num_id from t_gb_stock where shop_id > 1500000000 or storage_id > 1800000000 group by item_num_id  
) group by style_num_id
) and IS_DELETED = 1) )


	
	select ITEM_NUM_ID,barcode_1 from gb_share_item ;
	
	
	
	
	
SELECT 
 o.CREATE_TIME,o.*
FROM
  u_order o 
  INNER JOIN u_order_line ol 
    ON o.`order_no` = ol.`order_no` 
WHERE o.order_type = 4 
AND ol.`item_type` = 3
ol.item_id in ()
ORDER BY o.CREATE_TIME DESC ;




SELECT 
 o.CREATE_TIME,o.*
FROM
  u_order o 
  INNER JOIN u_order_line ol 
    ON o.`order_no` = ol.`order_no` 
WHERE o.order_type = 1 
AND ol.`item_type` = 3
and ol.item_id in ()
ORDER BY o.CREATE_TIME DESC ;


	#---------------------------------单据
	
	select  * from u_stock_log where id="MMH2018103110000480";
	
	
	 SELECT
* 
FROM
	u_stock_log t1 
WHERE
	1 = 1 
	AND ( ( t1.from_sid =? AND t1.STATUS != 6 ) OR t1.to_sid =? ) 
	AND t1.bill_type =2 
ORDER BY
	create_time DESC 
	
	select * from u_stock_log_detail;
	
	select * from u_goods_stock_log limit 100;
	select id, sid,item_num_id,p_qty_change,qty_change,create_time from u_goods_stock_log where p_qty_change=-qty_change and sid=1800000080;
	
	
	select * from u_goods_stock_log where sid=1800000080 and item_num_id=293848 order by create_time asc;
	
	select sum(p_qty_change) from u_goods_stock_log where sid=1800000080 and item_num_id=293848
	
	
	select id,sid, item_num_id,qty_change,create_time from u_goods_stock_log where sid!=1800000080 and left(id,3)='MMH' order by sid ,item_num_id,create_time desc;
	

select provider_id,count(1) from t_provider_info group by provider_id having count(1)>1;

select * from t_provider_info where provider_id=10015;

select * from u_stock_log_detail where id='MMH2018110310001482';



select * from u_stock_log where id='MMH2018110310001482';

select * from u_stock_log_detail where id='MMH2018110310001482';

delete from  u_stock_log where id='MMH2018110310001482';

MMH2018110310001482


select 
select * from u_stock_log order by create_time desc;



select DATE_FORMAT(create_time,'%Y%m%d%H'),count(1) from u_stock_log group  by DATE_FORMAT(create_time,'%Y%m%d%H') desc;


select DATE_FORMAT(create_time,'%Y%m%d%H'),count(1) from u_stock_log_detail group  by DATE_FORMAT(create_time,'%Y%m%d%H') desc;


select  DATE_FORMAT(create_time,'%Y%m%d%H'),id, count(1) from u_stock_log_detail group by DATE_FORMAT(create_time,'%Y%m%d%H') asc,id order by DATE_FORMAT(create_time,'%Y%m%d%H') desc;




select  DATE_FORMAT(create_time,'%Y%m%d%H'),operate_type,count(1) from u_stock_log_his group  by DATE_FORMAT(create_time,'%Y%m%d%H') ,operate_type order by DATE_FORMAT(create_time,'%Y%m%d%H') desc ;







select  DATE_FORMAT(create_time,'%Y%m%d%H'),operate_type,count(1) from u_stock_log group  by DATE_FORMAT(create_time,'%Y%m%d%H') ,operate_type order by DATE_FORMAT(create_time,'%Y%m%d%H') desc ;


select * from u_stock_log where  DATE_FORMAT(create_time,'%Y%m%d%H')=2018110418 and operate_type=1;

select * from u_stock_Log_detail where id='MMH2018110410001767';



select * from u_stock_Log_his  where id='MMH2018110410001767';


select * from u_stock_log where id='MMH2018110410001709';


select * from u_stock_log_detail where id='MMH2018110410001709';



delete from u_stock_log where id='MMH2018110410001709';
delete  from u_stock_log_detail where id='MMH2018110410001709';

select * from u_stock_log where id='MMH2018110510000992';



select * from u_goods_stock_log where operate_type=7;

select sum(p_qty_change) from u_goods_stock_log where operate_type=7;


select bill_type,count(1) from u_goods_stock_log where operate_type=7 group by bill_type;


select * from u_goods_stock_log where create_time>'2018-11-05 15:43:00' and operate_type=7 ;




select distinct sid from  u_goods_stock_log where operate_type=7

select * from u_goods_stock_log where sid=1500000110 and operate_type=7;


create table u_goods_stock_log_bak20181105 as select * from u_goods_stock_log;
update u_goods_stock_log set p_qty_change=-p_qty_change ,qty_change=-qty_change where operate_type=7 and (qty_change<0 or p_qty_change<0);




select id ,count(1) from u_stock_log_detail group by id order by create_time desc;





select * from u_stock_log where id is null;


select * from u_stock_log where id='null';


select count(1) from u_stock_log;

select count(1) from u_stock_log_detail;

select count(1) from u_stock_log_detail where id in (select id  from u_stock_log where bill_type=2 and from_sid=1800000080);



#------------------修复重复提交的数据


create table u_goods_stock_log_bak2018110523 as select * from u_goods_stock_log;
drop table wgn_tmp;
create table wgn_tmp as select id,sid,item_num_id,operate_type,bill_type,qty_change,p_qty_change,min(seq_id) as seq_id from u_goods_stock_log group by id,sid,item_num_id,operate_type,bill_type,qty_change,p_qty_change having count(1)>1;

delete from  u_goods_stock_log  where exists(select 1 from wgn_tmp  b where u_goods_stock_log.id=b.id and u_goods_stock_log.sid=b.sid and u_goods_stock_log.item_num_id and u_goods_stock_log.operate_type=b.operate_type and u_goods_stock_log.bill_type=b.bill_type and b.qty_change=u_goods_stock_log.qty_change and u_goods_stock_log.p_qty_change=b.p_qty_change and u_goods_stock_log.seq_id!=b.seq_id);
drop table wgn_tmp;

select * from wgn_tmp;


create table u_goods_stock_log_bak2018110522 as select * from u_goods_stock_log;
insert into u_goods_stock_log select * from  u_goods_stock_log_bak2018110521 a where not exists(select 1 from u_goods_stock_log b where a.seq_id=b.seq_id);


create table wgn_tmp_1 as 
		select id,item_num_id,p_qty_change,min(seq_id) as seq_id,count(1) from u_goods_stock_log where id in (
	select  id from u_stock_log where  status=6  and id  in (
			select id from u_goods_stock_log where operate_type=3 and p_qty_change<0))
			group by  id,item_num_id,p_qty_change  union all 
				select id,item_num_id,p_qty_change,min(seq_id),count(1) from u_goods_stock_log where operate_type=3 and p_qty_change<0 group by id,item_num_id, p_qty_change having count(1)>1;


create table u_goods_stock_log_bak20181107 as select * from u_goods_stock_log;
delete from u_goods_stock_log where seq_id in (select seq_id from wgn_tmp_1);
update u_goods_stock_log set operate_type=8 where operate_type=3;
drop table wgn_tmp;


select * from u_goods_stock_log where sid=1800000080 and item_num_id=1000000853;


select * from gb_share_item where barcode_1=7613035260160;

select id 单据编号 ,p_qty_change  as 公共库存变化,qty_change app库存变化 from u_goods_stock_log where sid=1800000080 and  item_num_id in  (374326) and  id is not  null;


select * from zbw_t_gb_stock_2018110702 where storage_id=1800000080 and item_num_id in (374326,1100002347);

select sum(p_qty_change) from u_goods_stock_log where sid=1800000080 and item_num_id in (374326,1100002347);


select * from u_goods_stock_log where sid=1800000080 and item_num_id in (374326,1100002347);

select * from wgn_tmp_1  where  item_num_id in (374326,1100002347);


select  sum(qty_change) ,sum(p_qty_change) from u_goods_stock_log_bak20181107 where sid=1800000080 and  item_num_id=374326;


select * from t_gb_stock where storage_id=1800000080 and item_num_id in (374326,1100002347);


select * from t_gb_stock where storage_id=1800000080 and item_num_id in (374326,1100002347);

select * from u_goods_stock_log  where sid 


###备份
create table u_goods_stock_log_181108  select * from u_goods_stock_log where item_num_id in (
	select gsi.ITEM_NUM_ID  from gb_share_item gsi 
	LEFT JOIN gb_style gs on gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	where gsi.ITEM_NUM_ID in (
   select DISTINCT item_num_id from u_goods_stock_log 

	) and gs.IS_DELETED = 1 
) ;

###查询未被删除的商品档案
select 
## 	 aaa.item_num_id as '未被删除的item_num_id', aaa.IS_DELETED as '状态1',aaa.barcode_1 as '条码1',
## 	 bbb.item_num_id as '删除的item_num_id',bbb.IS_DELETED as '状态2',bbb.barcode_1 as '条码2',
 CONCAT("update u_stock_log_detail set item_num_id = ",aaa.item_num_id ," where item_num_id = ",bbb.item_num_id," ;")
 from (

select gsi.item_num_id ,gsi.barcode_1,gs.IS_DELETED from gb_share_item gsi left JOIN  gb_style gs on gsi.style_num_id = gs.style_num_id
 where gsi.barcode_1 in (
	select gsi.BARCODE_1  from gb_share_item gsi 
	LEFT JOIN gb_style gs on gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	where gsi.ITEM_NUM_ID in (

   select DISTINCT item_num_id from u_goods_stock_181108 
	
) and gs.IS_DELETED = 1 
) and gs.is_deleted = 0
)aaa

LEFT JOIN 
(
###查询被删除的商品档案
select gsi.item_num_id ,gsi.barcode_1,gs.IS_DELETED from gb_share_item gsi left JOIN  gb_style gs on gsi.style_num_id = gs.style_num_id
 where gsi.barcode_1 in (
	select gsi.BARCODE_1  from gb_share_item gsi 
	LEFT JOIN gb_style gs on gsi.STYLE_NUM_ID = gs.STYLE_NUM_ID
	where gsi.ITEM_NUM_ID in (

   select DISTINCT item_num_id from u_stock_log_detail 
	
) and gs.IS_DELETED = 1 
) and gs.is_deleted = 1
)bbb on aaa.barcode_1 = bbb.barcode_1 ;

#--------------------------------修复多收货----------------------------------------

create table u_stock_log_detail_MMH2018110810002996 as select * from u_stock_log_detail where id='MMH2018110810002996';



update u_stock_log_detail set to_num=0 where id='MMH2018110810002996' and barcode in (
6948012000080,
6948012001544,
6948012001551,
6948012000066,
6948012000059
);






create table u_goods_stock_log_MMH2018110810002996 as 
select * from u_goods_stock_log where id='MMH2018110810002996'  and item_num_id in (
1000002162,
1000002229,
1000002228,
1000002148,
1000002151);

delete  from u_goods_stock_log where id='MMH2018110810002996'  and item_num_id in (
1000002162,
1000002229,
1000002228,
1000002148,
1000002151);


create table t_gb_stock_MMH2018110810002996 as 
select * from t_gb_stock where storage_id=1800000080 and item_num_id in 
(
1000002162,
1000002229,
1000002228,
1000002148,
1000002151);

update  t_gb_stock t2 set   t2.p_qty = t2.p_qty - (select p_qty_change from u_goods_stock_log_MMH2018110810002996 t where t.sid=t2.storage_id and t.item_num_id =t2.item_num_id )
where exists(select 1 from u_goods_stock_log_MMH2018110810002996 t where t.sid=t2.storage_id and t.item_num_id =t2.item_num_id )
and storage_id=1800000080 and item_num_id in 
(
1000002162,
1000002229,
1000002228,
1000002148,
1000002151);


		select * from u_stock_log where id='MMH2018110610002247';
		
		
	delete from u_stock_log where id='MMH2018110810003081';
	delete from u_stock_detail_log where id='MMH2018110810003081';
	
	
	select * from u_goods_stock_log where id='MMH2018110110000671' and item_num_id=1000313092;


select * FROM t_daily_

select * from t_city_style_price_base_5 limit 100;

select * from gb_style where style_id='M20001' limit 10;

select * from t_shop_style_price_base_5 where style_num_id=1100001541;
select * from t_city_style_price_base_5 where style_num_id=1100001541;

select * from t_shop_style_price_base_5 where style_num_id=913516;
select * from t_city_style_price_base_5 where style_num_id=913516 and city_num_id=330100;

select * from gb_city where city_name like '%杭州%';




create table  u_stock_MMH2018110510002080  as select * from u_stock_log where id='MMH2018110510002080';
update u_stock_log set provider_id=10282 where provider_id=10081 and id='MMH2018110510002080';















