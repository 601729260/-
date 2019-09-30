


6922298562951

select a. from t_gb_stock a 
left join gb_share_item b on a.item_num_id=b.item_num_id
where b.barcode_1=6922298562951;


select count(1) from u_stock_log_detail where status in (1,3,5);


select * from u_stock_log_detail where id='MMH2018112310008070' and barcode=6922298562951;





select count(1) from t_gb_stock where in_qty!=0 and shop_id!=0;

# 检查脚本

select t1.shop_id,t1.in_qty,ifnull(t2.num,0)  from t_gb_stock t1 left  join 
(select to_sid,item_num_id,sum(num) as num from 
(select to_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by to_sid,item_num_id union all
select to_sid,item_num_id,sum(from_num-ifnull(to_num,0))  as num from u_stock_log_detail where bill_type=0 and status in (1,3,5) group by to_sid,item_num_id) a group by to_sid,item_num_id ) t2
on t1.shop_id=t2.to_sid and t1.item_num_id=t2.item_num_id
where  t1.in_qty!=0 and t1.shop_id!=0
and t1.in_qty<>t2.num;



# 修复门店入库途中
create table wgn_gb_stock_bak20181217_1 as select * from t_gb_stock where  t1.in_qty!=0 and t1.shop_id!=0;
update t_gb_stock t1 left  join 
(select to_sid,item_num_id,sum(num) as num from 
(select to_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by to_sid,item_num_id union all
select to_sid,item_num_id,sum(from_num-ifnull(to_num,0))  as num from u_stock_log_detail where bill_type=0 and status in (1,3,5) group by to_sid,item_num_id) a group by to_sid,item_num_id ) t2
on t1.shop_id=t2.to_sid and t1.item_num_id=t2.item_num_id
set t1.in_qty=ifnull(t2.num,0)
where  t1.in_qty!=0 and t1.shop_id!=0
and t1.in_qty<>t2.num;






select t1.storage_id,t1.in_qty,ifnull(t2.num,0)  from t_gb_stock t1 left  join 
(select to_sid,item_num_id,sum(num) as num from 
(select to_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by to_sid,item_num_id union all
select to_sid,item_num_id,sum(from_num-ifnull(to_num,0))  as num from u_stock_log_detail where bill_type=0 and status in (1,3,5) group by to_sid,item_num_id) a group by to_sid,item_num_id ) t2
on t1.storage_id=t2.to_sid and t1.item_num_id=t2.item_num_id
where  t1.in_qty!=0 and t1.storage_id!=0
and t1.in_qty<>t2.num;

#修复仓库入库途中
create table wgn_gb_stock_bak20181217_2 as select * from t_gb_stock where  t1.in_qty!=0 and t1.storage_id!=0;

update t_gb_stock t1 left  join 
(select to_sid,item_num_id,sum(num) as num from 
(select to_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by to_sid,item_num_id union all
select to_sid,item_num_id,sum(from_num-ifnull(to_num,0))  as num from u_stock_log_detail where bill_type=0 and status in (1,3,5) group by to_sid,item_num_id) a group by to_sid,item_num_id ) t2
on t1.storage_id=t2.to_sid and t1.item_num_id=t2.item_num_id
set t1.in_qy=ifnull(t2.num,0) 
where  t1.in_qty!=0 and t1.storage_id!=0
and t1.in_qty<>t2.num;







select t1.storage_id,t1.item_num_id,t1.out_qty,ifnull(t2.num,0)  from t_gb_stock t1 left  join 
(select from_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by from_sid,item_num_id  ) t2
on t1.storage_id=t2.from_sid and t1.item_num_id=t2.item_num_id
where  t1.out_qty!=0 and t1.storage_id!=0
and t1.out_qty<>t2.num;


#修复仓库出库途中
create table wgn_gb_stock_bak20181217_3 as select * from  t_gb_stock t1 where  t1.out_qty!=0 and t1.storage_id!=0;

update t_gb_stock t1 left  join 
(select from_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by from_sid,item_num_id  ) t2
on t1.storage_id=t2.from_sid and t1.item_num_id=t2.item_num_id
set t1.out_qty=ifnull(t2.num,0)
where  t1.out_qty!=0 and t1.storage_id!=0
and t1.out_qty<>t2.num;


