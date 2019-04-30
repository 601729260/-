#--------------创建分表-------------------------

create table gb_pmt_pcy_item_lable_0 as select * from gb_pmt_pcy_item_lable where 1=2;
create table gb_pmt_pcy_item_lable_1 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_2 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_3 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_4 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_5 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_6 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_7 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_8 as select * from gb_pmt_pcy_itme_lable where 1=2;
create table gb_pmt_pcy_item_lable_9 as select * from gb_pmt_pcy_itme_lable where 1=2;


create table t_daily_shop_pmt_price_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_9 as select * from t_daily_shop_pmt_price where 1=2;


#-------------数据割接----------------------------

insert into gb_pmt_pcy_item_lable_0 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=0;
insert into gb_pmt_pcy_item_lable_1 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=1;
insert into gb_pmt_pcy_item_lable_2 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=2;
insert into gb_pmt_pcy_item_lable_3 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=3;
insert into gb_pmt_pcy_item_lable_4 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=4;
insert into gb_pmt_pcy_item_lable_5 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=5;
insert into gb_pmt_pcy_item_lable_6 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=6;
insert into gb_pmt_pcy_item_lable_7 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=7;
insert into gb_pmt_pcy_item_lable_8 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=8;
insert into gb_pmt_pcy_item_lable_9 select * from gb_pmt_pcy_item_lable where mod(sub_unit_num_id,10)=9;

insert into t_daily_shop_pmt_price_0 select * from t_daily_shop_pmt_price where mod(shop_id,10)=0;
insert into t_daily_shop_pmt_price_1 select * from t_daily_shop_pmt_price where mod(shop_id,10)=1;
insert into t_daily_shop_pmt_price_2 select * from t_daily_shop_pmt_price where mod(shop_id,10)=2;
insert into t_daily_shop_pmt_price_3 select * from t_daily_shop_pmt_price where mod(shop_id,10)=3;
insert into t_daily_shop_pmt_price_4 select * from t_daily_shop_pmt_price where mod(shop_id,10)=4;
insert into t_daily_shop_pmt_price_5 select * from t_daily_shop_pmt_price where mod(shop_id,10)=5;
insert into t_daily_shop_pmt_price_6 select * from t_daily_shop_pmt_price where mod(shop_id,10)=6;
insert into t_daily_shop_pmt_price_7 select * from t_daily_shop_pmt_price where mod(shop_id,10)=7;
insert into t_daily_shop_pmt_price_8 select * from t_daily_shop_pmt_price where mod(shop_id,10)=8;
insert into t_daily_shop_pmt_price_9 select * from t_daily_shop_pmt_price where mod(shop_id,10)=9;


