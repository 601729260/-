
#------------上线建表语句--------------------------


alter table t_daily_standard_price add company_id int default 0;
create table t_daily_standard_price_1 as select * from t_daily_standard_price where 1=2;
create table t_daily_standard_price_2 as select * from t_daily_standard_price where 1=2;
create table t_daily_standard_price_3 as select * from t_daily_standard_price where 1=2;
create table t_daily_standard_price_4 as select * from t_daily_standard_price where 1=2;
create table t_daily_standard_price_5 as select * from t_daily_standard_price where 1=2;
create table t_daily_standard_price_6 as select * from t_daily_standard_price where 1=2;
create table t_daily_standard_price_7 as select * from t_daily_standard_price where 1=2;


create index idx_item_num_id_mx_valid_date_1 on t_daily_standard_price_1(item_num_id,valid_date);
create index idx_item_num_id_mx_valid_date_2 on t_daily_standard_price_2(item_num_id,valid_date);
create index idx_item_num_id_mx_valid_date_3 on t_daily_standard_price_3(item_num_id,valid_date);
create index idx_item_num_id_mx_valid_date_4 on t_daily_standard_price_4(item_num_id,valid_date);
create index idx_item_num_id_mx_valid_date_5 on t_daily_standard_price_5(item_num_id,valid_date);
create index idx_item_num_id_mx_valid_date_6 on t_daily_standard_price_6(item_num_id,valid_date);
create index idx_item_num_id_mx_valid_date_7 on t_daily_standard_price_7(item_num_id,valid_date);


   
create table t_daily_custom_price_1 as select * from t_daily_custom_price where 1=2;   
create table t_daily_custom_price_2 as select * from t_daily_custom_price where 1=2;   
create table t_daily_custom_price_3 as select * from t_daily_custom_price where 1=2;   
create table t_daily_custom_price_4 as select * from t_daily_custom_price where 1=2;   
create table t_daily_custom_price_5 as select * from t_daily_custom_price where 1=2;   
create table t_daily_custom_price_6 as select * from t_daily_custom_price where 1=2;   
create table t_daily_custom_price_7 as select * from t_daily_custom_price where 1=2;   


create index idx_item_city_mx_1 on t_daily_custom_price_1  (item_num_id,city_num_id,valid_date);
create index idx_item_city_mx_2 on t_daily_custom_price_2  (item_num_id,city_num_id,valid_date);
create index idx_item_city_mx_3 on t_daily_custom_price_3  (item_num_id,city_num_id,valid_date);
create index idx_item_city_mx_4 on t_daily_custom_price_4  (item_num_id,city_num_id,valid_date);
create index idx_item_city_mx_5 on t_daily_custom_price_5  (item_num_id,city_num_id,valid_date);
create index idx_item_city_mx_6 on t_daily_custom_price_6  (item_num_id,city_num_id,valid_date);
create index idx_item_city_mx_7 on t_daily_custom_price_7  (item_num_id,city_num_id,valid_date);



create table t_daily_shop_pmt_price_1_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_1_9 as select * from t_daily_shop_pmt_price where 1=2;
                                                                                          
create table t_daily_shop_pmt_price_2_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_2_9 as select * from t_daily_shop_pmt_price where 1=2;
                                                                                          
create table t_daily_shop_pmt_price_3_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_3_9 as select * from t_daily_shop_pmt_price where 1=2;
                                                                                          
create table t_daily_shop_pmt_price_4_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_4_9 as select * from t_daily_shop_pmt_price where 1=2;
                                                                                          
create table t_daily_shop_pmt_price_5_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_5_9 as select * from t_daily_shop_pmt_price where 1=2;
                                                                                          
create table t_daily_shop_pmt_price_6_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_6_9 as select * from t_daily_shop_pmt_price where 1=2;
                                                                                          
