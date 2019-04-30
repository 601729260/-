#-------------上线脚本---------------------------
#alter table t_gb_stock add column scan_status int(2) default 0 comment '0待扫描，1已扫描,2处理出错';


update t_gb_stock set scan_status=1;
CREATE TABLE `t_gb_stock_his` (
  `src` varchar(4) ,
  `shop_id` bigint(20) NOT NULL,
  `storage_id` bigint(20) NOT NULL,
  `item_num_id` bigint(20) NOT NULL,
  `qty` int(11) DEFAULT '0',
  `gb_update_time` datetime DEFAULT NULL,
  `mmh_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loc_pty_num_id` bigint(20) NOT NULL,
  `scan_status` int(2) DEFAULT '0' COMMENT '0待扫描，1已扫描，2失败',
	`his_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

alter table t_gb_stock add scan_update_time timestamp NULL  ;



alter table t_gb_stock_his add scan_update_time timestamp NULL ;

alter table t_gb_stock modify mmh_update_time timestamp NULL  ;

alter table t_gb_stock_his modify mmh_update_time timestamp NULL  ;


insert into t_gb_stock_his select t.*,now() from t_gb_stock t where qty=0 and mmh_update_time<SUBDATE(now(),INTERVAL 2 MONTH);
delete from t_gb_stock t where qty=0 and mmh_update_time<SUBDATE(now(),INTERVAL 2 MONTH);


select count(1) from t_gb_stock;

select count(1) from t_gb_stock_his;
#----------------------数据修复脚本-------------------------
select concat('update t_gb_stock set scan_status=0  where shop_id=',shop_id,' and item_num_id=',item_num_id,';')
  from t_gb_stock t1 where 
exists(select 1 from gb_online t2 where t1.item_num_id=t2.item_id and t1.shop_id=t2.sid and t2.online=1 ) 
and t1.qty=0 order by mmh_update_time desc ;

#--------------------------------------------------
select * from gb_stock where qty=0;

select count(1) from t_gb_stock where qty=0;  ##8491328

select * from t_gb_stock limit 100;

select count(1) from t_gb_stock; ## 10509274

select * from t_gb_stock where qty=0 limit 100;

select * from gb_online limit 100;

select count(1) from gb_online;  ## 537928

select count(1) from gb_online where online=1;   #537929


#--------------------没有库存但还未下架的商品--------------------------------------
select * from t_gb_stock t1 where 
exists(select 1 from gb_online t2 where t1.item_num_id=t2.item_id and t1.shop_id=t2.sid and t2.online=1 ) 
and t1.qty=0  
and shop_id in (select sub_unit_num_id from gb_cort_sub_unit where city_num_id=330100)
order by mmh_update_time desc limit 100;


select * from t_gb_stock t1 where 
not exists(select 1 from gb_online t2 where t1.item_num_id=t2.item_id and t1.shop_id=t2.sid and t2.online=1 ) 
and t1.qty>0 
order by mmh_update_time desc limit 100;

select count(1) from t_gb_stock t1 where exists(select 1 from gb_online t2 where t1.item_num_id=t2.item_id and t2.online=1 ) and t1.qty=0 ;

select sub_unit_num_id from gb_cort_sub_unit where city_num_id=330100 limit 100;

select * from gb_cort_sub_unit where sub_unit_num_id=90000046;

alter table t_gb_stock add column scan_status int(2) default 0 comment '0待扫描，1已扫描';

select * from gb_storage limit 100; 

select * from gb_storage where storage_num_id in 
(6500,
52467,
52572,
6394,
52571,
6358,
6515,
70891,
61551);


select * FROM  gb_style where style_num_id= 930504;
select * from  gb_share_item   where item_num_id=15003845;
SELECT * from gb_online where item_id=15003845 and sid=90000046;
select * from t_gb_stock t1 where  item_num_id=15003845 and shop_id=90000046;
select * from gb_cort_sub_unit where sub_unit_num_id=90000046;


select * FROM  gb_style where style_num_id= 930504;
select * from  gb_share_item   where item_num_id=15003845;
SELECT * from gb_online where item_id=15003845 and sid=90000046;
select * from t_gb_stock t1 where  item_num_id=15003845 and shop_id=90000046;
select * from gb_cort_sub_unit where sub_unit_num_id=90000046;




select * from t_gb_stock where DATE_FORMAT(mmh_update_time,'%Y%m%d%H%i')>=201807301330  and  DATE_FORMAT(mmh_update_time,'%Y%m%d%H%i')<=201807301335  order by mmh_update_time ;

select  DATE_FORMAT(mmh_update_time,'%Y%m%d%H%i') from  t_gb_stock limit 10;


select distinct storage_id from t_gb_stock where shop_id=0 and DATE_FORMAT(mmh_update_time,'%Y%m%d%H')>=2018073013  and  DATE_FORMAT(mmh_update_time,'%Y%m%d%H')<=2018073013  order by mmh_update_time ;


select * from t_gb_stock where shop_id=0 and storage_id=61551 and DATE_FORMAT(mmh_update_time,'%Y%m%d%H')>=2018073013  and  DATE_FORMAT(mmh_update_time,'%Y%m%d%H')<=2018073013  order by mmh_update_time ;



select concat(shop_id,":0:",item_num_id,":",qty), t.* from t_gb_stock t where DATE_FORMAT(mmh_update_time,'%Y%m%d%H%i')>=201807301330  and  DATE_FORMAT(mmh_update_time,'%Y%m%d%H%i')<=201807301335  order by mmh_update_time ;


#-------------------------测试功能是否oK----------------------------------


select * from t_gb_stock t1 where 
exists(select 1 from gb_online t2 where t1.item_num_id=t2.item_id and t1.shop_id=t2.sid and t2.online=1 ) 
order by mmh_update_time desc limit 100;


select * from t_gb_stock  where shop_id!=0 limit 10;

select distinct DATE_FORMAT(mmh_update_time,"%Y%m%d") from t_gb_stock limit 100;

select count(1) from t_gb_stock  ;
select count(1) from t_gb_stock  where  mmh_update_time<SUBDATE(now(),INTERVAL 1 MONTH);



select count(1) from t_gb_stock  where  mmh_update_time<SUBDATE(now(),INTERVAL 1 MONTH);



select * from gb_online limit 10;

select * from gb_online where sid=90070206 and item_id=323473;

INSERT INTO `db_gd_dev`.`gb_online`(`ID`, `COMPANY_ID`, `STYLE_ID`, `ITEM_ID`, `TYPE`, `SID`, `ONLINE`, `ONLINE_TIME`, `QTY`, `SAFE_QTY`, `UPDATE_TIME`) 
VALUES (11317436, 42, 181804, 323473, 0, 90070206, 1, '2018-03-15 12:10:27', 1000, 0, '2018-03-15 12:10:27');

select * from t_gb_stock where shop_id=90070206 and item_num_id=323473;

INSERT INTO `db_gd_dev`.`t_gb_stock`(`src`, `shop_id`, `storage_id`, `item_num_id`, `qty`, `gb_update_time`, `mmh_update_time`, `loc_pty_num_id`, `scan_status`) 
VALUES ('gb', 90070206, 56972, 323473, 1000, '2016-11-24 17:07:32', '2018-08-02 11:14:24', 1, 1);


update t_gb_stock set qty=1000,scan_status=0 where shop_id=90070206 and item_num_id=323473;
select * from gb_online where sid=90070206 and item_id=323473;
select * from t_gb_stock where shop_id=90070206 and item_num_id=323473;

select * from t_gb_stock where shop_id=8846;

#-----------------测试移历史和错误补偿功能---------------------------------------
update t_gb_stock set qty=500,scan_status=0 where shop_id=90070206 and item_num_id=309188;

update t_gb_stock set qty=0,scan_status=1 where shop_id=90070206 and item_num_id=323473;
update t_gb_stock set mmh_update_time=subdate(now(),INTERVAL 3 MONTH),src='gb' where shop_id=8846;
delete from t_gb_stock_his;
INSERT INTO `db_gd_dev`.`t_gb_stock`(`src`, `shop_id`, `storage_id`, `item_num_id`, `qty`, `gb_update_time`, `mmh_update_time`, `loc_pty_num_id`, `scan_status`) VALUES ('', 8846, 48552, 113393, 1000, '2017-07-07 10:10:12', '2018-05-02 17:17:56', 1, 1);
INSERT INTO `db_gd_dev`.`t_gb_stock`(`src`, `shop_id`, `storage_id`, `item_num_id`, `qty`, `gb_update_time`, `mmh_update_time`, `loc_pty_num_id`, `scan_status`) VALUES ('', 8846, 48552, 364523, 1000, '2017-07-07 10:10:12', '2018-05-02 17:17:56', 1, 1);
INSERT INTO `db_gd_dev`.`t_gb_stock`(`src`, `shop_id`, `storage_id`, `item_num_id`, `qty`, `gb_update_time`, `mmh_update_time`, `loc_pty_num_id`, `scan_status`) VALUES ('', 8846, 48552, 392721, 1000, '2017-07-07 10:10:12', '2018-05-02 17:17:56', 1, 1);

select * from t_gb_stock where  shop_id=8846;

select * from t_gb_stock_his where  shop_id=8846;



explain select * from t_gb_stock  where  mmh_update_time>DATE_SUB(NOW(),INTERVAL 1 DAY) and  scan_status=1 and mod(shop_id,2)=1 ;


select DATE_SUB(NOW(),INTERVAL 120 MINUTE) from dual;





