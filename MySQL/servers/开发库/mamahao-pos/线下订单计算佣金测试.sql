

星店长线下订单
select * from t_star_member_sales where member_id=1994390 order by create_time desc;


delete from t_star_member_sales  where order_no='148170100231944';
delete from t_star_member_sales_detail  where order_no='MPOS148170162511426test';




select *  from t_star_member_sales_detail where order_no='MPOS148170162511426test';

select * from t_order  where order_no='148170100231944'


select *  from t_star_member_sales_detail where member_phone in (18966669991,18966669992,18966669993,18966669994,18966669995) and create_time>'2019-04-16 00:38:59';

select * from t_star_member_sales where order_no='148170102674652';

update t_star_member_sales set sale_status=2 where order_no='148170102674652';


884500571600

18966669992

18966669991

18966669993

select *  from t_star_member_sales_detail where order_no='MPOS148170190655063test';


select *  from t_star_member_sales where order_no='MPOS148170162511426test';



select * from u_refund_basic where order_no='MPOS148160104849754test';
select * from u_refund_goods where refund_no='MTH148160353074868test';


select * from t_member_star where member_id=1995109;