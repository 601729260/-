select * from t_daily_standard_price_3 limit 100;
select * from t_daily_custom_price_3 limit 100;

select * from t_daily_shop_pmt_price_3_0 limit 100;

select * from t_daily_company_pmt_price_3 limit 100;

select * from t_daily_country_pmt_price_3 limit 100;

select * from t_shop_style_price_base_3 limit 100;

select * from t_city_style_price_base_1 limit 100;
--------------------------查看生成的数据-------------------------------------------------                                                            
                                                                                                                                              
select 't_daily_standard_price_4   ', count(1) from t_daily_standard_price_4    union all                                                     
select 't_daily_custom_price_4     ', count(1) from t_daily_custom_price_4      union all                                                     
select 't_daily_shop_pmt_price_4_0 ', count(1) from t_daily_shop_pmt_price_4_0  union all                                                     
select 't_daily_shop_pmt_price_4_1 ', count(1) from t_daily_shop_pmt_price_4_1  union all                                                     
select 't_daily_shop_pmt_price_4_2 ', count(1) from t_daily_shop_pmt_price_4_2  union all                                                     
select 't_daily_shop_pmt_price_4_3 ', count(1) from t_daily_shop_pmt_price_4_3  union all                                                     
select 't_daily_shop_pmt_price_4_4 ', count(1) from t_daily_shop_pmt_price_4_4  union all                                                     
select 't_daily_shop_pmt_price_4_5 ', count(1) from t_daily_shop_pmt_price_4_5  union all                                                     
select 't_daily_shop_pmt_price_4_6 ', count(1) from t_daily_shop_pmt_price_4_6  union all                                                     
select 't_daily_shop_pmt_price_4_7 ', count(1) from t_daily_shop_pmt_price_4_7  union all                                                     
select 't_daily_shop_pmt_price_4_8 ', count(1) from t_daily_shop_pmt_price_4_8  union all                                                     
select 't_daily_shop_pmt_price_4_9 ', count(1) from t_daily_shop_pmt_price_4_9  union all                                                     
select 't_daily_company_pmt_price_4', count(1) from t_daily_company_pmt_price_4 union all                                                      
select 't_daily_country_pmt_price_4', count(1) from t_daily_country_pmt_price_4 union all                                                     
select 't_shop_style_price_base_4  ', count(1) from t_shop_style_price_base_4   union all                                                     
select 't_city_style_price_base_4  ', count(1) from t_city_style_price_base_4   ; 

--------------------------查看生成的数据-------------------------------------------------

select 't_daily_standard_price_3   ', count(1) from t_daily_standard_price_3    union all
select 't_daily_custom_price_3     ', count(1) from t_daily_custom_price_3      union all                                                  
select 't_daily_shop_pmt_price_3_0 ', count(1) from t_daily_shop_pmt_price_3_0  union all                                                
select 't_daily_shop_pmt_price_3_1 ', count(1) from t_daily_shop_pmt_price_3_1  union all                                                
select 't_daily_shop_pmt_price_3_2 ', count(1) from t_daily_shop_pmt_price_3_2  union all                                                
select 't_daily_shop_pmt_price_3_3 ', count(1) from t_daily_shop_pmt_price_3_3  union all                                                
select 't_daily_shop_pmt_price_3_4 ', count(1) from t_daily_shop_pmt_price_3_4  union all                                                
select 't_daily_shop_pmt_price_3_5 ', count(1) from t_daily_shop_pmt_price_3_5  union all                                                
select 't_daily_shop_pmt_price_3_6 ', count(1) from t_daily_shop_pmt_price_3_6  union all                                                
select 't_daily_shop_pmt_price_3_7 ', count(1) from t_daily_shop_pmt_price_3_7  union all                                                
select 't_daily_shop_pmt_price_3_8 ', count(1) from t_daily_shop_pmt_price_3_8  union all                                                
select 't_daily_shop_pmt_price_3_9 ', count(1) from t_daily_shop_pmt_price_3_9  union all                                                
select 't_daily_company_pmt_price_3', count(1) from t_daily_company_pmt_price_3 union all 
select 't_daily_country_pmt_price_3', count(1) from t_daily_country_pmt_price_3 union all                                                     
select 't_shop_style_price_base_3  ', count(1) from t_shop_style_price_base_3   union all                                                     
select 't_city_style_price_base_3  ', count(1) from t_city_style_price_base_3   ;  


-----------------------清除数据------------------------------------------
truncate table  t_daily_standard_price_3    ;
truncate table  t_daily_custom_price_3      ;
truncate table  t_daily_shop_pmt_price_3_0  ;
truncate table  t_daily_shop_pmt_price_3_1  ;
truncate table  t_daily_shop_pmt_price_3_2  ;
truncate table  t_daily_shop_pmt_price_3_3  ;
truncate table  t_daily_shop_pmt_price_3_4  ;
truncate table  t_daily_shop_pmt_price_3_5  ;
truncate table  t_daily_shop_pmt_price_3_6  ;
truncate table  t_daily_shop_pmt_price_3_7  ;
truncate table  t_daily_shop_pmt_price_3_8  ;
truncate table  t_daily_shop_pmt_price_3_9  ;
truncate table  t_daily_company_pmt_price_3 ;
truncate table  t_daily_country_pmt_price_3 ;
truncate table  t_shop_style_price_base_3   ;
truncate table  t_city_style_price_base_3   ;


