select concat("insert into u_order_pay (order_no,common_id,common_value,offset_price,pay_type,payment_type,actual_return) values ('",订单号,"',-8888,",cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-replace(实付金额,',',''),",",cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-replace(实付金额,',',''),",108,2,1);")
from weibao_offline_order a
where replace(ifnull(实付金额,0),',','')-(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))>0.5


insert into u_order_line_pay (order_line_id,common_id,common_value,offset_price,pay_type,payment_type,pay_time)values(1219112,-8888,-31400,-31400,108,2,'2019-10-31 21:30:30');


select  * from  weibao_offline_order limit 100;


create table wgn_tmp_2(订单号 varchar(64),商品ID bigint(20),金额 decimal(10,2));

insert into wgn_tmp_2 
select 订单号,商品ID,cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(replace(实付金额,',','') as DECIMAL(10,2)) as 金额
from weibao_offline_order a
where replace(ifnull(实付金额,0),',','')-(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))>0.5

select * from wgn_tmp_2;

select * from  weibao_offline_order a inner join wgn_tmp_2 b on a.订单号=b.订单号 and a.商品ID=b.商品ID;


update  weibao_offline_order a 
inner join wgn_tmp_2 b on a.订单号=b.订单号 and a.商品ID=b.商品ID
set a.议价金额=-b.金额*100;



select concat("insert into u_order_pay (order_no,common_id,common_value,offset_price,pay_type,payment_type,actual_return) values ('",订单号,"',-8888,",(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-replace(实付金额,',',''))*100,",",(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-replace(实付金额,',',''))*100,",108,2,1);")
from weibao_offline_order a
where replace(ifnull(实付金额,0),',','')-(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))>0.5

select concat("insert into u_order_line_pay (order_line_id,common_id,common_value,offset_price,pay_type,payment_type,pay_time)values(",order_line_id,",-8888,",金额*100,",",金额*100,",108,2,'2019-10-31 21:30:30');")
from mamahao_warehouse.u_order_line a inner join wgn_tmp_2 b on a.order_no=b.订单号 and a.item_id=b.商品ID
and b.订单号='MPOS152310128702984';

select * from mamahao_warehouse.u_order_line where order_no='MPOS152310128702984';
select * from mamahao_warehouse.u_order_line_pay where order_line_id=1074294;


insert into u_order_line_pay (order_line_id,common_id,common_value,offset_price,pay_type,payment_type,pay_time)values(1074294,-8888,-8.10,-8.10,108,2,'2019-10-31 21:30:30');

insert into u_order_pay (order_no,common_id,common_value,offset_price,pay_type,payment_type,actual_return) values ('MPOS152310128702984',-8888,-8.1,-8.1,108,2,1);

insert into u_order_line_pay (order_line_id,common_id,common_value,offset_price,pay_type,payment_type,pay_time)values(1074294,-8888,-8.10,-8.10,108,2,'2019-10-31 21:30:30');