1800000080	195196	42	36
1800000080	293848	888	1056
1800000080	303646	56	2

select * from gb_share_item a where a.item_num_id in (195196,293848,303646) and is_deleted=0;

6904591006165
6901755942925
5712449000019

select t1.shop_id,t1.out_qty,ifnull(t2.num,0)  from t_gb_stock t1 left  join 
(select from_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by from_sid,item_num_id  ) t2
on t1.shop_id=t2.from_sid and t1.item_num_id=t2.item_num_id
where  t1.out_qty!=0 and t1.shop_id!=0
and t1.out_qty<>t2.num;



#---------修复门店出库途中

create table wgn_gb_stock_bak20181217_4 as select * from t_gb_stock t1 where t1.out_qty!=0 and t1.shop_id!=0;

update t_gb_stock t1 left  join 
(select from_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by from_sid,item_num_id  ) t2
on t1.shop_id=t2.from_sid and t1.item_num_id=t2.item_num_id
set t1.out_qty=ifnull(t2.num,0) 
where  t1.out_qty!=0 and t1.shop_id!=0
and t1.out_qty<>t2.num;


#########---------------------------------------——##############


# 修复门店入库途中
create table wgn_gb_stock_bak20190718_1 as select * from t_gb_stock t1 where  t1.in_qty!=0 and t1.shop_id!=0;
update t_gb_stock t1 left  join 
(select to_sid,item_num_id,sum(num) as num from 
(select to_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by to_sid,item_num_id union all
select to_sid,item_num_id,sum(from_num-ifnull(to_num,0))  as num from u_stock_log_detail where bill_type=0 and status in (1,3,5) group by to_sid,item_num_id) a group by to_sid,item_num_id ) t2
on t1.shop_id=t2.to_sid and t1.item_num_id=t2.item_num_id
set t1.in_qty=ifnull(t2.num,0)
where  t1.in_qty!=0 and t1.shop_id!=0
and t1.in_qty<>t2.num;

#修复仓库入库途中
create table wgn_gb_stock_bak20190718_2 as select * from t_gb_stock t1 where  t1.in_qty!=0 and t1.storage_id!=0;

update t_gb_stock t1 left  join 
(select to_sid,item_num_id,sum(num) as num from 
(select to_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by to_sid,item_num_id union all
select to_sid,item_num_id,sum(from_num-ifnull(to_num,0))  as num from u_stock_log_detail where bill_type=0 and status in (1,3,5) group by to_sid,item_num_id) a group by to_sid,item_num_id ) t2
on t1.storage_id=t2.to_sid and t1.item_num_id=t2.item_num_id
set t1.in_qty=ifnull(t2.num,0) 
where  t1.in_qty!=0 and t1.storage_id!=0
and t1.in_qty<>t2.num;
#修复仓库出库途中
create table wgn_gb_stock_bak20190718_3 as select * from  t_gb_stock t1 where  t1.out_qty!=0 and t1.storage_id!=0;

update t_gb_stock t1 left  join 
(select from_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by from_sid,item_num_id  ) t2
on t1.storage_id=t2.from_sid and t1.item_num_id=t2.item_num_id
set t1.out_qty=ifnull(t2.num,0)
where  t1.out_qty!=0 and t1.storage_id!=0
and t1.out_qty<>t2.num;


#修复门店出库途中
create table wgn_gb_stock_bak20190718_4 as select * from t_gb_stock t1 where t1.out_qty!=0 and t1.shop_id!=0;

update t_gb_stock t1 left  join 
(select from_sid,item_num_id,sum(from_num)  as num from u_stock_log_detail where bill_type in (1,2,3) and status in (1,3,5) group by from_sid,item_num_id  ) t2
on t1.shop_id=t2.from_sid and t1.item_num_id=t2.item_num_id
set t1.out_qty=ifnull(t2.num,0) 
where  t1.out_qty!=0 and t1.shop_id!=0
and t1.out_qty<>t2.num;


select * from t_gb_stock_20190717 limit 10;

select * from t_gb_stock_20190717 limit 10;



select  cost_price from gb_share_item_ext limit 100;

select avarage_cost_price from t_average_cost_price limit 100;