--------------------------查看生成的数据-------------------------------------------------

select 't_daily_standard_price_2   ', count(1) from t_daily_standard_price_2    union all
select 't_daily_custom_price_2     ', count(1) from t_daily_custom_price_2      union all                                                  
select 't_daily_shop_pmt_price_2_0 ', count(1) from t_daily_shop_pmt_price_2_0  union all                                                
select 't_daily_shop_pmt_price_2_1 ', count(1) from t_daily_shop_pmt_price_2_1  union all                                                
select 't_daily_shop_pmt_price_2_2 ', count(1) from t_daily_shop_pmt_price_2_2  union all                                                
select 't_daily_shop_pmt_price_2_2 ', count(1) from t_daily_shop_pmt_price_2_3  union all                                                
select 't_daily_shop_pmt_price_2_4 ', count(1) from t_daily_shop_pmt_price_2_4  union all                                                
select 't_daily_shop_pmt_price_2_5 ', count(1) from t_daily_shop_pmt_price_2_5  union all                                                
select 't_daily_shop_pmt_price_2_6 ', count(1) from t_daily_shop_pmt_price_2_6  union all                                                
select 't_daily_shop_pmt_price_2_7 ', count(1) from t_daily_shop_pmt_price_2_7  union all                                                
select 't_daily_shop_pmt_price_2_8 ', count(1) from t_daily_shop_pmt_price_2_8  union all                                                
select 't_daily_shop_pmt_price_2_9 ', count(1) from t_daily_shop_pmt_price_2_9  union all                                                
select 't_daily_company_pmt_price_2', count(1) from t_daily_company_pmt_price_2 union all 
select 't_daily_country_pmt_price_2', count(1) from t_daily_country_pmt_price_2 union all                                                     
select 't_shop_style_price_base_2  ', count(1) from t_shop_style_price_base_2   union all                                                     
select 't_city_style_price_base_2  ', count(1) from t_city_style_price_base_2   ;  


-----------------------清除数据------------------------------------------
truncate table  t_daily_standard_price_2    ;
truncate table  t_daily_custom_price_2      ;
truncate table  t_daily_shop_pmt_price_2_0  ;
truncate table  t_daily_shop_pmt_price_2_1  ;
truncate table  t_daily_shop_pmt_price_2_2  ;
truncate table  t_daily_shop_pmt_price_2_3  ;
truncate table  t_daily_shop_pmt_price_2_4  ;
truncate table  t_daily_shop_pmt_price_2_5  ;
truncate table  t_daily_shop_pmt_price_2_6  ;
truncate table  t_daily_shop_pmt_price_2_7  ;
truncate table  t_daily_shop_pmt_price_2_8  ;
truncate table  t_daily_shop_pmt_price_2_9  ;
truncate table  t_daily_company_pmt_price_2 ;
truncate table  t_daily_country_pmt_price_2 ;
truncate table  t_shop_style_price_base_2   ;
truncate table  t_city_style_price_base_2   ;

select * from t_daily_standard_price_4 where create_time>'2018-07-04 11:00:00' limit 1;

truncate table   t_daily_standard_price_4     ;  
truncate table   t_daily_custom_price_4       ;  
truncate table   t_daily_shop_pmt_price_4_0   ;  
truncate table   t_daily_shop_pmt_price_4_1   ;  
truncate table   t_daily_shop_pmt_price_4_2   ;  
truncate table   t_daily_shop_pmt_price_4_3   ;  
truncate table   t_daily_shop_pmt_price_4_4   ;  
truncate table   t_daily_shop_pmt_price_4_5   ;  
truncate table   t_daily_shop_pmt_price_4_6   ;  
truncate table   t_daily_shop_pmt_price_4_7   ;  
truncate table   t_daily_shop_pmt_price_4_8   ;  
truncate table   t_daily_shop_pmt_price_4_9   ;  
truncate table   t_daily_company_pmt_price_4  ;  
truncate table   t_daily_country_pmt_price_4  ;  
truncate table   t_shop_style_price_base_4    ;  
truncate table   t_city_style_price_base_4    ;  


truncate table   t_daily_standard_price_5     ;  
truncate table   t_daily_custom_price_5       ;  
truncate table   t_daily_shop_pmt_price_5_0   ;  
truncate table   t_daily_shop_pmt_price_5_1   ;  
truncate table   t_daily_shop_pmt_price_5_2   ;  
truncate table   t_daily_shop_pmt_price_5_3   ;  
truncate table   t_daily_shop_pmt_price_5_4   ;  
truncate table   t_daily_shop_pmt_price_5_5   ;  
truncate table   t_daily_shop_pmt_price_5_6   ;  
truncate table   t_daily_shop_pmt_price_5_7   ;  
truncate table   t_daily_shop_pmt_price_5_8   ;  
truncate table   t_daily_shop_pmt_price_5_9   ;  
truncate table   t_daily_company_pmt_price_5  ;  
truncate table   t_daily_country_pmt_price_5  ;  
truncate table   t_shop_style_price_base_5    ;  
truncate table   t_city_style_price_base_5    ;  

