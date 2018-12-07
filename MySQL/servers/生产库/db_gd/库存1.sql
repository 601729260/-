
#----------------库存不对排查常用sql-------------------------------------

#---条码 门店查库存变化记录

select id,item_num_id,sid,create_time,pre_qty,qty_change from u_goods_stock_log a where
exists(select 1 from gb_share_item b where barcode_1=6927852700817 and is_deleted=0 and a.item_num_id=b.item_num_id)
and  sid=1500000115 order by create_time desc;

select item_num_id from gb_share_item b where barcode_1=8716200719247 and is_deleted=0 ;







#------ 查看门店--------
select * from gb_cort_sub_unit where sub_unit_num_id in (1500000102,1500000148) limit 10;




#---------唯亭点库存修复，文灿反馈
create table t_gb_stock_bak20181126 as select * from t_gb_stock  where shop_id=1500000115 and item_num_id=1000000294;
update t_gb_stock set qty=2 where shop_id=1500000115 and item_num_id=1000000294;


#------------查看是否有重复收货-------

select id,item_num_id,qty_change,count(1) from u_goods_stock_log where id in (
'MMH2018111210004170',
'MMH2018110710002600',
'MMH2018111810006116')
and sid=1500000115
group by id,item_num_id,qty_change  having count(1)>1;



select id,item_num_id,p_qty_change,count(1) from u_goods_stock_log where  sid=1800000080
group by id,item_num_id,p_qty_change   having count(1)>1 order by id desc limit 1000;


#----------------库存记录显示问题

select * from u_goods_stock_log where id='MMH2018112710009531';

select * from u_stock_log_his where id='MMH2018112710009531';
select * from u_stock_log where id='MMH2018112710009531';

 select * from u_stock_log_detail where id='MMH2018112710009531';
 select * from u_stock_log_detail_his where id='MMH2018112710009531';


#------盘点记录差异-------------------
select b.barcode,b.qty, a.qty_change,c.qty from (select sid,item_num_id,sum(qty_change) as qty_change from u_goods_stock_log where sid=1500000115 group by sid,item_num_id)
a left join zbw_wb_original_stock_back_20181104 b on a.item_num_id=b.item_num_id and a.sid=b.sid
left join t_gb_stock c on a.item_num_id=c.item_num_id and a.sid=c.shop_id
where a.sid=1500000115
and b.sid=1500000115
and c.shop_id=1500000115;





#----------采购单处理错误数据



----------------------------
select * from  gb_share_item where barcode_1=6927852700817 and is_deleted=0;

select * from t_gb_stock where item_num_id=1000012092 and shop_id=1500000108;

select * from u_goods_stock_log where  item_num_id=1000012092 and sid=1500000108;

select  p_qty+qty  from t_gb_stock_20181127 where storage_id=1800000102 and item_num_id=1100003856;




select * from u_order_line where order_num 

select * from gb_cort_sub_unit where sub_unit_name like '%千灯店%';

select * from gb_cort_sub_unit where sub_unit_name like '%金山%';

select * from gb_cort_sub_unit limit 100;


select * from u_goods_stock_log where id='MMH2018110510002041';


select * from u_stock_log_detail where barcode=8712045030998 limit 1;


select * from u_goods_stock_log where item_num_id=374486 and sid=1500000102;

select * from u_goods_stock_log 




select * from t_gb_stock limit 1;




