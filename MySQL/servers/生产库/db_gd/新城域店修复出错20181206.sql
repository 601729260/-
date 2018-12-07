select * from u_goods_stock_log where sid=1500000102 and item_num_id=432218;

select * from t_gb_stock where shop_id=1500000102 and item_num_id=432218;

select * from t_gb_stock_bak20181122 where shop_id=1500000102;

select * from t_gb_stock_bak_20181122 where shop_id=1500000102 and item_num_id=432218;

select * from t_gb_stock_20181122 where shop_id=1500000102 and item_num_id=432218;

select * from t_gb_stock_20181123 where shop_id=1500000102 and item_num_id=432218;

select * from t_gb_stock_bak_20181123 where shop_id=1500000102 and item_num_id=432218;


#---------------记录对应不上--------------------------------

select a.item_num_id,a.qty,b.qty,c.qty_change,d.to_num,d.from_num from t_gb_stock_20181122 a
left join u_stock_log_detail d on a.item_num_id=d.item_num_id and d.id='MMH2018112110007068'
left join  t_gb_stock_20181123 b on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
left join (select item_num_id,sum(qty_change) as qty_change 
  from u_goods_stock_log 
 where sid=1500000102 
  and date_format(create_time,'%Y%m%d')='20181123' group by item_num_id) c on a.item_num_id=c.item_num_id
where a.shop_id=1500000102
and b.shop_id=1500000102
and a.qty!=b.qty-c.qty_change;

#----------------201123 记录不对---------------------

select * from u_stock_log_detail 


select d.id,a.shop_id,a.item_num_id,a.qty,b.qty,ifnull(c.qty_change,0) from t_gb_stock_20181122 a
left join  t_gb_stock_20181123 b on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
left join (select sid,item_num_id,ifnull(sum(qty_change),0) as qty_change 
  from u_goods_stock_log 
 where  date_format(create_time,'%Y%m%d')='20181123' group by sid,item_num_id) c on b.item_num_id=c.item_num_id  and b.shop_id=c.sid
 left join u_stock_log_detail d on a.shop_id=d.to_sid and a.item_num_id=d.item_num_id
where a.qty!=b.qty-ifnull(c.qty_change,0)
and a.shop_id!=0
and a.qty!=b.qty
and DATE_FORMAT(d.update_time,'%Y%m%d')='20181123';



#--------------------------------------------------------------


select distinct d.id from t_gb_stock_20181122 a
left join  t_gb_stock_20181123 b on a.shop_id=b.shop_id and a.item_num_id=b.item_num_id
left join (select sid,item_num_id,ifnull(sum(qty_change),0) as qty_change 
  from u_goods_stock_log 
 where  date_format(create_time,'%Y%m%d')='20181123' group by sid,item_num_id) c on b.item_num_id=c.item_num_id  and b.shop_id=c.sid
 left join u_stock_log_detail d on a.shop_id=d.to_sid and a.item_num_id=d.item_num_id
where a.qty!=b.qty-ifnull(c.qty_change,0)
and a.shop_id!=0
and a.qty!=b.qty
and DATE_FORMAT(d.update_time,'%Y%m%d')='20181123';
#---------------------------------------------------------------

MMH2018111610005238
MMH2018112110007068

select * from u_stock_log_detail where id='MMH2018111610005238';


select * from gb_cort_sub_unit where sub_unit_num_id=1500000136 limit 1; 

select to_sid as 门店id,barcode as 条码,style_title as 品名 from u_stock_log_detail where id='MMH2018112110007068';

#==================================================

select distinct id from u_stock_log_detail a 
where exists(select 1 from u_stock_log b  
where 
length(a.style_title)>64
and a.id=b.id 
and b.bill_type=2
and b.status=2
and DATE_FORMAT(b.update_time,'%Y%m%d')='20181123'
);

select * from u_goods_stock_log where id='MMH2018111710005783';
select * from u_goods_stock_log where  item_num_id=1000011931 and sid=1500000135;



select item_num_id,sum(qty_change) as qty_change from u_goods_stock_log where sid=1500000102 and date_format(create_time,'%Y%m%d')='20181123' group by item_num_id;

select * from u_stock_log_detail where id='MMH2018111610005238';



select * from t_gb_stock_bak_2018112302


#--------------11月23日 修复脚本---------------

insert into t_gb_stock 
select 'mmh',1500000110,0,item_num_id,0,now(),now(),1,1,now(),0,0,0 from u_stock_log_detail a  where  id='MMH2018112210007821' and not exists(select 1 from t_gb_stock  b where a.item_num_id=b.item_num_id and b.shop_id=1500000110);



#================

select * from u_stock_log_detail where id='MMH2018112110007068'  and item_num_id=432218;
select * from u_stock_log_detail where id='MMH2018112110007184' and item_num_id=432218;
select * from u_stock_log_detail where id='MMH2018111610005238' and item_num_id=432218;
select * from u_stock_log_detail where id='MMH2018111710005786' and item_num_id=432218;


select * from u_stock_log_detail_his where id='MMH2018112110007068'  and item_num_id=432218;



select * from u_stock_log where id='MMH2018112110007068'

select id,create_time,item_num_id,pre_qty,qty_change from u_goods_stock_log where sid=1500000102 and item_num_id  in (1000000286,
1000000402,
1000000431,
1000000432,
1000000433,
1000000528,
1000000538
) order by item_num_id,create_time;


374430
428293
429719
429720
430104
432218
432219
1000000286
1000000402
1000000431
1000000432
1000000433
1000000528
1000000538
1000000561
1000000571
1000000574
1000000622
1000000679
1000000720
1000000724
1000000852
1000000853
1000001167
1000001274
1000001366
1000001374
1000001381
1000001501
1000001504
1000001538
1000001559
1000001600
1000001603
1000001615
1000001617
1000001618
1000001619
1000001620
1000001622
1000001635
1000001637
1000001653
1000001822
1000001901
1000001930
1000001950
1000001952
1000001958
1000001964
1000001966
1000001971
1000001973
1000001977
1000001979
1000001981
1000001983
1000001985
1000001996
1000001997
1000001998
1000001999
1000002009
1000002038
1000002039
1000002042
1000002043
1000002044
1000002045
1000002151
1000002205
1000002206
1000002207
1000002208
1000002254
1000002255
1000002256
1000002257
1000002259
1000002260
1000002272
1000002273
1000002281
1000002282
1000002283
1000002970
1000002990
1000003042
1000003065
1000003069
1000011131
1000011287
1000011449
1000011552
1000012092
1000012284
1000017101
1000027347
1100001390
1100001392
1100001704
1100001708
1100001759
1100001785
1100001792
1100001794
1100002431
1100003131
1100003133
1100003135

select * from u_stock_log where id='MMH2018112110007068' 


select * from u_stock_log_his where id='MMH2018112110007068' 



select * from  u_stock_log_detail where id='MMH2018112110007068' ;


select * from  u_stock_log_detail_his where id='MMH2018112110007068' ;




#------------20181201----------------------------
create table t_gb_stock_wq_201811123 as  
select * from t_gb_stock where shop_id=1500000148 and item_num_id=1000000622 union all
select * from t_gb_stock where shop_id=1500000102 and item_num_id=1000001274 union all
select * from t_gb_stock where shop_id=1500000102 and item_num_id=1000001504;

update t_gb_stock set qty=qty-8 where shop_id=1500000102 and item_num_id=1000001504;
update t_gb_stock set qty=qty-70 where shop_id=1500000102 and item_num_id=1000001274;
update t_gb_stock set qty=qty-32 where shop_id=1500000148 and item_num_id=1000000622;