
drop table wgn_barcode_sku_20181101;
CREATE TABLE `wgn_barcode_sku_20181101` (
  `barcode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	style_title varchar(32) ,
  `skuId` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


alter table wgn_barcode_sku_20181101 rename co skuid to num;

drop table wgn_barcode_num_result_20181114;
create table wgn_barcode_num_result_20181114 as 
select barcode,min(style_title) as style_title,sum(skuid) as num from wgn_barcode_sku_20181101 group by barcode;
delete from wgn_barcode_num_result_20181114 where num is null;
delete from wgn_barcode_num_result_20181114 where barcode is null;


select * from wgn_barcode_num_result_20181114;




select barcode as '条码',style_title as '商品名称',num as 数量 from wgn_barcode_num_result_20181114;

select sum(num) from wgn_barcode_num_result_20181114;

create table wgn_gb_share_item_20181114 as select * from mamahao_price.gb_share_item  where is_deleted=0 ;

select * from mamahao_price.gb_share_item where barcode_1=0371490040044;

select count(1) from wgn_gb_share_item_20181114;

create table wgn_gb_share_item_less as select * from wgn_gb_share_item_20181114 where barcode_1 in (select barcode from wgn_barcode_num_result_20181114);

select * from wgn_syn_result_20181114;
create index barcode_tmp_1 on wgn_barcode_num_result_20181114(barcode);
create index barcode_tmp_1 on wgn_gb_share_item_less(barcode_1);
create table wgn_syn_result_20181114 as 
select a.barcode,b.item_num_id,a.num from wgn_barcode_num_result_20181114 a 
left join wgn_gb_share_item_less  b 
on  a.barcode=b.barcode_1;


select * from wgn_syn_result_20181114;


select  barcode as '条码', num as '数量' from wgn_syn_result_20181114 where item_num_id is null;

select barcode as '条码',item_num_id, num as '数量' from wgn_syn_result_20181114 where barcode in 
(select barcode from wgn_syn_result_20181114 group by barcode having count(1)>1) order by barcode;


create table wgn_syn_result_20181114_bak as select * from wgn_syn_result_20181114;

delete from wgn_syn_result_20181114 where item_num_id is null;



select * from wgn_syn_result_20181114;


create table wgn_syn_tmp as 
select * from wgn_syn_result_20181114_bak where item_num_id is null and barcode in (11925,
11926,
1511356,
2862,
2888,
2889,
289221,
5118029,
513006,
513007);

update wgn_syn_tmp set barcode=concat('0',barcode);


select * from wgn_syn_tmp;

insert into wgn_syn_result_20181114
select a.barcode,b.item_num_id,a.num from wgn_syn_tmp a 
left join wgn_gb_share_item_20181114  b 
on  a.barcode=b.barcode_1;