select * from wgn_check_stock b where not  exists (

create wgn_check_stock_bak as select * from wgn_check_stock ;
delete from  wgn_check_stock  where barcode='02888' and num=500;
delete from  wgn_check_stock where barcode='02889' and num=650;
update wgn_check_stock set num=49900+500 where barcode='02888';
update wgn_check_stock set num=50200+650 where barcode='02889';

delete from wgn_check_stock a where item_num_id  in 

create table wgn_check_stock_1 as 
select barcode ,item_num_id,sum(num) as num from wgn_check_stock group by barcode,item_num_id;

select sum(num) from wgn_check_stock;

create table wgn_barcode_item as  
select distinct barcode,item_num_id  from u_stock_log_detail_pdbak20181113 a where  a.barcode in (
3760170400068,
3760179010060,
3760179010718,
3760179010923,
3760179012200,
3760179012217,
3760179012224,
3760179012316,
4008976527589,
4902011851151,
4902011851182,
4902011851199,
5712449000033,
6923557810011,
6923557810028,
6923557810059,
6923557810066,
6923557811025,
6923557811032,
6923557811049,
6923557811056,
6923557820010,
6923557820027,
6923557820041,
6923557820058,
6923557820065,
6923557821017,
6926333800107,
6926333800114,
6946707200203,
6946707200210,
6952265500013,
6952265500044,
7613035204355,
8716200716581,
8718117605897,
8718117605903,
8718117605910,
8718117605927,
8809148009591,
9311770599658,
9311770600378,
9421028145763,
9421028145787,
9421901968076,
9421902960000,
9421902960017,
9421902960024
);
select b.barcode   from wgn_check_stock b group by b.barcode having count(1)>1;



select * from u_stock_log_detail_bak201811132 where id='MMH2018111310004336';


insert into wgn_check_stock
select barcode,item_num_id,check_num from u_stock_log_detail_pdbak20181113 where id in (
'MMH2018111310004336', 
'MMH2018111310004348', 
'MMH2018111310004347', 
'MMH2018111310004345', 
'MMH2018111310004337', 
'MMH2018111310004341', 
'MMH2018111310004334', 
'MMH2018111310004330', 
'MMH2018111310004328', 
'MMH2018111310004331', 
'MMH2018111310004325', 
'MMH2018111310004324', 
'MMH2018111310004316', 
'MMH2018111310004317', 
'MMH2018111310004299', 
'MMH2018111310004298', 
'MMH2018111310004307', 
'MMH2018111310004303', 
'MMH2018111310004300');



select id, barcode as 条码 ,check_num as 数量 from u_stock_log_detail_pdbak20181113 where id in (
'MMH2018111310004336', 
'MMH2018111310004348', 
'MMH2018111310004347', 
'MMH2018111310004345', 
'MMH2018111310004337', 
'MMH2018111310004341', 
'MMH2018111310004334', 
'MMH2018111310004330', 
'MMH2018111310004328', 
'MMH2018111310004331', 
'MMH2018111310004325', 
'MMH2018111310004324', 
'MMH2018111310004316', 
'MMH2018111310004317', 
'MMH2018111310004299', 
'MMH2018111310004298', 
'MMH2018111310004307', 
'MMH2018111310004303', 
'MMH2018111310004300');


create table wgn_check_stock_1 as 
select barcode ,item_num_id,sum(num) as num from wgn_check_stock group by barcode,item_num_id;


select sum(num) from wgn_check_stock_1

create table wgn_check_stock_1_bak as select * from wgn_check_stock_1;
delete from 

select * from wgn_check_stock_1 a where exists(select 1 from wgn_barcode_item b where a.barcode =b.barcode COLLATE utf8mb4_general_ci  and a.item_num_id!=b.item_num_id);


wgn_check_stock_1 where item_num_id in (select item_num_id from wgn_check_stock_minid);


select sum(num) from  wgn_check_stock_1 ; 


select barcode as '条码',num as '数量' from wgn_check_stock_1;

#----------------------最终更新库存数据-------------------
create table t_gb_stock_bak_181114 as select * from t_gb_stock where storage_id=1800000080;
insert into t_gb_stock(src,storage_id,item_num_id,loc_pty_num_id,scan_status,p_qty)
select 'mmh',1800000080,a.item_num_id,1,0,a.num  from wgn_check_stock_1  a where not exists(select 1 from t_gb_stock b  where b.storage_id=1800000080 and a.item_num_id=b.item_num_id);

update t_gb_stock  a 
left join wgn_check_stock_1 b
on  a.item_num_id=b.item_num_id
set a.p_qty=format(b.num*0.8,0),
a.qty=num-format(b.num*0.8,0) ,
scan_status=0 ,
scan_update_time=now() 
where a.storage_id=1800000080;


select * from wgn_check_stock_1 limit 100;

select * from t_gb_stock where item_num_id=1100001390;

select num ,format(num*0.8,0),num-format(num*0.8,0) from wgn_check_stock_1;

select count(1) from wgn_check_stock_1;

select * from t_gb_stock limit 1;

create table t_gb_stock_bak_181114 as select * from t_gb_stock a where a.storage_id=1800000080;

update t_gb_stock c left join 
zbw_t_gb_stock_20181114 a
on a.item_num_id=c.item_num_id
set c.p_qty=a.p_qty,
c.qty=a.qty,
c.scan_status=0,
c.mmh_update_time=now()
where   not exists(select 1 from wgn_check_stock_1 b
where a.item_num_id=b.item_num_id) 
and a.storage_id=1800000080
and c.storage_id=1800000080;


select a.item_num_id ,a.p_qty,a.qty as '数量',c.BARCODE_1 as '条码' from zbw_t_gb_stock_20181114 a left join gb_share_item  c on a.item_num_id=c.item_num_id 
where  c.IS_DELETED=0 and not exists(select 1 from wgn_check_stock_1 b where a.item_num_id=b.item_num_id) and a.storage_id=1800000080;






select sum(num) from wgn_check_stock_1;