create table t_daily_shop_pmt_price_7_0 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_1 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_2 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_3 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_4 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_5 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_6 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_7 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_8 as select * from t_daily_shop_pmt_price where 1=2;
create table t_daily_shop_pmt_price_7_9 as select * from t_daily_shop_pmt_price where 1=2;
                              
                                
														
       
create index idx_item_valid_1_0 on t_daily_shop_pmt_price_1_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_1 on t_daily_shop_pmt_price_1_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_2 on t_daily_shop_pmt_price_1_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_3 on t_daily_shop_pmt_price_1_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_4 on t_daily_shop_pmt_price_1_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_5 on t_daily_shop_pmt_price_1_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_6 on t_daily_shop_pmt_price_1_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_7 on t_daily_shop_pmt_price_1_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_8 on t_daily_shop_pmt_price_1_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_1_9 on t_daily_shop_pmt_price_1_9(ITEM_NUM_ID,shop_id,valid_date);

create index idx_item_valid_2_0 on t_daily_shop_pmt_price_2_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_1 on t_daily_shop_pmt_price_2_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_2 on t_daily_shop_pmt_price_2_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_3 on t_daily_shop_pmt_price_2_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_4 on t_daily_shop_pmt_price_2_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_5 on t_daily_shop_pmt_price_2_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_6 on t_daily_shop_pmt_price_2_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_7 on t_daily_shop_pmt_price_2_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_8 on t_daily_shop_pmt_price_2_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_2_9 on t_daily_shop_pmt_price_2_9(ITEM_NUM_ID,shop_id,valid_date);

create index idx_item_valid_3_0 on t_daily_shop_pmt_price_3_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_1 on t_daily_shop_pmt_price_3_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_2 on t_daily_shop_pmt_price_3_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_3 on t_daily_shop_pmt_price_3_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_4 on t_daily_shop_pmt_price_3_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_5 on t_daily_shop_pmt_price_3_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_6 on t_daily_shop_pmt_price_3_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_7 on t_daily_shop_pmt_price_3_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_8 on t_daily_shop_pmt_price_3_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_3_9 on t_daily_shop_pmt_price_3_9(ITEM_NUM_ID,shop_id,valid_date);

create index idx_item_valid_4_0 on t_daily_shop_pmt_price_4_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_1 on t_daily_shop_pmt_price_4_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_2 on t_daily_shop_pmt_price_4_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_3 on t_daily_shop_pmt_price_4_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_4 on t_daily_shop_pmt_price_4_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_5 on t_daily_shop_pmt_price_4_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_6 on t_daily_shop_pmt_price_4_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_7 on t_daily_shop_pmt_price_4_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_8 on t_daily_shop_pmt_price_4_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_4_9 on t_daily_shop_pmt_price_4_9(ITEM_NUM_ID,shop_id,valid_date);

create index idx_item_valid_5_0 on t_daily_shop_pmt_price_5_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_1 on t_daily_shop_pmt_price_5_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_2 on t_daily_shop_pmt_price_5_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_3 on t_daily_shop_pmt_price_5_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_4 on t_daily_shop_pmt_price_5_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_5 on t_daily_shop_pmt_price_5_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_6 on t_daily_shop_pmt_price_5_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_7 on t_daily_shop_pmt_price_5_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_8 on t_daily_shop_pmt_price_5_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_5_9 on t_daily_shop_pmt_price_5_9(ITEM_NUM_ID,shop_id,valid_date);

create index idx_item_valid_6_0 on t_daily_shop_pmt_price_6_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_1 on t_daily_shop_pmt_price_6_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_2 on t_daily_shop_pmt_price_6_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_3 on t_daily_shop_pmt_price_6_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_4 on t_daily_shop_pmt_price_6_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_5 on t_daily_shop_pmt_price_6_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_6 on t_daily_shop_pmt_price_6_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_7 on t_daily_shop_pmt_price_6_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_8 on t_daily_shop_pmt_price_6_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_6_9 on t_daily_shop_pmt_price_6_9(ITEM_NUM_ID,shop_id,valid_date);

