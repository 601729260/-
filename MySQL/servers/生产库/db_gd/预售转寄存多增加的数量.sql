SELECT  shop_id,item_num_id,count(1) FROM transfer_deposit_tmp_01_21 group by shop_id,item_num_id having count(1) >1;

select  * from  transfer_deposit_tmp_01_21;

select * from u_stock_log_detail a where  bill_type=5 and 
a.create_time>='2019-01-18 00:00:00' 
and exists(select 1 from transfer_deposit_tmp_01_21 b where a.to_sid=b.shop_id and a.item_num_id=b.item_num_id);


select distinct id ,status from u_stock_log_detail a where  bill_type=5 and status!=15 and 
a.create_time>='2019-01-18 00:00:00' 
and exists(select 1 from transfer_deposit_tmp_01_21 b where a.to_sid=b.shop_id and a.item_num_id=b.item_num_id);





create table wgn_gb_stock_bak_transfer_deposit as 
select * from t_gb_stock a 
where exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id)
;

#调整库存
update t_gb_stock a inner join transfer_deposit_tmp_01_21 b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id)
;


select * from  t_gb_stock a inner join transfer_deposit_tmp_01_21 b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
where exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id)

select  shop_id,item_num_id,sum( from transfer_deposit_tmp_01_21 group by shop_id,item_num_id having count(1)>1;


select * from u_goods_stock_log where id='MMH2019012110026363' and item_num_id=1000000507;

select * from u_stock_log where id='MMH2019012110026363'


1500000102	1000001319	2
1500000106	432220	2
1500000106	1000003122	2
select * from zbw_t_gb_stock_20190121_all where shop_id=1500000102 and item_num_id=1000001319;
select * from transfer_deposit_tmp_01_21 where shop_id=1500000102 and item_num_id=1000001319;
select * from t_gb_stock where shop_id=1500000102 and item_num_id=1000001319;


select * from u_goods_stock_log a inner join  transfer_deposit_tmp_01_21 b
on  a.sid=b.shop_id and a.item_num_id=b.item_num_id
where a.create_time>'2019-01-21 23:00:00'


select * from t_gb_stock 



update t_gb_stock_20190118 a inner join transfer_deposit_tmp_01_21 b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190118 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190118);


update t_gb_stock_20190119 a inner join transfer_deposit_tmp_01_21 b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190119 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190119);


update t_gb_stock_20190120 a inner join transfer_deposit_tmp_01_21 b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190120 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190120);


create table wgn_tmp_20190121 as 
select a.shop_id,a.item_num_id,a.qty,b.qty as b_qty,b.qty-a.qty as qtyChange from zbw_t_gb_stock_20190121_all a inner join t_gb_stock b on  a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
where exists(select 1 from transfer_deposit_tmp_01_21 c where a.shop_id=c.shop_id and a.item_num_id=c.item_num_id);

create table wgn_tmp1_20190121 as select * from transfer_deposit_tmp_01_21 ;
select * from wgn_tmp1_20190121 a where exists(select 1 from wgn_tmp_20190121 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and a.qtyChange=b.qtyChange);
delete from wgn_tmp1_20190121 a where exists(select 1 from wgn_tmp_20190121 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and a.qtyChange=b.qtyChange);


update t_gb_stock a inner join (select shop_id,item_num_id,sum(qtyChange) as qtyChange,count(1) as count from transfer_deposit_tmp_01_21 group by shop_id,item_num_id having count(1)>1) b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange;


(select shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d'),sum(qtyChange) as qtyChange,count(1) as count from transfer_deposit_tmp_01_21 group by shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') having count(1)>1);


create table wgn_tmp_20190121 as 
select shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') transfer_deposit_time ,sum(qtyChange) as qtyChange,count(1) as count 
from transfer_deposit_tmp_01_21 group by shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') having count(1)>1 order by date_format(transfer_deposit_time,'%Y%m%d');


select * from wgn_tmp_20190121_03;


create table wgn_tmp_20190121_04 as 
select t.sid,t.item_num_id,date_format(t.create_time,'%Y%m%d') create_time,t.pre_qty+t.qty_change as qty from u_goods_stock_log t where seq_id in ( select seq_id from 
(select max(seq_id) as seq_id,a.sid,a.item_num_id,date_format(create_time,'%Y%m%d') create_time
from u_goods_stock_log a inner join wgn_tmp_20190121_03 b on a.sid=b.shop_id and a.item_num_id=b.item_num_id and date_format(create_time,'%Y%m%d')=b.transfer_deposit_time 
group   by a.sid,a.item_num_id,date_format(create_time,'%Y%m%d')) a) ;

update t_gb_stock_20190118  a inner join wgn_tmp_20190121_04 b on a.shop_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=b.qty
where b.creare_time=20190118;

update t_gb_stock_20190119  a inner join wgn_tmp_20190121_04 b on a.shop_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=b.qty
where b.creare_time=20190119;


update t_gb_stock_20190120  a inner join wgn_tmp_20190121_04 b on a.shop_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=b.qty
where b.creare_time=20190120;

