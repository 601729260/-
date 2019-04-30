select * from t_gb_stock where shop_id=1500000108 and item_num_id=1000011726;
select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100004712;



select * from u_goods_stock_log where sid=1500000122 and item_num_id=1100004712;
select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100004712;
MMH2019022510034872

select * from t_gb_stock_20190307 where shop_id=1500000108 and item_num_id=1000011726;
select * from t_gb_stock_20190308 where shop_id=1500000108 and item_num_id=1000011726;



select * from u_order where order_no='MPOS147080132529726';

select * from u_goods_stock_log where id='MPOS147080132529726';


select * from u_goods_stock_log where id='MMH2019022510034872' and item_num_id=1100004712;

select * from u_stock_log_detail where id='MMH2019022510034872' and item_num_id=1100004712;

----------------------修复库存----------------
#stock:sid:1500000108:sku:1000011726
update t_gb_stock set qty=qty-6 where shop_id=1500000108 and item_num_id=1000011726;
update t_gb_stock_20190308  set qty=qty-6 where shop_id=1500000108 and item_num_id=1000011726;
update t_gb_stock_20190309  set qty=qty-6 where shop_id=1500000108 and item_num_id=1000011726;
update t_gb_stock_20190310  set qty=qty-6 where shop_id=1500000108 and item_num_id=1000011726;

--------------------修复明细中多条商品-----------------
create table u_goods_stock_log_MMH2019030410036998 as select * from u_goods_stock_log where id='MMH2019030410036998';
delete from u_goods_stock_log where seq_id in (924715,912731);
create table u_stock_log_detail_MMH2019030410036998 as select * from u_stock_log_detail where id='MMH2019030410036998' and item_num_id=1000001699;
delete from u_stock_log_detail where seq_id=115430354;

#stock:sid:1800000080:sku:1000001699
create table u_goods_stock_log_MMH2019022510034872 as select * from u_goods_stock_log where id='MMH2019022510034872';
delete from u_goods_stock_log where seq_id in (883000,855328);
create table u_stock_log_detail_MMH2019022510034872 as select * from u_stock_log_detail where id='MMH2019022510034872' and item_num_id=1000001699;
delete from u_stock_log_detail where seq_id=112070688;
update t_gb_stock set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190227  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190228  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190301  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190302  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190303  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190304  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190305  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190306  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190307  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190308  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190309  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;
update t_gb_stock_20190310  set qty=qty+5 where storage_id=1800000080 and item_num_id=1000001699;

create table u_goods_stock_log_MMH2019022510034872 as select * from u_goods_stock_log where id='MMH2019022510034872';
delete from u_goods_stock_log where seq_id in (883006,883007,883008,883009,855334,855335,855336,855337);
create table u_stock_log_detail_MMH2019022510034872 as select * from u_stock_log_detail where id='MMH2019022510034872' and item_num_id=1100004712;
delete from u_stock_log_detail where seq_id in(112070679,112070680,112070681,112070683);