create index idx_item_valid_7_0 on t_daily_shop_pmt_price_7_0(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_1 on t_daily_shop_pmt_price_7_1(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_2 on t_daily_shop_pmt_price_7_2(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_3 on t_daily_shop_pmt_price_7_3(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_4 on t_daily_shop_pmt_price_7_4(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_5 on t_daily_shop_pmt_price_7_5(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_6 on t_daily_shop_pmt_price_7_6(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_7 on t_daily_shop_pmt_price_7_7(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_8 on t_daily_shop_pmt_price_7_8(ITEM_NUM_ID,shop_id,valid_date);
create index idx_item_valid_7_9 on t_daily_shop_pmt_price_7_9(ITEM_NUM_ID,shop_id,valid_date);


create table t_daily_company_pmt_price_1 as select * from t_daily_company_pmt_price where 1=2;
create table t_daily_company_pmt_price_2 as select * from t_daily_company_pmt_price where 1=2;
create table t_daily_company_pmt_price_3 as select * from t_daily_company_pmt_price where 1=2;
create table t_daily_company_pmt_price_4 as select * from t_daily_company_pmt_price where 1=2;
create table t_daily_company_pmt_price_5 as select * from t_daily_company_pmt_price where 1=2;
create table t_daily_company_pmt_price_6 as select * from t_daily_company_pmt_price where 1=2;
create table t_daily_company_pmt_price_7 as select * from t_daily_company_pmt_price where 1=2;

create index idx_item_num_id_valid_date_1 on t_daily_company_pmt_price_1(item_num_id,company_id,valid_date);
create index idx_item_num_id_valid_date_2 on t_daily_company_pmt_price_2(item_num_id,company_id,valid_date);
create index idx_item_num_id_valid_date_3 on t_daily_company_pmt_price_3(item_num_id,company_id,valid_date);
create index idx_item_num_id_valid_date_4 on t_daily_company_pmt_price_4(item_num_id,company_id,valid_date);
create index idx_item_num_id_valid_date_5 on t_daily_company_pmt_price_5(item_num_id,company_id,valid_date);
create index idx_item_num_id_valid_date_6 on t_daily_company_pmt_price_6(item_num_id,company_id,valid_date);
create index idx_item_num_id_valid_date_7 on t_daily_company_pmt_price_7(item_num_id,company_id,valid_date);


create table t_daily_country_pmt_price_1 as select * from t_daily_country_pmt_price where 1=2;
create table t_daily_country_pmt_price_2 as select * from t_daily_country_pmt_price where 1=2;
create table t_daily_country_pmt_price_3 as select * from t_daily_country_pmt_price where 1=2;
create table t_daily_country_pmt_price_4 as select * from t_daily_country_pmt_price where 1=2;
create table t_daily_country_pmt_price_5 as select * from t_daily_country_pmt_price where 1=2;
create table t_daily_country_pmt_price_6 as select * from t_daily_country_pmt_price where 1=2;
create table t_daily_country_pmt_price_7 as select * from t_daily_country_pmt_price where 1=2;

create index idx_item_num_id_valid_date_1 on t_daily_country_pmt_price_1(item_num_id,valid_date);
create index idx_item_num_id_valid_date_2 on t_daily_country_pmt_price_2(item_num_id,valid_date);
create index idx_item_num_id_valid_date_3 on t_daily_country_pmt_price_3(item_num_id,valid_date);
create index idx_item_num_id_valid_date_4 on t_daily_country_pmt_price_4(item_num_id,valid_date);
create index idx_item_num_id_valid_date_5 on t_daily_country_pmt_price_5(item_num_id,valid_date);
create index idx_item_num_id_valid_date_6 on t_daily_country_pmt_price_6(item_num_id,valid_date);
create index idx_item_num_id_valid_date_7 on t_daily_country_pmt_price_7(item_num_id,valid_date);


create table t_shop_style_price_base_1 as select * from t_shop_style_price_base where 1=2;
create table t_shop_style_price_base_2 as select * from t_shop_style_price_base where 1=2;
create table t_shop_style_price_base_3 as select * from t_shop_style_price_base where 1=2;
create table t_shop_style_price_base_4 as select * from t_shop_style_price_base where 1=2;
create table t_shop_style_price_base_5 as select * from t_shop_style_price_base where 1=2;
create table t_shop_style_price_base_6 as select * from t_shop_style_price_base where 1=2;
create table t_shop_style_price_base_7 as select * from t_shop_style_price_base where 1=2;

create index IDX_SHOP_ID_VALID_DATE_1 on t_shop_style_price_base_1(style_num_id,shop_id);
create index IDX_SHOP_ID_VALID_DATE_2 on t_shop_style_price_base_2(style_num_id,shop_id);
create index IDX_SHOP_ID_VALID_DATE_3 on t_shop_style_price_base_3(style_num_id,shop_id);
create index IDX_SHOP_ID_VALID_DATE_4 on t_shop_style_price_base_4(style_num_id,shop_id);
create index IDX_SHOP_ID_VALID_DATE_5 on t_shop_style_price_base_5(style_num_id,shop_id);
create index IDX_SHOP_ID_VALID_DATE_6 on t_shop_style_price_base_6(style_num_id,shop_id);
create index IDX_SHOP_ID_VALID_DATE_7 on t_shop_style_price_base_7(style_num_id,shop_id);


alter table t_shop_style_price_base_1 add PRIMARY key(style_num_id,shop_id,valid_date);
alter table t_shop_style_price_base_2 add PRIMARY key(style_num_id,shop_id,valid_date);
alter table t_shop_style_price_base_3 add PRIMARY key(style_num_id,shop_id,valid_date);
alter table t_shop_style_price_base_4 add PRIMARY key(style_num_id,shop_id,valid_date);
alter table t_shop_style_price_base_5 add PRIMARY key(style_num_id,shop_id,valid_date);
alter table t_shop_style_price_base_6 add PRIMARY key(style_num_id,shop_id,valid_date);
alter table t_shop_style_price_base_7 add PRIMARY key(style_num_id,shop_id,valid_date);

create table t_city_style_price_base_1 as select * from t_city_style_price_base where 1=2;
create table t_city_style_price_base_2 as select * from t_city_style_price_base where 1=2;
create table t_city_style_price_base_3 as select * from t_city_style_price_base where 1=2;
create table t_city_style_price_base_4 as select * from t_city_style_price_base where 1=2;
create table t_city_style_price_base_5 as select * from t_city_style_price_base where 1=2;
create table t_city_style_price_base_6 as select * from t_city_style_price_base where 1=2;
create table t_city_style_price_base_7 as select * from t_city_style_price_base where 1=2;

create index IDX_CITY_NUM_ID_VALID_DATE_1 on t_city_style_price_base_1(city_num_id,valid_date);
create index IDX_CITY_NUM_ID_VALID_DATE_2 on t_city_style_price_base_2(city_num_id,valid_date);
create index IDX_CITY_NUM_ID_VALID_DATE_3 on t_city_style_price_base_3(city_num_id,valid_date);
create index IDX_CITY_NUM_ID_VALID_DATE_4 on t_city_style_price_base_4(city_num_id,valid_date);
create index IDX_CITY_NUM_ID_VALID_DATE_5 on t_city_style_price_base_5(city_num_id,valid_date);
create index IDX_CITY_NUM_ID_VALID_DATE_6 on t_city_style_price_base_6(city_num_id,valid_date);
create index IDX_CITY_NUM_ID_VALID_DATE_7 on t_city_style_price_base_7(city_num_id,valid_date);

alter table t_city_style_price_base_7




alter table t_city_style_price_base_1 add primary key(city_num_id,style_num_id,valid_date);
alter table t_city_style_price_base_2 add primary key(city_num_id,style_num_id,valid_date);
alter table t_city_style_price_base_3 add primary key(city_num_id,style_num_id,valid_date);
alter table t_city_style_price_base_4 add primary key(city_num_id,style_num_id,valid_date);
alter table t_city_style_price_base_5 add primary key(city_num_id,style_num_id,valid_date);
alter table t_city_style_price_base_6 add primary key(city_num_id,style_num_id,valid_date);
alter table t_city_style_price_base_7 add primary key(city_num_id,style_num_id,valid_date);


insert into t_daily_standard_price_4 select * from t_daily_standard_price       where valid_date='2018-07-05'；
insert into t_daily_custom_price_4 select * from t_daily_custom_price           where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_0 select * from t_daily_shop_pmt_price_0   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_1 select * from t_daily_shop_pmt_price_1   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_2 select * from t_daily_shop_pmt_price_2   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_3 select * from t_daily_shop_pmt_price_3   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_4 select * from t_daily_shop_pmt_price_4   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_5 select * from t_daily_shop_pmt_price_5   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_6 select * from t_daily_shop_pmt_price_6   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_7 select * from t_daily_shop_pmt_price_7   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_8 select * from t_daily_shop_pmt_price_8   where valid_date='2018-07-05'；
insert into t_daily_shop_pmt_price_4_9 select * from t_daily_shop_pmt_price_9   where valid_date='2018-07-05'；
insert into t_daily_company_pmt_price_4 select * from t_daily_company_pmt_price where valid_date='2018-07-05'；
insert into t_daily_country_pmt_price_4 select * from t_daily_country_pmt_price where valid_date='2018-07-05'；
insert into t_shop_style_price_base_4 select * from t_shop_style_price_base     where valid_date='2018-07-05' group by shop_id,style_num_id,valid_date;
                                                                                                                                                           
insert into t_city_style_price_base_4 select * from t_city_style_price_base     where valid_date='2018-07-05' group by city_num_id,style_num_id,valid_date;



alter table t_daily_standard_price     rename to  t_daily_standard_price_20180628     ;  
alter table t_daily_custom_price       rename to  t_daily_custom_price_20180628       ;  
alter table t_daily_shop_pmt_price_0   rename to  t_daily_shop_pmt_price_0_20180628   ;  
alter table t_daily_shop_pmt_price_1   rename to  t_daily_shop_pmt_price_1_20180628   ;  
alter table t_daily_shop_pmt_price_2   rename to  t_daily_shop_pmt_price_2_20180628   ;  
alter table t_daily_shop_pmt_price_3   rename to  t_daily_shop_pmt_price_3_20180628   ;  
alter table t_daily_shop_pmt_price_4   rename to  t_daily_shop_pmt_price_4_20180628   ;  
alter table t_daily_shop_pmt_price_5   rename to  t_daily_shop_pmt_price_5_20180628   ;  
alter table t_daily_shop_pmt_price_6   rename to  t_daily_shop_pmt_price_6_20180628   ;  
alter table t_daily_shop_pmt_price_7   rename to  t_daily_shop_pmt_price_7_20180628   ;  
alter table t_daily_shop_pmt_price_8   rename to  t_daily_shop_pmt_price_8_20180628   ;  
alter table t_daily_shop_pmt_price_9   rename to  t_daily_shop_pmt_price_9_20180628   ;  
alter table t_daily_company_pmt_price  rename to  t_daily_company_pmt_price_20180628  ;  
alter table t_daily_country_pmt_price  rename to  t_daily_country_pmt_price_20180628  ;  
alter table t_shop_style_price_base    rename to  t_shop_style_price_base_20180628    ;  
alter table t_city_style_price_base    rename to  t_city_style_price_base_20180628    ;  


