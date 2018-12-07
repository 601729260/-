		
create table u_stock_log_MMH2018110110000695  as select * from u_stock_log where id='MMH2018110110000695';
update u_stock_log set total_purchase_price=total_purchase_price*0.79  where id='MMH2018110110000695';

create table u_stock_detail_MMH2018110110000695 as 	select * from u_stock_log_detail where id='MMH2018110110000695';
update u_stock_log_detail set total_purchase_price=total_purchase_price*0.79 ,purchase_price=purchase_price*0.79 where id='MMH2018110110000695';


		
create table u_stock_log_mmh2018110610002483  as select * from u_stock_log where id='mmh2018110610002483';
update u_stock_log set total_purchase_price=total_purchase_price*0.79  where id='mmh2018110610002483';


create table u_stock_detail_mmh2018110610002483 as 	select * from u_stock_log_detail where id='mmh2018110610002483';
update u_stock_log_detail set total_purchase_price=total_purchase_price*0.79 ,purchase_price=purchase_price*0.79 where id='mmh2018110610002483';



select * from u_stock_log_detail where bill_type=5 limit 100;


#--------------------------修复进价 门店成本价
select * from u_stock_log where id='MMH2018111010003511';

select * from u_stock_log_detail where id='MMH2018111010003511';

update u_stock_log_detail set 

select * from t_gb_stock where storage_id=1800000080 and item_num_id=1000007730;


#---------------------删除单据

select * from u_stock_log_bak20181113;
create table u_stock_log_bak20181113 as 
select * from u_stock_log where id in 
('MMH2018111210004046',
'MMH2018111210004063', 
'MMH2018111210004069', 
'MMH2018111210004074', 
'MMH2018111210004082', 
'MMH2018111210004085', 
'MMH2018111210004089', 
'MMH2018111210004094', 
'MMH2018111210004118', 
'MMH2018111210004145', 
'MMH2018111210004156', 
'MMH2018111210004162', 
'MMH2018111210004178', 
'MMH2018111210004181', 
'MMH2018111210004192', 
'MMH2018111210004196', 
'MMH2018111210004198', 
'MMH2018111210004205', 
'MMH2018111210004236', 
'MMH2018111210004242') 
;

delete from u_stock_log where id in 
('MMH2018111210004046',
'MMH2018111210004063', 
'MMH2018111210004069', 
'MMH2018111210004074', 
'MMH2018111210004082', 
'MMH2018111210004085', 
'MMH2018111210004089', 
'MMH2018111210004094', 
'MMH2018111210004118', 
'MMH2018111210004145', 
'MMH2018111210004156', 
'MMH2018111210004162', 
'MMH2018111210004178', 
'MMH2018111210004181', 
'MMH2018111210004192', 
'MMH2018111210004196', 
'MMH2018111210004198', 
'MMH2018111210004205', 
'MMH2018111210004236', 
'MMH2018111210004242') 
;


create table u_stock_log_detail_bak20181113 as 
select * from u_stock_log_detail where id in 
('MMH2018111210004046',
'MMH2018111210004063', 
'MMH2018111210004069', 
'MMH2018111210004074', 
'MMH2018111210004082', 
'MMH2018111210004085', 
'MMH2018111210004089', 
'MMH2018111210004094', 
'MMH2018111210004118', 
'MMH2018111210004145', 
'MMH2018111210004156', 
'MMH2018111210004162', 
'MMH2018111210004178', 
'MMH2018111210004181', 
'MMH2018111210004192', 
'MMH2018111210004196', 
'MMH2018111210004198', 
'MMH2018111210004205', 
'MMH2018111210004236', 
'MMH2018111210004242') 
;

delete from u_stock_log_detail where id in 
('MMH2018111210004046',
'MMH2018111210004063', 
'MMH2018111210004069', 
'MMH2018111210004074', 
'MMH2018111210004082', 
'MMH2018111210004085', 
'MMH2018111210004089', 
'MMH2018111210004094', 
'MMH2018111210004118', 
'MMH2018111210004145', 
'MMH2018111210004156', 
'MMH2018111210004162', 
'MMH2018111210004178', 
'MMH2018111210004181', 
'MMH2018111210004192', 
'MMH2018111210004196', 
'MMH2018111210004198', 
'MMH2018111210004205', 
'MMH2018111210004236', 
'MMH2018111210004242') 
;