select 't_daily_standard_price_5   ', count(1) from t_daily_standard_price_5    union all                                                     
select 't_daily_custom_price_5     ', count(1) from t_daily_custom_price_5      union all                                                     
select 't_daily_shop_pmt_price_5_0 ', count(1) from t_daily_shop_pmt_price_5_0  union all                                                     
select 't_daily_shop_pmt_price_5_1 ', count(1) from t_daily_shop_pmt_price_5_1  union all                                                     
select 't_daily_shop_pmt_price_5_2 ', count(1) from t_daily_shop_pmt_price_5_2  union all                                                     
select 't_daily_shop_pmt_price_5_3 ', count(1) from t_daily_shop_pmt_price_5_3  union all                                                     
select 't_daily_shop_pmt_price_5_4 ', count(1) from t_daily_shop_pmt_price_5_4  union all                                                     
select 't_daily_shop_pmt_price_5_5 ', count(1) from t_daily_shop_pmt_price_5_5  union all                                                     
select 't_daily_shop_pmt_price_5_6 ', count(1) from t_daily_shop_pmt_price_5_6  union all                                                     
select 't_daily_shop_pmt_price_5_7 ', count(1) from t_daily_shop_pmt_price_5_7  union all                                                     
select 't_daily_shop_pmt_price_5_8 ', count(1) from t_daily_shop_pmt_price_5_8  union all                                                     
select 't_daily_shop_pmt_price_5_9 ', count(1) from t_daily_shop_pmt_price_5_9  union all                                                     
select 't_daily_company_pmt_price_5', count(1) from t_daily_company_pmt_price_5 union all                                                      
select 't_daily_country_pmt_price_5', count(1) from t_daily_country_pmt_price_5 union all                                                     
select 't_shop_style_price_base_5  ', count(1) from t_shop_style_price_base_5   union all                                                     
select 't_city_style_price_base_5  ', count(1) from t_city_style_price_base_5   ; 

------------------准备测试truncate table的数据-------------------------------
truncate table   t_daily_standard_price_3     ;  
truncate table   t_daily_custom_price_3       ;  
truncate table   t_daily_shop_pmt_price_3_0   ;  
truncate table   t_daily_shop_pmt_price_3_1   ;  
truncate table   t_daily_shop_pmt_price_3_2   ;  
truncate table   t_daily_shop_pmt_price_3_3   ;  
truncate table   t_daily_shop_pmt_price_3_4   ;  
truncate table   t_daily_shop_pmt_price_3_5   ;  
truncate table   t_daily_shop_pmt_price_3_6   ;  
truncate table   t_daily_shop_pmt_price_3_7   ;  
truncate table   t_daily_shop_pmt_price_3_8   ;  
truncate table   t_daily_shop_pmt_price_3_9   ;  
truncate table   t_daily_company_pmt_price_3  ;  
truncate table   t_daily_country_pmt_price_3  ;  
truncate table   t_shop_style_price_base_3    ;  
truncate table   t_city_style_price_base_3    ;  



insert into  t_daily_standard_price_3     select * from t_daily_standard_price_4   ;     
insert into  t_daily_custom_price_3       select * from t_daily_custom_price_4     ;     
insert into  t_daily_shop_pmt_price_3_0   select * from t_daily_shop_pmt_price_4_0 ;     
insert into  t_daily_shop_pmt_price_3_1   select * from t_daily_shop_pmt_price_4_1 ;     
insert into  t_daily_shop_pmt_price_3_2   select * from t_daily_shop_pmt_price_4_2 ;     
insert into  t_daily_shop_pmt_price_3_3   select * from t_daily_shop_pmt_price_4_3 ;     
insert into  t_daily_shop_pmt_price_3_4   select * from t_daily_shop_pmt_price_4_4 ;     
insert into  t_daily_shop_pmt_price_3_5   select * from t_daily_shop_pmt_price_4_5 ;     
insert into  t_daily_shop_pmt_price_3_6   select * from t_daily_shop_pmt_price_4_6 ;     
insert into  t_daily_shop_pmt_price_3_7   select * from t_daily_shop_pmt_price_4_7 ;     
insert into  t_daily_shop_pmt_price_3_8   select * from t_daily_shop_pmt_price_4_8 ;     
insert into  t_daily_shop_pmt_price_3_9   select * from t_daily_shop_pmt_price_4_9 ;     
insert into  t_daily_company_pmt_price_3  select * from t_daily_company_pmt_price_4;     
insert into  t_daily_country_pmt_price_3  select * from t_daily_country_pmt_price_4;     
insert into  t_shop_style_price_base_3    select * from t_shop_style_price_base_4  ;     
insert into  t_city_style_price_base_3    select * from t_city_style_price_base_4  ; 


