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

#-------------添加索引----------------------------

create index idx_reserved_no_0 on gb_pmt_pcy_item_lable_0(RESERVED_NO);
create index idx_reserved_no_1 on gb_pmt_pcy_item_lable_1(RESERVED_NO);
create index idx_reserved_no_2 on gb_pmt_pcy_item_lable_2(RESERVED_NO);
create index idx_reserved_no_3 on gb_pmt_pcy_item_lable_3(RESERVED_NO);
create index idx_reserved_no_4 on gb_pmt_pcy_item_lable_4(RESERVED_NO);
create index idx_reserved_no_5 on gb_pmt_pcy_item_lable_5(RESERVED_NO);
create index idx_reserved_no_6 on gb_pmt_pcy_item_lable_6(RESERVED_NO);
create index idx_reserved_no_7 on gb_pmt_pcy_item_lable_7(RESERVED_NO);
create index idx_reserved_no_8 on gb_pmt_pcy_item_lable_8(RESERVED_NO);
create index idx_reserved_no_9 on gb_pmt_pcy_item_lable_9(RESERVED_NO);

create index idx_style_num_id_0 on gb_pmt_pcy_item_lable_0(style_num_id);
create index idx_style_num_id_1 on gb_pmt_pcy_item_lable_1(style_num_id);
create index idx_style_num_id_2 on gb_pmt_pcy_item_lable_2(style_num_id);
create index idx_style_num_id_3 on gb_pmt_pcy_item_lable_3(style_num_id);
create index idx_style_num_id_4 on gb_pmt_pcy_item_lable_4(style_num_id);
create index idx_style_num_id_5 on gb_pmt_pcy_item_lable_5(style_num_id);
create index idx_style_num_id_6 on gb_pmt_pcy_item_lable_6(style_num_id);
create index idx_style_num_id_7 on gb_pmt_pcy_item_lable_7(style_num_id);
create index idx_style_num_id_8 on gb_pmt_pcy_item_lable_8(style_num_id);
create index idx_style_num_id_9 on gb_pmt_pcy_item_lable_9(style_num_id);

create index idx_item_num_id_0 on gb_pmt_pcy_item_lable_0(item_num_id);
create index idx_item_num_id_1 on gb_pmt_pcy_item_lable_1(item_num_id);
create index idx_item_num_id_2 on gb_pmt_pcy_item_lable_2(item_num_id);
create index idx_item_num_id_3 on gb_pmt_pcy_item_lable_3(item_num_id);
create index idx_item_num_id_4 on gb_pmt_pcy_item_lable_4(item_num_id);
create index idx_item_num_id_5 on gb_pmt_pcy_item_lable_5(item_num_id);
create index idx_item_num_id_6 on gb_pmt_pcy_item_lable_6(item_num_id);
create index idx_item_num_id_7 on gb_pmt_pcy_item_lable_7(item_num_id);
create index idx_item_num_id_8 on gb_pmt_pcy_item_lable_8(item_num_id);
create index idx_item_num_id_9 on gb_pmt_pcy_item_lable_9(item_num_id);

create index idx_sub_unit_num_id_0 on gb_pmt_pcy_item_lable_0(sub_unit_num_id);
create index idx_sub_unit_num_id_1 on gb_pmt_pcy_item_lable_1(sub_unit_num_id);
create index idx_sub_unit_num_id_2 on gb_pmt_pcy_item_lable_2(sub_unit_num_id);
create index idx_sub_unit_num_id_3 on gb_pmt_pcy_item_lable_3(sub_unit_num_id);
create index idx_sub_unit_num_id_4 on gb_pmt_pcy_item_lable_4(sub_unit_num_id);
create index idx_sub_unit_num_id_5 on gb_pmt_pcy_item_lable_5(sub_unit_num_id);
create index idx_sub_unit_num_id_6 on gb_pmt_pcy_item_lable_6(sub_unit_num_id);
create index idx_sub_unit_num_id_7 on gb_pmt_pcy_item_lable_7(sub_unit_num_id);
create index idx_sub_unit_num_id_8 on gb_pmt_pcy_item_lable_8(sub_unit_num_id);
create index idx_sub_unit_num_id_9 on gb_pmt_pcy_item_lable_9(sub_unit_num_id);

create index idx_item_valid_0 on t_daily_shop_pmt_price_0(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_1 on t_daily_shop_pmt_price_1(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_2 on t_daily_shop_pmt_price_2(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_3 on t_daily_shop_pmt_price_3(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_4 on t_daily_shop_pmt_price_4(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_5 on t_daily_shop_pmt_price_5(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_6 on t_daily_shop_pmt_price_6(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_7 on t_daily_shop_pmt_price_7(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_8 on t_daily_shop_pmt_price_8(ITEM_NUM_ID,shop_id,valid_date);   
create index idx_item_valid_9 on t_daily_shop_pmt_price_9(ITEM_NUM_ID,shop_id,valid_date);   

create index idx_shop_valid_0 on t_daily_shop_pmt_price_0(shop_id,valid_date); 
create index idx_shop_valid_1 on t_daily_shop_pmt_price_1(shop_id,valid_date); 
create index idx_shop_valid_2 on t_daily_shop_pmt_price_2(shop_id,valid_date); 
create index idx_shop_valid_3 on t_daily_shop_pmt_price_3(shop_id,valid_date); 
create index idx_shop_valid_4 on t_daily_shop_pmt_price_4(shop_id,valid_date); 
create index idx_shop_valid_5 on t_daily_shop_pmt_price_5(shop_id,valid_date); 
create index idx_shop_valid_6 on t_daily_shop_pmt_price_6(shop_id,valid_date); 
create index idx_shop_valid_7 on t_daily_shop_pmt_price_7(shop_id,valid_date); 
create index idx_shop_valid_8 on t_daily_shop_pmt_price_8(shop_id,valid_date); 
create index idx_shop_valid_9 on t_daily_shop_pmt_price_9(shop_id,valid_date); 

create index idx_base_shop_valid on t_shop_style_price_base(shop_id,style_num_id,valid_date);



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


truncate table t_daily_shop_pmt_price_0 ;
truncate table t_daily_shop_pmt_price_1 ;
truncate table t_daily_shop_pmt_price_2 ;
truncate table t_daily_shop_pmt_price_3 ;
truncate table t_daily_shop_pmt_price_4 ;
truncate table t_daily_shop_pmt_price_5 ;
truncate table t_daily_shop_pmt_price_6 ;
truncate table t_daily_shop_pmt_price_7 ;
truncate table t_daily_shop_pmt_price_8 ;
truncate table t_daily_shop_pmt_price_9 ;


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