update t_gb_stock_20190118 a inner join (select shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') transfer_deposit_time,sum(qtyChange) as qtyChange,count(1) as count from transfer_deposit_tmp_01_21 group by shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') having count(1)>1) b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190118 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190118);




update t_gb_stock_20190120 a inner join (select shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') transfer_deposit_time,sum(qtyChange) as qtyChange,count(1) as count from transfer_deposit_tmp_01_21 group by shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') having count(1)>1) b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190118 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190118);




update t_gb_stock_20190119 a inner join (select shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d'),sum(qtyChange) as qtyChange,count(1) as count from transfer_deposit_tmp_01_21 group by shop_id,item_num_id,date_format(transfer_deposit_time,'%Y%m%d') having count(1)>1) b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190119 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190119);


update t_gb_stock_20190120 a inner join transfer_deposit_tmp_01_21 b  on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qtyChange
where date_format(transfer_deposit_time,'%Y%m%d')=20190120 and 
exists(select 1 from transfer_deposit_tmp_01_21 b where a.shop_id=b.shop_id and a.item_num_id=b.item_num_id and date_format(transfer_deposit_time,'%Y%m%d')=20190120);







create table wgn_goods_stock_log_20190121_1 as 
select * from u_goods_stock_log a where exists(select 1 from transfer_deposit_tmp_01_21 b 
where a.item_num_id=b.item_num_id  and a.sid=b.shop_id and a.id=b.id)
and bill_type=200005
and operate_type=100001;


delete from u_goods_stock_log a where exists(select 1 from transfer_deposit_tmp_01_21 b 
where a.item_num_id=b.item_num_id  and a.sid=b.shop_id and a.id=b.id)
and bill_type=200005
and operate_type=100001;


select * from  wgn_stock_log_detail_pd20190121 a inner join u_stock_log_detail b 
on a.id=b.id and a.item_num_id=b.item_num_id and a.total_different_num!=b.total_different_num
where a.id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');

select * from wgn_stock_log_detail_pd20190121;


create table wgn_stock_log_detail_pd20190121 as 
select * from u_stock_log_detail a 
where 
id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');




update u_stock_log_detail a inner join t_gb_stock_20190119  b on a.to_sid=b.shop_id and a.item_num_id=b.item_num_id 
set a.from_num=b.qty,
a.total_qty=b.qty,
a.total_price=a.price*a.to_qty,
a.total_different_num=a.check_num-b.from_num,
a.total_different_price=a.price*a.total_different_num,
a.total_different_purchase_price=a.purhcase_price*a.total_different_num,
a.total_cost_price=a.cost_price*a.total_different_num
where date_format(a.create_time,'%Y%m%d')=20190120
and exists(select 1 from transfer_deposit_tmp_01_21 c where a.to_sid=c.shop_id and a.item_num_id=c.item_num_id and date_format(a.create_time,'%Y%m%d')>date_format(c.transfer_deposit_time,'%Y%m%d'))
and 
id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');


update u_stock_log_detail a inner join t_gb_stock_20190120  b on a.to_sid=b.shop_id and a.item_num_id=b.item_num_id 
set a.from_num=b.qty,
a.total_qty=b.qty,
a.total_price=a.price*a.to_qty,
a.total_different_num=a.check_num-b.from_num,
a.total_different_price=a.price*a.total_different_num,
a.total_different_purchase_price=a.purhcase_price*a.total_different_num,
a.total_cost_price=a.cost_price*a.total_different_num
where date_format(a.create_time,'%Y%m%d')=20190121
and exists(select 1 from transfer_deposit_tmp_01_21 c where a.to_sid=c.shop_id and a.item_num_id=c.item_num_id and date_format(a.create_time,'%Y%m%d')>date_format(c.transfer_deposit_time,'%Y%m%d'))
and 
id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');


create table wgn_stock_log_bak20190121 as select * from u_stock_log where 
id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528')


update u_stock_log  a inner join 
(select id,sum(a.total_price) as total_price,
sum(a.total_qty) as total_qty,
sum(a.total_different_num) as total_different_num,
sum(a.total_different_price) as total_different_price,
sum(a.total_different_purchase_price) as total_different_purchase_price,
sum(a.total_cost_price) as total_cost_price from u_stock_log_detail 
where id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_qty=b.total_qty,
a.total_different_num=b.total_different_num,
a.total_different_price=b.total_different_price,
a.total_different_purchase_price=b.total_different_purchase_price,
a.total_cost_price=b.total_cost_price 
where a.id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');



create table wgn_tmp_20190122_05 as 
select a.sid,a.item_num_id,a.pre_qty,a.qty_change,b.total_different_num,b.total_different_num-a.qty_change from u_goods_stock_log  a left join u_stock_log_detail b 
on a.id=b.id and a.sid=b.to_sid and a.item_num_id=b.item_num_id and a.qty_change!=b.total_different_num
where 
b.id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');

select * from wgn_tmp_20190122_05;

select a.* from t_gb_stock a  inner join wgn_tmp_20190122_05 b on a.shop_id=b.sid and a.item_num_id=b.item_num_id 
update t_gb_stock a inner join wgn_tmp_20190122_07 b on a.shop_id=b.sid and a.item_num_id=b.item_num_id 
set 

select distinct a.status from u_stock_log_detail a where    id in 
('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');

create table wgn_tmp_20190122_07 as 
select a.id,a.to_sid,a.item_num_id,a.from_num afrom_num,a.check_num acheck_num,a.total_different_num atotal_different_num,b.from_num,b.check_num,b.total_different_num,a.status from u_stock_log_detail a  inner join wgn_stock_log_detail_pd20190121 b on a.id=b.id and a.item_num_id=b.item_num_id and a.from_num!=b.from_num where  a.id in 
('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528') order by a.item_num_id;


create table wgn_tmp_20190122_05 as 
select s.id,a.sid,a.item_num_id,a.pre_qty,a.qty_change,b.total_different_num,b.total_different_num-a.qty_change from u_goods_stock_log  a left join u_stock_log_detail b 
on a.id=b.id and a.sid=b.to_sid and a.item_num_id=b.item_num_id and a.qty_change!=b.total_different_num
where 
b.id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');


1500000131	1000000507	1	1	-7	8	1	-7	8

select * from u_stock_log_detail where id='MMH2019012010026129' and item_num_id=1000000507;


select * from u_goods_stock_log where id in ('');

update u_stock_log_detail a set 
a.total_price=a.price*a.from_num,
a.total_different_num=a.check_num-a.from_num,
a.total_different_price=a.price*a.total_different_num,
a.total_different_purchase_price=a.purhcase_price*a.total_different_num,
a.total_cost_price=a.cost_price*a.total_different_num
a.total_different_cost_price=a.cost_price*a.total_different_num
where a.id in 
('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');

update u_stock_log  a inner join 
(select id,sum(total_price) as total_price,
sum(total_qty) as total_qty,
sum(total_different_num) as total_different_num,
sum(total_different_price) as total_different_price,
sum(total_different_purchase_price) as total_different_purchase_price,
sum(total_cost_price) as total_cost_price ,
sum(total_different_cost_price) as total_different_cost_price 
from u_stock_log_detail 
where id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528')
group by id) b
on a.id=b.id
set  a.total_price=b.total_price,
a.total_qty=b.total_qty,
a.total_different_num=b.total_different_num,
a.total_different_price=b.total_different_price,
a.total_different_purchase_price=b.total_different_purchase_price,
a.total_cost_price=b.total_cost_price ,
a.total_different_cost_price=b.total_different_cost_price
where a.id in ('MMH2019011810025210',
'MMH2019011810025397',
'MMH2019011810025433',
'MMH2019011910025506',
'MMH2019011910025875',
'MMH2019012010026053',
'MMH2019012010026129',
'MMH2019012010026154',
'MMH2019012010026161',
'MMH2019012110026363',
'MMH2019012110026471',
'MMH2019012110026528');


select * from transfer_deposit_tmp_01_21 where date_format(transfer_deposit_time,'%Y%m%d')=20190118;

select * from u_goods_stock_log a  where a.id = 'MPOS145180660823341' and  a.bill_type=200005;

select * from u_goods_stock_log a where item_num_id=1000000549 and sid=1500000102;




#-----------------------------------------

update t_gb_stock a inner join (
select id,item_num_id,to_sid,atotal_different_num-total_different_num as qty_change from wgn_tmp_20190122_08) b on a.shop_id=b.to_sid and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.qty_change;


update u_goods_stock_log  a inner join wgn_tmp_20190122_08  b on a.id=b.id and a.item_num_id=b.item_num_id
set a.qty_change=b.atotal_different_num;


INSERT INTO ( `id`, `item_num_id`, `style_num_id`, `create_time`, `style_code`, `style_title`, `price`, `total_price`, `sid`,  `sid_type`, `qty_change`, `staff_id`, `staff_name`,  `operate_type`,  `bill_type`, `cost_price`, `purchase_price`) 
select id,item_num_id,style_num_id,create_time,style_code,style_title,price,total_price,to_sid, to_sid_type ,total_different_num,user_id,user,operate_type, bill_type,cost_price,purchase_price from u_stock_log_detail  a where seq_id in(81608035,86490907);


select *  from u_stock_log_detail  a where seq_id in(81608035,86490907);

select * from u_goods_stock_log where id in ('MMH2019012010026053','MMH2019012110026363');
select  * from wgn_tmp_20190122_08  b left join  u_goods_stock_log  a on a.id=b.id and a.item_num_id=b.item_num_id
where a.id is null;

select * from wgn_tmp_20190122_08;

update t_gb_stock_20190120 a inner join wgn_tmp_20190122_08 b on a.shop_id=b.to_sid and a.item_num_id=b.item_num_id 
set a.qty=a.qty+atotal_different_num-total_different_num
where SUBSTR(b.id,4,8)=20190120;






select SUBSTR(id,4,8) from wgn_tmp_20190122_08;