update   t_daily_standard_price_3     set valid_date='2018-07-04';  
update   t_daily_custom_price_3       set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_0   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_1   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_2   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_3   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_4   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_5   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_6   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_7   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_8   set valid_date='2018-07-04';  
update   t_daily_shop_pmt_price_3_9   set valid_date='2018-07-04';  
update   t_daily_company_pmt_price_3  set valid_date='2018-07-04';  
update   t_daily_country_pmt_price_3  set valid_date='2018-07-04';  
update   t_shop_style_price_base_3    set valid_date='2018-07-04';  
update   t_city_style_price_base_3    set valid_date='2018-07-04';



------------------准备测试truncate table的数据-------------------------------
truncate table   t_daily_standard_price_7     ;  
truncate table   t_daily_custom_price_7       ;  
truncate table   t_daily_shop_pmt_price_7_0   ;  
truncate table   t_daily_shop_pmt_price_7_1   ;  
truncate table   t_daily_shop_pmt_price_7_2   ;  
truncate table   t_daily_shop_pmt_price_7_3   ;  
truncate table   t_daily_shop_pmt_price_7_4   ;  
truncate table   t_daily_shop_pmt_price_7_5   ;  
truncate table   t_daily_shop_pmt_price_7_6   ;  
truncate table   t_daily_shop_pmt_price_7_7   ;  
truncate table   t_daily_shop_pmt_price_7_8   ;  
truncate table   t_daily_shop_pmt_price_7_9   ;  
truncate table   t_daily_company_pmt_price_7  ;  
truncate table   t_daily_country_pmt_price_7  ;  
truncate table   t_shop_style_price_base_7    ;  
truncate table   t_city_style_price_base_7    ;  



insert into  t_daily_standard_price_7     select * from t_daily_standard_price_2   ;     
insert into  t_daily_custom_price_7       select * from t_daily_custom_price_2     ;     
insert into  t_daily_shop_pmt_price_7_0   select * from t_daily_shop_pmt_price_2_0 ;     
insert into  t_daily_shop_pmt_price_7_1   select * from t_daily_shop_pmt_price_2_1 ;     
insert into  t_daily_shop_pmt_price_7_2   select * from t_daily_shop_pmt_price_2_2 ;     
insert into  t_daily_shop_pmt_price_7_3   select * from t_daily_shop_pmt_price_2_3 ;     
insert into  t_daily_shop_pmt_price_7_4   select * from t_daily_shop_pmt_price_2_4 ;     
insert into  t_daily_shop_pmt_price_7_5   select * from t_daily_shop_pmt_price_2_5 ;     
insert into  t_daily_shop_pmt_price_7_6   select * from t_daily_shop_pmt_price_2_6 ;     
insert into  t_daily_shop_pmt_price_7_7   select * from t_daily_shop_pmt_price_2_7 ;     
insert into  t_daily_shop_pmt_price_7_8   select * from t_daily_shop_pmt_price_2_8 ;     
insert into  t_daily_shop_pmt_price_7_9   select * from t_daily_shop_pmt_price_2_9 ;     
insert into  t_daily_company_pmt_price_7  select * from t_daily_company_pmt_price_2;     
insert into  t_daily_country_pmt_price_7  select * from t_daily_country_pmt_price_2;     
insert into  t_shop_style_price_base_7    select * from t_shop_style_price_base_2  ;     
insert into  t_city_style_price_base_7    select * from t_city_style_price_base_2  ;   
-----------------查看truncate 效果-------------------------------------------

                                                                                                                                              
select 't_daily_standard_price_7   ', count(1) from t_daily_standard_price_7    union all                                                                                                 
select 't_daily_custom_price_7     ', count(1) from t_daily_custom_price_7      union all                                                                                               
select 't_daily_shop_pmt_price_7_0 ', count(1) from t_daily_shop_pmt_price_7_0  union all                                                                                               
select 't_daily_shop_pmt_price_7_1 ', count(1) from t_daily_shop_pmt_price_7_1  union all                                                                                               
select 't_daily_shop_pmt_price_7_2 ', count(1) from t_daily_shop_pmt_price_7_2  union all                                                                                               
select 't_daily_shop_pmt_price_7_3 ', count(1) from t_daily_shop_pmt_price_7_3  union all                                                                                               
select 't_daily_shop_pmt_price_7_4 ', count(1) from t_daily_shop_pmt_price_7_4  union all                                                                                               
select 't_daily_shop_pmt_price_7_5 ', count(1) from t_daily_shop_pmt_price_7_5  union all                                                                                               
select 't_daily_shop_pmt_price_7_6 ', count(1) from t_daily_shop_pmt_price_7_6  union all                                                                                               
select 't_daily_shop_pmt_price_7_7 ', count(1) from t_daily_shop_pmt_price_7_7  union all                                                                                               
select 't_daily_shop_pmt_price_7_8 ', count(1) from t_daily_shop_pmt_price_7_8  union all                                                                                               
select 't_daily_shop_pmt_price_7_9 ', count(1) from t_daily_shop_pmt_price_7_9  union all                                                     
select 't_daily_company_pmt_price_7', count(1) from t_daily_company_pmt_price_7 union all                                                                                                    
select 't_daily_country_pmt_price_7', count(1) from t_daily_country_pmt_price_7 union all                                                                                                    
select 't_shop_style_price_base_7  ', count(1) from t_shop_style_price_base_7   union all                                                     
select 't_city_style_price_base_7  ', count(1) from t_city_style_price_base_7   ;     


