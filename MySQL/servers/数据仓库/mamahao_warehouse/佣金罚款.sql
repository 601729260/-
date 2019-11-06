select * from t_star_member_asset  where member_id=1585967 limit 100;

select * from t_star_member_asset_log where  member_id=1585967 ;

select * from t_star_member_sales where order_no=149090192933597 ;

select * from t_star_member_sales_detail where order_no=149090192933597 ;




update  t_star_member_asset set balance=balance-130 where member_id=1585967 ;

delete  from t_star_member_asset_log where  member_id=1585967 ;

delete from t_star_member_sales where order_no=149090192933597 ;

delete from t_star_member_sales_detail where order_no=149090192933597 ;

delete from t_star_member_asset_log where member_id=2028234;




select * from t_member where member_phone=15995211249


select * from t_star_member_asset_log limit 100;

create table t_star_member_asset_bak_20191101 as 
select a.* from  t_star_member_asset a inner join (
select member_id,sum(change_balance) from t_star_member_asset_log  where out_serial_number in 
(154250117047922,
154270127464706,
154280170624526,
154260184117720,
154300189128508
);
group by member_id) b  on a.member_id=b.member_id;


update  t_star_member_asset a inner join (
select member_id,sum(change_balance) change_balance from t_star_member_asset_log  where out_serial_number in 
(154250117047922,
154270127464706,
154280170624526,
154260184117720,
154300189128508)
group by member_id) b  on a.member_id=b.member_id
set a.balance=a.balance-b.change_balance;

create table t_star_member_asset_log_bak_20191022 as 
select *  from t_star_member_asset_log  where out_serial_number in 
(154250117047922,
154270127464706,
154280170624526,
154260184117720,
154300189128508);


delete  from t_star_member_asset_log  where out_serial_number in 
(154250117047922,
154270127464706,
154280170624526,
154260184117720,
154300189128508);

select * from t_star_member_sales where order_no in (154250117047922,
154270127464706,
154280170624526,
154260184117720,
154300189128508) ;

select * from t_star_member_sales_detail where order_no in (154250117047922,
154270127464706,
154280170624526,
154260184117720,
154300189128508) ;



select  * from  t_star_member_asset where member_id in 
(2001760,
2008338,
2018641,
2043488,
2065054
);



select  * from  t_star_member_asset_log where member_id in 
(2001760,
2008338,
2018641,
2043488,
2065054)
