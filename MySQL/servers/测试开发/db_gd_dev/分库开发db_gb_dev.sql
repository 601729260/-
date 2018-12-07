#---------需要分库的表-----------------------------------
select * from db_gd_dev.t_daily_shop_pmt_price_0 limit 1;
select * from db_gd_dev.t_daily_company_pmt_price limit 1;
select * from db_gd_dev.t_daily_country_pmt_price limit 1
select * from db_gd_dev.t_daily_custom_price limit 1;
select * from db_gd_dev.t_daily_standard_price limit 1;
select * from db_gd_dev.gb_pmt_pcy_item_lable_1 limit 1;
#------------------price 留在主库的表--------------------------------------


select * from db_gd_dev.gb_div_market_item limit 1;
select * from db_gb_dev.gb_price_collect limit 1;
select * from db_gb_dev.gb_div limit 1;
select * from db_gb_dev.gb_share_item limit 1;
select * from t_city_style_price_base limit 1;
select * from t_shop_style_price_base limit 1;
select * from gb_style limit 1;
select * from gb_online limit 1;
select * from gb_city_area limit 1;
select * from t_goods_type limit 1;
select * from t_brand limit 1;
select * from t_goods_month_browse limit 1;
select * from t_goods_month_sale_total limit 1;
select * from t_operational_price limit 1;

select "gb_div_market_item"          ,count(1) from gb_div_market_item       union all 
select "gb_price_collect  ",count(1) from gb_price_collect         union all
select "gb_div            ",count(1) from gb_div                   union all
select "gb_share_item     ",count(1) from gb_share_item            union all
select "t_city_style_price_base     ",count(1) from t_city_style_price_base  union all
select "t_shop_style_price_base     ",count(1) from t_shop_style_price_base  union all
select "gb_style                    ",count(1) from gb_style                 union all
select "gb_online                   ",count(1) from gb_online                union all
select "gb_city_area                ",count(1) from gb_city_area             union all
select "t_goods_type                ",count(1) from t_goods_type             union all
select "t_brand                     ",count(1) from t_brand                  union all
select "t_goods_month_browse        ",count(1) from t_goods_month_browse     union all
select "t_goods_month_sale_total    ",count(1) from t_goods_month_sale_total union all
select "t_operational_price         ",count(1) from t_operational_price      ;

#-----------------备份生产表------------------------
create table gb_div_market_item_sh         as select * from gb_div_market_item        ; 
create table gb_price_collect_sh          as select * from gb_price_collect          ;  
create table gb_div_sh                     as select * from gb_div                    ; 
create table gb_share_item_sh              as select * from gb_share_item             ; 
create table t_city_style_price_base_sh    as select * from t_city_style_price_base   ; 
create table t_shop_style_price_base_sh    as select * from t_shop_style_price_base   ; 
create table gb_style_sh                   as select * from gb_style                  ; 
create table gb_online_sh                  as select * from gb_online                 ; 
create table gb_city_area_sh               as select * from gb_city_area              ; 
create table t_goods_type_sh               as select * from t_goods_type              ; 
create table t_brand_sh                    as select * from t_brand                   ; 
create table t_goods_month_browse_sh       as select * from t_goods_month_browse      ; 
create table t_goods_month_sale_total_sh   as select * from t_goods_month_sale_total  ; 
create table t_operational_price_sh        as select * from t_operational_price       ; 
 


#-----------迁移表的sql-------------------------
create table mamahao_price.t_daily_shop_pmt_price_0 as select * from db_gd_dev.t_daily_shop_pmt_price_0;

#------------测试数据---------------------------
select * from t_shop_style_price_base where shop_id=90049620 and valid_date='2018-05-30' and custom_price=0;
select * from t_shop_style_price_base where shop_id=90049620 and item_num_id=774276;
select * from gb_online where sid=90049620;

select * from t_shop_style_price_base where shop_id=90053406 and valid_date='2018-05-31' and custom_price=0;
select * from gb_online where sid=90053406;

select count(1) from gb_online;

select sid ,count(1) from gb_online group by sid;

select * from t_shop_style_price_base where shop_id=37856 and valid_date='2018-05-31' and custom_price=0;
select * from gb_online where sid=90000053;

#--------------------------------------------------------
select max(id) from t_shop_style_price_base;


				
				
				
				
				
				
				
				
				
				
				
				
				