------------------准备测试truncate table的数据-------------------------------
insert into  t_daily_standard_price_1     select * from t_daily_standard_price_2   ;     
insert into  t_daily_custom_price_1       select * from t_daily_custom_price_2     ;     
insert into  t_daily_shop_pmt_price_1_0   select * from t_daily_shop_pmt_price_2_0 ;     
insert into  t_daily_shop_pmt_price_1_1   select * from t_daily_shop_pmt_price_2_1 ;     
insert into  t_daily_shop_pmt_price_1_2   select * from t_daily_shop_pmt_price_2_2 ;     
insert into  t_daily_shop_pmt_price_1_3   select * from t_daily_shop_pmt_price_2_3 ;     
insert into  t_daily_shop_pmt_price_1_4   select * from t_daily_shop_pmt_price_2_4 ;     
insert into  t_daily_shop_pmt_price_1_5   select * from t_daily_shop_pmt_price_2_5 ;     
insert into  t_daily_shop_pmt_price_1_6   select * from t_daily_shop_pmt_price_2_6 ;     
insert into  t_daily_shop_pmt_price_1_7   select * from t_daily_shop_pmt_price_2_1 ;     
insert into  t_daily_shop_pmt_price_1_8   select * from t_daily_shop_pmt_price_2_8 ;     
insert into  t_daily_shop_pmt_price_1_9   select * from t_daily_shop_pmt_price_2_9 ;     
insert into  t_daily_company_pmt_price_1  select * from t_daily_company_pmt_price_2;     
insert into  t_daily_country_pmt_price_1  select * from t_daily_country_pmt_price_2;     
insert into  t_shop_style_price_base_1    select * from t_shop_style_price_base_2  ;     
insert into  t_city_style_price_base_1    select * from t_city_style_price_base_2  ;   
-----------------查看truncate 效果-------------------------------------------

                                                                                                                                              
select 't_daily_standard_price_1   ', count(1) from t_daily_standard_price_1    union all                                                                                                 
select 't_daily_custom_price_1     ', count(1) from t_daily_custom_price_1      union all                                                                                               
select 't_daily_shop_pmt_price_1_0 ', count(1) from t_daily_shop_pmt_price_1_0  union all                                                                                               
select 't_daily_shop_pmt_price_1_1 ', count(1) from t_daily_shop_pmt_price_1_1  union all                                                                                               
select 't_daily_shop_pmt_price_1_2 ', count(1) from t_daily_shop_pmt_price_1_2  union all                                                                                               
select 't_daily_shop_pmt_price_1_3 ', count(1) from t_daily_shop_pmt_price_1_3  union all                                                                                               
select 't_daily_shop_pmt_price_1_4 ', count(1) from t_daily_shop_pmt_price_1_4  union all                                                                                               
select 't_daily_shop_pmt_price_1_5 ', count(1) from t_daily_shop_pmt_price_1_5  union all                                                                                               
select 't_daily_shop_pmt_price_1_6 ', count(1) from t_daily_shop_pmt_price_1_6  union all                                                                                               
select 't_daily_shop_pmt_price_1_7 ', count(1) from t_daily_shop_pmt_price_1_7  union all                                                                                               
select 't_daily_shop_pmt_price_1_8 ', count(1) from t_daily_shop_pmt_price_1_8  union all                                                                                               
select 't_daily_shop_pmt_price_1_9 ', count(1) from t_daily_shop_pmt_price_1_9  union all                                                     
select 't_daily_company_pmt_price_1', count(1) from t_daily_company_pmt_price_1 union all                                                                                                    
select 't_daily_country_pmt_price_1', count(1) from t_daily_country_pmt_price_1 union all                                                                                                    
select 't_shop_style_price_base_1  ', count(1) from t_shop_style_price_base_1   union all                                                     
select 't_city_style_price_base_1  ', count(1) from t_city_style_price_base_1   ;     




