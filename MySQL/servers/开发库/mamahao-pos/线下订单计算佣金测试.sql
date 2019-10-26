

星店长线下订单
select * from t_star_member_sales where member_id=1994390 order by create_time desc;


delete from t_star_member_sales  where order_no='154080175036624';
delete from t_star_member_sales_detail  where order_no='154080175036624';



2041675


select *  from t_star_member_sales_detail where order_no='MPOS148170162511426test';

select * from t_order  where order_no='148170100231944'


select *  from t_star_member_sales_detail where member_phone in (18966669991,18966669992,18966669993,18966669994,18966669995) and create_time>'2019-04-16 00:38:59';

select * from t_star_member_sales where order_no='148170102674652';

update t_star_member_sales set sale_status=2 where order_no='148170102674652';


884500571600

18966669992

18966669991

18966669993


 SELECT * from t_star_member_sales_detail where order_no="MPOS154040153491585test"
 
 update t_star_member_sales set sale_status=2 where order_no='154080175036624';
 
select *  from t_star_member_sales_detail where order_no='154080175041145';
select *  from t_star_member_sales where order_no='154080175041145';

SELECT *  FROM t_star_member_sales WHERE (entry_time <= '2019-10-08 14:29:00' AND sale_status = 2) OR (sale_type IN (7, 8) AND sale_status = 2) 

select * from 




select *  from t_star_member_sales_detail where member_id=2041428;
select *  from t_star_member_sales   where member_id=2041428;

select * from t_star_member_asset_log  where member_id=2041675;


delete from t_star_member_sales_detail where order_no='153290167717137';
delete  from t_star_member_sales where order_no='153290167717137';

select * from u_refund_basic where order_no='MPOS148160104849754test';
select * from u_refund_goods where refund_no='MTH148160353074868test';


select * from t_member_star where member_id=1995109;

select * from `mamahao-user`.t_member where member_phone  limit 10;