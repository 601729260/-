#-----------------根据佣金比例修复
select max(direct_bonus) ,item_num_id from t_star_shop_goods_bonus_log
where item_num_id in (
select distinct order_no, item_num_id,update_time from mamahao_warehouse.t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>0
and operate_type=1)
group by item_num_id


#----------------需要处理的订单及科目---------------------

drop table wgn_cs;
create table wgn_cs(order_no varchar(32),item_num_id bigint(20),order_created_time timestamp);
insert into wgn_cs  
select distinct a.order_no,a.item_num_id,a.order_created_time from mamahao_warehouse.t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>0
and operate_type=1;




--第一批比例
create table wgn_bl_1(item_num_id bigint(20),order_no varchar(32),create_time timestamp);
insert into wgn_bl_1
select a.item_num_id,b.order_no,max(a.create_time) from mamahao_warehouse.t_star_shop_goods_bonus_log  a inner join 
(select * from mamahao_warehouse.t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>0
and operate_type=1) b 
on a.item_num_id=b.item_num_id 
where a.create_time<b.order_created_time
group by a.item_num_id,b.order_no;

select * from wgn_bl_1;

create table wgn_bl_result(order_no varchar(32),item_num_id bigint(20),direct_bonus bigint(20));
delete from wgn_bl_result;
insert into wgn_bl_result
select b.order_no,a.item_num_id,a.direct_bonus from  mamahao_warehouse.t_star_shop_goods_bonus_log  a
inner join wgn_bl_1 b
on a.item_num_id=b.item_num_id
and a.create_time=b.create_time;


select * from wgn_bl_result;


select distinct item_num_id from wgn_cs a 
where not exists(select 1 from wgn_bl_result b  where a.order_no=b.order_no and a.item_num_id=b.item_num_id);

select * from  mamahao_warehouse.t_star_shop_goods_bonus_log_ext limit 100;


select * from mamahao_warehouse.t_star_shop_goods_bonus_log where item_num_id in(
15015485,
15015555,
15015868,
15015944,
1100024487,
1100024484,
1100024486,
1100024485)
and create_time<'2019-10-11 00:00:00';

select * from t_star_member_sales_detail a inner join t_star_shop_goods_bonus_log b on a.item_num_id=b.item_num_id and b.create_time<a.order_create_time 
where a.update_time>'2019-10-11 03:00:00' and channel_type in (0) and a.order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>10
and operate_type=1;

select b.direct_bonus,a.* from mamahao_warehouse.t_star_member_sales_detail a 
inner join wgn_bl_result b on a.order_no=b.order_no and a.item_num_id=b.item_num_id
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>0
and operate_type=1


select concat("update t_star_member_sales_detail a set rate=",b.direct_bonus/100," where a.sales_detail_id=",sales_detail_id,";"),a.* from mamahao_warehouse.t_star_member_sales_detail a 
inner join wgn_bl_result b on a.order_no=b.order_no and a.item_num_id=b.item_num_id
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
#and rate=0
and real_amount>0
and operate_type=1

create table 
select a.* from mamahao_warehouse.t_star_member_sales_detail a 
inner join wgn_bl_result b on a.order_no=b.order_no and a.item_num_id=b.item_num_id
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
#and rate=0
and real_amount>0
and amount=real_amount
and operate_type=1;

select concat("update t_star_member_sales_detail a set commission_amount=amount*rate,real_commission_amount=real_amount*rate  where a.sales_detail_id=",sales_detail_id,";"),a.* from mamahao_warehouse.t_star_member_sales_detail a 
inner join wgn_bl_result b on a.order_no=b.order_no and a.item_num_id=b.item_num_id
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
#and rate=0
and real_amount>0
and operate_type=1;


select * from  mamahao_warehouse.t_star_member_sales limit 100;

select a.* from  t_star_member_sales a inner join 
(select  member_id,order_no,sum(commission_amount) from t_star_member_sales_detail a where exists(select 1 from  t_star_member_sales_detail_bak_20191024 b where a.sales_detail_id=b.sales_detail_id)  group by member_id,order_no)
b on a.`order_no` =b.order_no and a.member_id=b.member_id;


select concat(sales_detail_id,',') from mamahao_warehouse.t_star_member_sales_detail a 
inner join wgn_bl_result b on a.order_no=b.order_no and a.item_num_id=b.item_num_id
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>0
and operate_type=1;


update  t_star_member_sales a inner join 
(select  member_id,order_no,sum(commission_amount) as commission_amount  from t_star_member_sales_detail a where exists(select 1 from  t_star_member_sales_detail_bak_20191024 b where a.sales_detail_id=b.sales_detail_id)  group by member_id,order_no)
b on a.`order_no` =b.order_no and a.member_id=b.member_id
set a.`commission_amount` =b.commission_amount



select * from mamahao_warehouse.t_star_member_sales_detail;

select * from wgn_bl_result;


#-------------让数据入账

select * from  t_star_member_sales_detail a inner join t_star_member_sales_detail_bak_20191024 b on a.sales_detail_id=b.sales_detail_id
where a.sale_status=1;



select * from  t_star_member_sales a inner join t_star_member_sales_bak_20191024 b on a.sales_id=b.sales_id
where a.sale_status=1;



update  t_star_member_sales_detail a inner join t_star_member_sales_detail_bak_20191024 b on a.sales_detail_id=b.sales_detail_id 
set a.sale_status=2
where a.sale_status=1;



update   t_star_member_sales a inner join t_star_member_sales_bak_20191024 b on a.sales_id=b.sales_id
set  a.sale_status=2
where a.sale_status=1;


#--------------多入账的数据改回



select a.out_serial_number,a.item_num_id,count(1)  from t_star_member_asset_log a 
where exists(select 1 from  t_star_member_sales_detail_bak_20191024 b where a.`out_serial_number` =b.order_no) 
group by a.out_serial_number,a.item_num_id having count(1)>1 ;


create table amahao_warehouse.t_star_member_asset_log_bak_20191024  as 
select * from mamahao_warehouse.t_star_member_asset_log where out_serial_number in(
154010182677618, 
154060149888455, 
154060167648379, 
154070149800822, 
154070195773726)
and operate_type=4;

delete from mamahao_warehouse.t_star_member_asset_log where out_serial_number in(
154010182677618, 
154060149888455, 
154060167648379, 
154070149800822, 
154070195773726)
and operate_type=4;

create table mamahao_warehouse.t_star_member_asset_20191024 as 
select a.* from mamahao_warehouse.t_star_member_asset a inner join  (select * from mamahao_warehouse.t_star_member_asset_log where out_serial_number in(
154010182677618, 
154060149888455, 
154060167648379, 
154070149800822, 
154070195773726)
and operate_type=4) b 
on a.member_id=b.member_id

update  mamahao_warehouse.t_star_member_asset a 
inner join  (select * from mamahao_warehouse.t_star_member_asset_log where out_serial_number in(
154010182677618, 
154060149888455, 
154060167648379, 
154070149800822, 
154070195773726)
and operate_type=4) b 
on a.member_id=b.member_id
set a.balance=a.balance-b.change_balance;

select * from  where a