------------------准备测试truncate table的数据-------------------------------
insert into  t_daily_standard_price_7     select * from t_daily_standard_price_3   ;     
insert into  t_daily_custom_price_7       select * from t_daily_custom_price_3     ;     
insert into  t_daily_shop_pmt_price_7_0   select * from t_daily_shop_pmt_price_3_0 ;     
insert into  t_daily_shop_pmt_price_7_1   select * from t_daily_shop_pmt_price_3_1 ;     
insert into  t_daily_shop_pmt_price_7_2   select * from t_daily_shop_pmt_price_3_2 ;     
insert into  t_daily_shop_pmt_price_7_3   select * from t_daily_shop_pmt_price_3_3 ;     
insert into  t_daily_shop_pmt_price_7_4   select * from t_daily_shop_pmt_price_3_4 ;     
insert into  t_daily_shop_pmt_price_7_5   select * from t_daily_shop_pmt_price_3_5 ;     
insert into  t_daily_shop_pmt_price_7_6   select * from t_daily_shop_pmt_price_3_6 ;     
insert into  t_daily_shop_pmt_price_7_7   select * from t_daily_shop_pmt_price_3_7 ;     
insert into  t_daily_shop_pmt_price_7_8   select * from t_daily_shop_pmt_price_3_8 ;     
insert into  t_daily_shop_pmt_price_7_9   select * from t_daily_shop_pmt_price_3_9 ;     
insert into  t_daily_company_pmt_price_7  select * from t_daily_company_pmt_price_3;     
insert into  t_daily_country_pmt_price_7  select * from t_daily_country_pmt_price_3;     
insert into  t_shop_style_price_base_7    select * from t_shop_style_price_base_3  ;     
insert into  t_city_style_price_base_7    select * from t_city_style_price_base_3  ;     

-----------------查看truncate 效果-------------------------------------------

                                                                                                                                              
select 't_daily_standard_price_7   ', count(1) from t_daily_standard_price_7    union all                                                                                                 
select 't_daily_custom_price_7     ', count(1) from t_daily_custom_price_7      union all                                                                                               
select 't_daily_shop_pmt_price_7_0 ', count(1) from t_daily_shop_pmt_price_7_0  union all                                                                                               
select 't_daily_shop_pmt_price_7_1 ', count(1) from t_daily_shop_pmt_price_7_1  union all                                                                                               
select 't_daily_shop_pmt_price_7_2 ', count(1) from t_daily_shop_pmt_price_7_2  union all                                                                                               
select 't_daily_shop_pmt_price_7_3 ', count(1) from t_daily_shop_pmt_price_7_3  union all                                                                                               
select 't_daily_shop_pmt_price_7_4 ', count(1) from t_daily_shop_pmt_price_7_4  union all                                                                                               
select 't_daily_shop_pmt_price_7_5 ', count(1) from t_daily_shop_pmt_price_7_5  union all                                                                                               
select 't_daily_shop_pmt_price_7_6 ', count(1) from t_daily_shop_pmt_price_7_6  union all                                                                                               
select 't_daily_shop_pmt_price_7_7 ', count(1) from t_daily_shop_pmt_price_7_7  union all                                                                                               
select 't_daily_shop_pmt_price_7_8 ', count(1) from t_daily_shop_pmt_price_7_8  union all                                                                                               
select 't_daily_shop_pmt_price_7_9 ', count(1) from t_daily_shop_pmt_price_7_9  union all                                                     
select 't_daily_company_pmt_price_7', count(1) from t_daily_company_pmt_price_7 union all                                                                                                    
select 't_daily_country_pmt_price_7', count(1) from t_daily_country_pmt_price_7 union all                                                                                                    
select 't_shop_style_price_base_7  ', count(1) from t_shop_style_price_base_7   union all                                                     
select 't_city_style_price_base_7  ', count(1) from t_city_style_price_base_7   ;     


---------------单元测试stock queryWillRefreshCityGoodsIndexByShopIdAndStyle---------------

