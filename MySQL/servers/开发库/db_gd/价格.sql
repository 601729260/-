select count(1) from t_city_style_price_base where valid_date='2018-05-30';
select min(create_time),max(create_time) from t_city_style_price_base where valid_date='2018-05-30';

select min(create_time),max(create_time)  from t_shop_style_price_base where valid_date='2018-05-30';
select count(1) from t_shop_style_price_base where valid_date='2018-05-29';

select min(create_time),max(create_time)  from t_daily_shop_pmt_price_1 where valid_date='2018-05-30';