select * from  wgn_t_gb_stock_bak20181112;



#-------------变更金额-------

create table u_stock_log_detail_MMH2018110710002846 as select  * from u_stock_log_detail where id='MMH2018110710002846' ;
update u_stock_log_detail set purchace_price=251 ,total_purchase_price=purchace_price*from_num where id='MMH2018110710002846' and barcode='6907992632513';
update u_stock_log_detail set purchace_price=193,total_purchase_price=purchace_price*from_num where id='MMH2018110710002846' and barcode='6907992633527';


#============变更供应商-----------------
select * from t_provider_info where provider_name like '%唯小宝%';
create table u_stock_log_bak20181122 as 
select * from u_stock_log where id in ('MMH2018110610002483',
'MMH2018110810003029',
'MMH2018111510004967',
'MMH2018110710002845',
'MMH2018110710002840',
'MMH2018110310001469',
'MMH2018103110000405',
'MMH2018110710002835',
'MMH2018111910006178',
'MMH2018111110003707',
'MMH2018110910003286',
'MMH2018110210001030',
'MMH2018110710002845',
'MMH2018110710002840',
'MMH2018110310001469',
'MMH2018103110000405',
'MMH2018110710002835');

update u_stock_log set provider_id=10217 ,provider_name='唯小宝儿童用品（苏州）有限公司' where id in ('MMH2018110610002483',
'MMH2018110810003029',
'MMH2018111510004967',
'MMH2018110710002845',
'MMH2018110710002840',
'MMH2018110310001469',
'MMH2018103110000405',
'MMH2018110710002835',
'MMH2018111910006178',
'MMH2018111110003707',
'MMH2018110910003286',
'MMH2018110210001030',
'MMH2018110710002845',
'MMH2018110710002840',
'MMH2018110310001469',
'MMH2018103110000405',
'MMH2018110710002835');


select * from u_stock_log_detail where id in (
select id from u_stock_log_detail where to_num is not null  group by id having sum(to_num)=0) ;
 


select * from u_stock_log where id='MMH2018111710005696';





select * from u_stock_log_detail where id='MMH2018112210007749';


select to_sid, item_num_id,from_num,to_num from u_stock_log_detail where  id='MMH2018111710005696' and from_num>0;

select * from u_goods_stock_log where  id='MMH2018111710005696' and ;


select * from u_stock_log where id='MMH2018111610005238';




create table t_gb_stock_bak2018122301 as select * from t_gb_stock a  where exists(select * from u_stock_log_detail b 
where a.shop_id=b.to_sid and a.item_num_id=b.item_num_id and b.id='MMH2018111610005238');

update t_gb_stock a
left join u_stock_log_detail b 
on a.shop_id=b.to_sid, a.item_num_id=b.item_num_id
set a.qty=a.qty-(to_num-from_num)
where a.shop_id=1500000110
and b.id='MMH2018111610005238';

create table u_stock_log_detail_MMH2018111610005238 as select * from u_stock_log_detail where id='MMH2018111610005238' ; 

update u_stock_log_detail a 
set a.to_num=b.from_num 
where a.id='MMH2018111610005238';


#-------------------------异常数据排查 -------------------

select * from u_goods_stock_log where id='MMH2018112410008501';

select * from u_stock_log where id='MMH2018111710005856';

select * from u_stock_log_his where id='MMH2018112410008501' order by move_time desc;




create table u_stock_log_MMH2018111710005856 as select * from u_stock_log where id='MMH2018111710005856';
update u_stock_log set to_sid=1800000080 ,to_sid_name='唯小宝门店仓',to_sid_type=3  where id='MMH2018111710005856';
create table  u_stock_log_detail_MMH2018111710005856 as  select * from u_stock_log_detail where id='MMH2018111710005856';
update u_stock_log_detail set to_sid=1800000080 ,to_sid_type=3  where id='MMH2018111710005856';


select * from gb_storage where storage_num_id=1800000080;



select * from u_stock_log where id='MMH2018111710005856';

select * from u_stock_log_his where id='MMH2018111710005856' order by move_time desc;


select * from u_goods_stock_log where id='MMH2018111710005856';



#-------------------------- 库存重复变化的数据-----------------------------------------------


MMH2018111610005620 
MMH2018111710005856