select * from t_city_style_price_base_20180619 where style_num_id=343 and shop_id=52468;
delete from db_gd_dev.t_city_style_price_base_1;
INSERT INTO db_gd_dev.t_city_style_price_base_1(`id`, `create_time`, `update_time`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `pre_heat_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `shop_id`, `local_shop_city_num_id`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_clicks`, `month_sales`, `goods_corner`) VALUES (371367050, '2018-06-18 22:14:16', '2018-06-18 22:14:16', '2018-05-25 14:57:51', 343, '386518', 12017799, -1, 299.00, 299.00, 0.00, 0.00, 0.00, 0.00, 0.00, 52468, 320500, 0, '2018-06-25', 'NIKE耐克SUNRAY ADJUST 4 (GS/PS)男小童凉鞋', '386518_20161018152429_20161222174652_20170721095026.jpg', 306, 309, 336, '时尚童鞋', '小童童鞋', '运动鞋', 8, 75, 'NIKE', '36-84,84-', 1, 1602, 144971, 0, 0, NULL, 4, 1, 0, 0, 234, 921, '');
INSERT INTO db_gd_dev.t_city_style_price_base_1(`id`, `create_time`, `update_time`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `pre_heat_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `shop_id`, `local_shop_city_num_id`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_clicks`, `month_sales`, `goods_corner`) VALUES (371391623, '2018-06-18 22:14:20', '2018-06-18 22:14:20', '2018-05-25 14:57:51', 343, '386518', 12017799, 120100, 299.00, 299.00, 0.00, 0.00, 0.00, 0.00, 0.00, 52468, 320500, 0, '2018-06-25', 'NIKE耐克SUNRAY ADJUST 4 (GS/PS)男小童凉鞋', '386518_20161018152429_20161222174652_20170721095026.jpg', 306, 309, 336, '时尚童鞋', '小童童鞋', '运动鞋', 8, 75, 'NIKE', '36-84,84-', 1, 1602, 144971, 0, 0, NULL, 4, 1, 0, 0, 234, 921, '');
INSERT INTO db_gd_dev.t_city_style_price_base_1(`id`, `create_time`, `update_time`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `pre_heat_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `shop_id`, `local_shop_city_num_id`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_clicks`, `month_sales`, `goods_corner`) VALUES (371399814, '2018-06-18 22:14:22', '2018-06-18 22:14:22', '2018-05-25 14:57:51', 343, '386518', 12017799, 130100, 299.00, 299.00, 0.00, 0.00, 0.00, 0.00, 0.00, 52468, 320500, 0, '2018-06-25', 'NIKE耐克SUNRAY ADJUST 4 (GS/PS)男小童凉鞋', '386518_20161018152429_20161222174652_20170721095026.jpg', 306, 309, 336, '时尚童鞋', '小童童鞋', '运动鞋', 8, 75, 'NIKE', '36-84,84-', 1, 1602, 144971, 0, 0, NULL, 4, 1, 0, 0, 234, 921, '');


--------------单元测试search---------------------------------------

#  queryForGoodsIndex shop
# queryGoodsIndexForPromotionInfo shop
#querAllShopId

