select * from `mamahao-pos`.t_star_member_sales where order_no=148030105562831;

INSERT INTO `mamahao-pos`.`t_star_member_sales`(`sales_id`, `order_no`, `member_id`, `member_phone`, `order_member_id`, `order_member_phone`, `sale_amount`, `refund_amount`, `commission_amount`, `sale_type`, `indirect_type`, `sale_name`, `sale_month`, `sale_status`, `order_status`, `order_time`, `confirm_good_time`) 
VALUES (`mamahao-pos`.nextval("sales_id"), '137270192898454', 123, '13549678593', 1619258, '13549678593', 78.00, 0.00, 1.56, 7, 1, '邀请奖励-直邀好友开店', '201805', 2, 0, '2018-05-27 21:50:43', '2019-06-04 01:00:43');


INSERT INTO `mamahao-pos`.`t_star_member_sales`(`sales_id`, `order_no`, `member_id`, `member_phone`, `order_member_id`, `order_member_phone`, `sale_amount`, `refund_amount`, `commission_amount`, `sale_type`, `indirect_type`, `sale_name`, `sale_month`, `sale_status`, `order_status`, `order_time`, `confirm_good_time`) 
VALUES (`mamahao-pos`.nextval("sales_id"), '137270192898455', 123, '13549678593', 1619258, '13549678593', 78.00, 0.00, 2.68, 4, 1, '我的销售-专属会员下单', '201805', 2, 0, '2018-05-27 21:50:43', '2019-06-04 01:00:43');



INSERT INTO `mamahao-pos`.`t_star_member_sales`(`sales_id`, `order_no`, `member_id`, `member_phone`, `order_member_id`, `order_member_phone`, `sale_amount`, `refund_amount`, `commission_amount`, `sale_type`, `indirect_type`, `sale_name`, `sale_month`, `sale_status`, `order_status`, `order_time`, `confirm_good_time`) 
VALUES (`mamahao-pos`.nextval("sales_id"), '137270192898456', 1171006, '13549678594', 1619258, '13549678593', 78.00, 0.00, 2.68, 4, 1, '我的销售-专属会员下单', '201903', 2, 0, '2019-03-27 21:50:43', '2019-06-04 01:00:43');



select * from `mamahao-pos`.t_star_member_asset;



select `mamahao-pos`.nextval("sales_id")

select * from `mamahao-pos`.t_star_member_accumulated_income;

update  `mamahao-pos`.t_star_member_accumulated_income set amount=1.56 where member_id=123;


select * from `mamahao-pos`.t_star_member_asset;

update `mamahao-pos`.t_star_member_asset set wait_in_account=1.56 where member_id=123;
#-------------------------------

#待入账明细和计算过程


148070187935693



delete from `mamahao-pos`.t_star_member_sales where order_no=148070187935693;
delete from `mamahao-pos`.t_star_member_sales_detail where order_no=148070187935693;

select * from `mamahao-pos`.t_star_member_sales where order_no=148070187935693;
select * from `mamahao-pos`.t_star_member_sales where member_id=123;
select * from  `mamahao-pos`.t_star_member_sales_detail where member_id=123;

select * from `mamahao-pos`.t_star_member_sales_detail where order_no=147260182441690;

#----------------------------
修改会员信息

select * from `mamahao-user`.t_member where member_id=123 for update;

select * from `mamahao-user`.t_member_base_ext where member_id=123;

update  `mamahao-user`.t_member_base_ext set member_realname='曾李' where member_id=123;

select * from `mamahao-user`.t_member_base_ext  where member_id=123;

#-------------------------------
查询订单信息

select * from t_order where member_id=1752754;
update t_order set member_id=123 where member_id=1752754;

select * from db_gd.t_order a where a.dealing_type not in (4,5) 
and a.delivery_way!=2 
and a.order_type in (1,6) 
and order_state in (0,4,5,6,9)
and relation_type=15
order by created_time desc limit 100;


select * from t_order a where a.dealing_type not in (4,5) 
and a.delivery_way!=2 
and a.order_type in (1,6) 
and order_state in (0,4,5,6,9)
#and member_id=1994073
and payment_time is not null
and member_id in (select b.member_id from t_member_star b where  star_level>0)
order by created_time desc limit 100;


select * from t_member_star ;

select * from db_gd.t_order_line where order_no=147070156708405;


update t_order set relation_type=15 where order_no='147070156722413';

select * from db_gd.t_order where order_no=147070156708405;

select * from db_gd.t_order  where parent_order_no=147070256707140;




select * from db_gd.t_order a where a.dealing_type not in (4,5) 
and a.delivery_way!=2 
and a.order_type in (1,6) 
and order_state in (0,4,5,6,9)
and member_id in (1994071,
1994077,
1604583,
1958894)
order by created_time desc limit 100;



#-------------------------------
#用户
select * from `mamahao-user`.t_member where member_id=1995471;


select sum(if(sale_type not in(7,8),0,sale_amount) ) from t_star_member_sales;





select * from t_order where order_no=153270193473177;


18655214478



select * from `mamahao-pos`.t_star_member_sales where order_no='153290167717137';

select  * from `mamahao-pos`.t_star_member_sales_detail where order_no='153290167717137';



#delete  from `mamahao-pos`.t_star_member_sales where order_no='153290167717137';

#delete from `mamahao-pos`.t_star_member_sales_detail where order_no='153290167717137';


select * from t_order where member_phone='13460386127';

select * from t_star_member_income;

select * from t_star_member_sales_detail where order_member_id=2041466 and member_id=2041428;

select * from t_star_member_accumulated_income where member_id=2041297 limit 100;









