
select * from gb_cort_sub_unit where sub_unit_name like '%又一城%' limit 100;
select * from gb_cort_sub_unit where sub_unit_name like '%梅李%' limit 100;
select * from gb_cort_sub_unit where sub_unit_name like '%临湖%' limit 100;

create table wgn_barcode_num_20181126 as select * from wgn_barcode_num_20181101 where 1=2;

create table wgn_barcode_num_1500000119_yyc as select * from wgn_barcode_num_20181101 where 1=2;
create table wgn_barcode_num_1500000114_ml as select * from wgn_barcode_num_20181101 where 1=2;
create table wgn_barcode_num_1500000116_lh as select * from wgn_barcode_num_20181101 where 1=2;

select * from wgn_barcode_num_1500000119_yyc;
select * from wgn_barcode_num_1500000114_ml;
select * from wgn_barcode_num_1500000116_lh;

delete from  wgn_barcode_num_1500000119_yyc where barcode in ('求和项:盘点数量','条码','总计');
delete from  wgn_barcode_num_1500000114_ml where barcode in ('求和项:盘点数量','条码','总计');
delete from  wgn_barcode_num_1500000116_lh where barcode in ('求和项:盘点数量','条码','总计');

drop table wgn_barcode_num_20181126;
create table wgn_barcode_num_20181126 as 
select 1500000119 as sid ,'又一城' as sid_name, barcode,num from wgn_barcode_num_1500000119_yyc union all
select 1500000114 as sid ,'梅李' as sid_name ,barcode,num from wgn_barcode_num_1500000114_ml union all
select 1500000116 as sid ,'临湖' as sid_name, barcode,num from wgn_barcode_num_1500000116_lh ;

delete from wgn_barcode_num_20181126 where barcode is null;


create table wgn_barcode_num_20181126_result as 
select sid,sid_name,barcode,sum(num) as num from wgn_barcode_num_20181126 group by sid,sid_name,barcode;



select a.sid,b.item_num_id,a.num from wgn_barcode_num_20181126_result a
left join gb_share_item b 
on a.barcode=b.BARCODE_1
where b.IS_DELETED=0;


update wgn_barcode_num_20181126_result a  
left join gb_share_item b 
on a.barcode=b.BARCODE_1
set a.item_num_id=b.item_num_id
where b.IS_DELETED=0;


select * from wgn_barcode_num_20181126_result;

create table t_gb_stock_bak_2018112302 as select * from t_gb_stock where sid in (1500000114,
1500000116,
1500000119);

update t_gb_stock a
inner join wgn_barcode_num_20181126_result b
on a.shop_id=b.sid
and a.item_num_id=b.item_num_id
set a.qty=b.num
where a.shop_id in (1500000114,
1500000116,
1500000119);

select * from t_gb_stock limit 10;


INSERT INTO `t_gb_stock`(`src`, `shop_id`, `storage_id`, `item_num_id`, `qty`, `gb_update_time`, `mmh_update_time`, `loc_pty_num_id`, `scan_status`, `scan_update_time`, `p_qty`, `in_qty`, `out_qty`) 
select 'gb', sid, 0, item_num_id, 0, now(), now(), 1, 0, now(), 0, 0, 0 from wgn_barcode_num_20181126_result a where not exists( select 1 from t_gb_stock b where a.sid=b.shop_id and a.item_num_id=b.item_num_id);