select * from t_shop_style_price_base_20180619 limit 3;
delete from db_gd_dev.t_shop_style_price_base_2;
INSERT INTO  db_gd_dev.t_shop_style_price_base_2(`id`, `create_time`, `update_time`, `shop_id`, `local_shop_city_num_id`, `shop_name`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `pre_heat_price`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_sales`, `month_clicks`) VALUES (55450988, '2018-06-18 22:12:45', '2018-06-18 22:12:46', 90226612, 110100, NULL, '2018-06-16 12:55:23', 169378, 'U1206', 195628, 0, 7.00, 10.00, 0.00, 7.00, 0.00, 0.00, 0.00, 1, '2018-06-26', 'goodbaby好孩子植物木糖醇婴儿口手湿巾36片装手口专用', '598259485576830566_20170207192938.jpg', 49, 389, 393, '尿裤纸品', '纸品', '湿巾', 0, 1, '好孩子', '0-3,3-6,6-12', 0, 0, 87714, 0, 0, 7, 3, 1, 0, 0, 14755, 612);
INSERT INTO  db_gd_dev.t_shop_style_price_base_2(`id`, `create_time`, `update_time`, `shop_id`, `local_shop_city_num_id`, `shop_name`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `pre_heat_price`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_sales`, `month_clicks`) VALUES (55450989, '2018-06-18 22:12:45', '2018-06-18 22:12:46', 90226612, 110100, NULL, '2018-05-18 14:53:13', 178220, 'SOLUTIONXF', 370761, 0, 1499.00, 1699.00, 1499.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-06-26', '德国cybex儿童汽车安全座椅3-12岁适用', 'main_SOLUTIONXF_-01_20160623142620_20170208190852_20170704175321.jpg', 108, 127, 129, '出行装备', '安全座椅', '汽车安全座椅', 0, 68, 'CYBEX', '36-84,84-', 0, 0, 909, 0, 0, 7, 3, 1, 0, 0, 6, 48);
INSERT INTO  db_gd_dev.t_shop_style_price_base_2(`id`, `create_time`, `update_time`, `shop_id`, `local_shop_city_num_id`, `shop_name`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `pre_heat_price`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_sales`, `month_clicks`) VALUES (55450990, '2018-06-18 22:12:45', '2018-06-18 22:12:46', 90226612, 110100, NULL, '2018-05-18 14:53:05', 179620, 'PALLASMF', 306009, 0, 2899.00, 3399.00, 2899.00, 0.00, 0.00, 0.00, 0.00, 1, '2018-06-26', '德国cybex儿童汽车安全座椅9个月-12岁适用', 'PALLASMF_20170704180156.jpg', 108, 127, 129, '出行装备', '安全座椅', '汽车安全座椅', 0, 68, 'CYBEX', '6-12,12-36,36-84,84-', 0, 5, 5554, 0, 0, 7, 3, 1, 0, 0, 23, 252);
select * from db_gd_dev.t_shop_style_price_base_2;
# queryForGoodsIndex city 
#queryGoodsIndexForPromotionInfo city
select * from t_city_style_price_base_20180619  where city_num_id!=-1 and city_num_id!=0 limit 3;
delete from db_gd_dev.t_city_style_price_base_2;
INSERT INTO db_gd_dev.t_city_style_price_base_2(`id`, `create_time`, `update_time`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `pre_heat_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `shop_id`, `local_shop_city_num_id`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_clicks`, `month_sales`, `goods_corner`) VALUES (371383428, '2018-06-18 22:14:18', '2018-06-18 22:14:18', '2017-12-15 16:50:58', 129, '443743', 314542, 110100, 499.00, 499.00, 0.00, 0.00, 0.00, 0.00, 0.00, 52468, 320500, 0, '2018-06-26', 'NIKE耐克NIKE FREE RUN 2.0 BPV男小童跑步鞋', '33a3c2c5-484b-4344-b5a7-10d8072cf57a.jpg', 306, 309, 336, '时尚童鞋', '小童童鞋', '运动鞋', 8, 75, 'NIKE', '36-84,84-', 0, 0, 4469, 0, 0, NULL, 4, 1, 0, 0, 14, 9, '');
INSERT INTO db_gd_dev.t_city_style_price_base_2(`id`, `create_time`, `update_time`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `pre_heat_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `shop_id`, `local_shop_city_num_id`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_clicks`, `month_sales`, `goods_corner`) VALUES (371383429, '2018-06-18 22:14:18', '2018-06-18 22:14:18', '2018-05-24 16:15:55', 340, '386521', 12017848, 110100, 269.00, 269.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32696, 110100, 0, '2018-06-26', 'NIKE耐克SUNRAY ADJUST 4 (TD)女婴童凉鞋', '5064719b-1ade-4928-a41f-13efddfd665e.jpg', 306, 308, 333, '时尚童鞋', '婴童童鞋', '凉鞋/凉拖', 7, 75, 'NIKE', '6-12,12-36,36-84', 2, 1602, 136773, 0, 0, 2, 4, 1, 0, 0, 606, 222, '');
INSERT INTO db_gd_dev.t_city_style_price_base_2(`id`, `create_time`, `update_time`, `online_time`, `style_num_id`, `style_id`, `item_num_id`, `city_num_id`, `min_price`, `standard_price`, `pre_heat_price`, `country_pmt_price`, `company_pmt_price`, `custom_price`, `shop_pmt_price`, `shop_id`, `local_shop_city_num_id`, `pmt_label`, `valid_date`, `style_title`, `style_pic`, `style_catelog_first`, `style_catelog_sec`, `style_catelog_third`, `first_type_name`, `second_type_name`, `third_type_name`, `third_weight_value`, `brand_id`, `brand_name`, `style_apply_age`, `style_apply_sex`, `order_num`, `total_sale`, `favorable_rate`, `collectors_num`, `style_apply_season`, `style_use_type`, `online`, `is_hide`, `is_not_sale`, `month_clicks`, `month_sales`, `goods_corner`) VALUES (371383431, '2018-06-18 22:14:18', '2018-06-18 22:14:18', '2017-12-07 18:39:48', 342, '386519', 12017913, 110100, 269.00, 269.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32696, 110100, 0, '2018-06-26', 'NIKE耐克SUNRAY ADJUST 4 (TD)男婴童凉鞋', '386519_20161018152451_20161213114243.jpg', 306, 308, 333, '时尚童鞋', '婴童童鞋', '凉鞋/凉拖', 7, 75, 'NIKE', '6-12,12-36,36-84', 1, 0, 224338, 0, 0, 2, 4, 1, 0, 0, 347, 560, '');
select * from db_gd_dev.t_city_style_price_base_2;


#------------单元测试price------------------------
删除shop原来的分表
drop table t_daily_shop_pmt_price_0;
drop table t_daily_shop_pmt_price_1;
drop table t_daily_shop_pmt_price_2_3;
drop table t_daily_shop_pmt_price_3;
drop table t_daily_shop_pmt_price_4;
drop table t_daily_shop_pmt_price_5;
drop table t_daily_shop_pmt_price_6;
drop table t_daily_shop_pmt_price_7;
drop table t_daily_shop_pmt_price_8;
drop table t_daily_shop_pmt_price_9;

#----------gd-common-----------------------------



#----------排查bug------------------------------

select * from gb_pmt_pcy_item_lable where style_num_id=163564 and mg_unit_num_id=1;
select * from t_daily_standard_price_2 where style_num_id=163564;

select * from t_daily_custom_price_2 where style_num_id=163564;

select * from t_shop_style_price_base_2 where style_num_id=163564;

select * from t_daily_country_pmt_price_2 where style_num_id=163564;


select distinct mg_unit_num_id from gb_pmt_pcy_item_lable;

1  全国
大于0 不等于 是分公司
0 商店
select * from gb_online where style_id=4716 and item_id=210506 and sid=37523;

select * from t_shop_style_price_base_4 where style_num_id=4716 and shop_id in (38644,37523);

select * from t_city_style_price_base_4 where style_num_id=4716 and city_num_id=330100;


select * from t_shop_style_price_base_3 where style_num_id=4716 and min_price=600.33;


select * from t_daily_standard_price_3 where style_num_id=4716 ;















