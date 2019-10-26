select * from t_star_member_sales_config;


'MPOS152310128907181','MPOS152310170170525'


select * from t_order where order_no ='MPOS15204082170563';


select * from u_order where order_no='MPOS152110145665929','MPOS152110148562771','MPOS152140180152808','MPOS152140100822845','MPOS152140116029088','MPOS152120172768303','MPOS152120135148527','MPOS152120153298596','MPOS152120109990238','MPOS152100184829580';





select * from t_star_member_sales where order_no in ('MPOS152310128907181','MPOS152310170170525') and indirect_type=1;



drop table wgn_tmp;
create table wgn_tmp(order_no varchar(32),amount decimal(20,2),commission_amount decimal(20,2),member_id bigint(20));

 
select concat('insert into wgn_tmp (order_no,amount) values(''',a.order_no,''',',a.amount,');')from t_star_member_sales_detail a inner join t_star_member_sales b on a.order_no=b.order_no and a.member_id=b.member_id
where b.indirect_type=1 and b.sale_status=1 and 
a.order_no in ('MPOS152310128907181','MPOS152310170170525');

insert into wgn_tmp (order_no,amount) values('MPOS152310128907181',89.60000);
insert into wgn_tmp (order_no,amount) values('MPOS152310170170525',89.60000);

select concat('update wgn_tmp set commission_amount=',commission_amount,' ,member_id=',member_id,' where order_no=''', order_no,''';') from t_star_member_sales 
where order_no in  ('MPOS152310128907181','MPOS152310170170525') and sale_status=1 and indirect_type=1;

update wgn_tmp set commission_amount=8.96 ,member_id=2030592 where order_no='MPOS152310128907181';
update wgn_tmp set commission_amount=4.48 ,member_id=2058325 where order_no='MPOS152310170170525';


select concat('update t_star_member_sales set commission_amount=commission_amount+' ,amount-commission_amount,' where order_no=''', order_no,''' and member_id=',member_id,';') from wgn_tmp;
select concat('update t_star_member_asset_log set change_balance=change_balance+' ,amount-commission_amount,' where out_serial_number=''', order_no,''' and member_id=',member_id,';') from wgn_tmp;
select concat('update t_star_member_asset set balance=balance+' ,amount-commission_amount,' where  member_id=',member_id,';') from wgn_tmp;

update t_star_member_sales set commission_amount=commission_amount+80.64 where order_no='MPOS152310128907181' and member_id=2030592;
update t_star_member_sales set commission_amount=commission_amount+85.12 where order_no='MPOS152310170170525' and member_id=2058325;


update t_star_member_asset_log set change_balance=change_balance+80.64 where out_serial_number='MPOS152310128907181' and member_id=2030592;
update t_star_member_asset_log set change_balance=change_balance+85.12 where out_serial_number='MPOS152310170170525' and member_id=2058325;



update t_star_member_asset set balance=balance+80.64 where  member_id=2030592;
update t_star_member_asset set balance=balance+85.12 where  member_id=2058325;







create table t_star_member_sales_detail_20190910 as select * from t_star_member_sales_detail;
update t_star_member_sales_detail a left join t_star_member_sales b on a.order_no=b.order_no and a.member_id=b.member_id
set a.commission_amount=b.commission_amount
where b.order_no in ('MPOS152310128907181','MPOS152310170170525')
and b.sale_status=1 
and b.indirect_type=1;


update t_star_member_sales_detail a set a.real_commission_amount=a.commission_amount where a.order_no in ('MPOS152310128907181','MPOS152310170170525');