create table u_goods_stock_log_bak20181126 as select * from u_goods_stock_log where id in ('MMH2018111610005620','MMH2018111710005856') and qty_change!=0;
create table t_gb_stock_bak20181126 as select * from t_gb_stock where shop_id in (1500000137,1500000142);

create table MMH2018111710005856_minseq as 
select min(seq_id)  as seq_id from u_goods_stock_log where id in ('MMH2018111710005856') and qty_change!=0 group by item_num_id,qty_change  having count(1)>1;
delete from u_goods_stock_log where seq_id in (select seq_id from MMH2018111710005856_minseq);
drop table MMH2018111710005856_minseq;


create table MMH2018111610005620_minseq as 
select min(seq_id) as seq_id from u_goods_stock_log where id in ('MMH2018111610005620') and qty_change!=0 group by item_num_id,qty_change having count(1)>1;
delete from u_goods_stock_log where seq_id in (select seq_id from MMH2018111610005620_minseq);
drop table MMH2018111610005620_minseq;


create table MMH2018111610005620_minseq as 
select min(seq_id) as seq_id from u_goods_stock_log where id in ('MMH2018111610005620') and qty_change!=0 group by item_num_id,qty_change having count(1)>1;
delete from u_goods_stock_log where seq_id in (select seq_id from MMH2018111610005620_minseq);
drop table MMH2018111610005620_minseq;



update  t_gb_stock a inner join 
(select  sid,item_num_id,qty_change  from u_goods_stock_log_bak20181126 where id in ('MMH2018111610005620') and qty_change!=0 group by item_num_id,qty_change) b
on a.shop_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=a.qty-b.qty_change
where a.shop_id in (1500000137); 


update  t_gb_stock a inner join 
(select  sid,item_num_id,qty_change*2 as qty_change  from u_goods_stock_log_bak20181126 where id in ('MMH2018111710005856') and qty_change!=0 group by item_num_id,qty_change) b
on a.shop_id=b.sid and a.item_num_id=b.item_num_id
set a.qty=a.qty-b.qty_change
where a.shop_id in (1500000142);

select * from u_goods_stock_log where id='MMH2018111810006116' and item_num_id=1000000289;

select * from u_goods_stock_log where sid=1500000115 and  item_num_id=1000000289 order by create_time desc;


update u_stock_log set status=1 where id='MMH2018111710005856';
update u_stock_log_detail set status=1 where id='MMH2018111710005856';


#-----------------------------
 
 
 select * from u_stock_log where id='MMH2018112410008501';
 
 create table t_gb_stock_1500000136 as select * from t_gb_stock where shop_id=1500000136;
 update t_gb_stock a inner join 
 (select sid,item_num_id,sum(qty_change)*2 as qty_change from u_goods_stock_log_MMH2018112410008501 where id='MMH2018112410008501' group by sid,item_num_id) b
 on a.shop_id=b.sid
 and a.item_num_id=b.item_num_id
 set a.qty=a.qty-b.qty_change
 where a.shop_id=1500000136;
 
 
 select * from   t_gb_stock  a where exists(select 1 from u_goods_stock_log_MMH2018112410008501 b where a.shop_id=b.sid
 and a.item_num_id=b.item_num_id)
 and a.shop_id=1500000136;
 
 create table u_goods_stock_log_MMH2018112410008501 as select * from  u_goods_stock_log where id='MMH2018112410008501';
 delete from u_goods_stock_log where id='MMH2018112410008501';
 
 
 select * from u_stock_log where id='MMH2018111810006116';
 
  select * from u_stock_log_detail where id='MMH2018111810006116';

 
 select * from u_goods_stock_log where id='MMH2018111810006116' and sid=1500000115 group by item_num_id having count(1)>1;
 
 
 
 
 #----------------------------------修改成本价
 
 create table u_stock_log_MMH2018112710009274 as select * from u_stock_log where id='MMH2018112710009274';
 create table u_stock_log_detail_MMH2018112710009274 as select * from u_stock_log_detail where  id='MMH2018112710009274';
 delete from  u_stock_log where id='MMH2018112710009274';
 delete from u_stock_log_detail where  id='MMH2018112710009274';
 
 select * from u_stock_log_detail where id='MMH2018112210007534' and barcode='3760170400068';

MMH2018112210007534，条码：3760170400068合生元金装妈妈配方奶粉，成本价变更为225.94













