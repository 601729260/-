
select * from weibao_offline_order limit 100;

select 订单号,'唯宝线下正向' as 校验类型, replace(实付金额,',','') as 实付金额,cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2)) as 计算的实付金额  from weibao_offline_order a
where replace(ifnull(实付金额,0),',','')!=(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))
union all 
select 订单号,'唯宝线上正向' as 校验类型,  replace(实付金额,',','') as 实付金额,cast(ifnull(商品数量,0) as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(replace(ifnull(满减金额,0),',','') as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(replace(ifnull(充值余额,0),',','') as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2))  as 计算的实付金额 from weibao_online_order a
where replace(ifnull(实付金额,0),',','')!=cast(ifnull(商品数量,0) as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(replace(ifnull(满减金额,0),',','') as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(replace(ifnull(充值余额,0),',','') as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2))
union all 
select 订单号,'唯宝线下逆向' as 校验类型, replace(实付金额,',','') as 实付金额,cast(ifnull(商品数量,0)as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(replace(ifnull(充值余额,0),',','') as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2))  as 计算的实付金额 from weibao_offline_refund_order a
where replace(ifnull(实付金额,0),',','')!=cast(ifnull(商品数量,0)as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(replace(ifnull(充值余额,0),',','') as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2))
union all 
select 订单号,'唯宝线上逆向' as 校验类型,  cast(replace(实付金额,',','') as DECIMAL(10,2)) as 实付金额,cast(商品数量 as DECIMAL(10,2))*cast(促销价 as DECIMAL(10,2))-cast(满减金额 as DECIMAL(10,2))-cast(议价金额 as DECIMAL(10,2))-cast(妈豆优惠 as DECIMAL(10,2))-cast(支付优惠金额 as DECIMAL(10,2))-cast(优惠券金额 as DECIMAL(10,2))-cast(充值余额 as DECIMAL(10,2))-cast(运费 as DECIMAL(10,2)) as 计算的实付金额 from weibao_online_refund_order a
where cast(replace(实付金额,',','') as DECIMAL(10,2))-(cast(ifnull(商品数量,0) as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(replace(ifnull(充值余额,0),',','') as DECIMAL(10,2))-cast(ifnull(运费,0) as DECIMAL(10,2)))!=0;

实付金额=商品数量*促销价-满减金额-议价金额-妈豆优惠-支付优惠金额-优惠券金额


update  weibao_offline_order a set a.议价金额=cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-replace(实付金额,',','') 
where replace(ifnull(实付金额,0),',','')-(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))>0

update  weibao_offline_refund_order a set a.议价金额=cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-replace(实付金额,',','') 
where replace(ifnull(实付金额,0),',','')!=cast(ifnull(商品数量,0)as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(replace(ifnull(充值余额,0),',','') as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2))


select  * from mamahao_warehouse.t_member where member_id=1777800;


#------------排查线下正向订单------------------------
select * from mamahao_warehouse.u_order_line_pay where order_line_id in ('1074961','1074962');

select * from mamahao_warehouse.u_order_line where order_no='MPOS153010155347100';

select * from  weibao_offline_order where 订单号='MPOS153010155347100';

#------------线下逆向订单排查-----------------------
MPOS152310119644215	唯宝线下逆向	-0.0000	-34.9600
MPOS152310119644215	唯宝线下逆向	-89.0000	-34.9600
select * from weibao_offline_refund_order where 订单号='MPOS152310119644215';


select 实付金额,商品数量,促销价,满减金额,议价金额,妈豆优惠,支付优惠金额,优惠券金额,(商品数量*促销价-满减金额-议价金额-妈豆优惠-支付优惠金额-优惠券金额), a.* from weibao_offline_order a
where 实付金额!=商品数量*促销价-满减金额-议价金额-妈豆优惠-支付优惠金额-优惠券金额
limit 100;

实付金额!=商品数量*促销价-满减金额-议价金额-储值卡折扣-妈豆优惠-支付优惠金额-优惠券金额



#----------------------------校准数据-------------------

select 订单号,'唯宝线下正向' as 校验类型, replace(ifnull(实付金额,0),',','')-(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))  from weibao_offline_order a
where replace(ifnull(实付金额,0),',','')!=(cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2)))




---------------


select * from  weibao_offline_order where 订单号='MPOS154010160332151';

select * from mamahao_warehouse.t_order where order_no='152200100215474'

select * from mamahao_warehouse.t_order where order_no in ('152200100215474','MPOS153080770069059');

select * from mamahao_warehouse.t_refund_line  where mailPrice>0 and  apply_time> '2019-09-01' limit 100;
select * from mamahao_warehouse.t_refund_line  where mailPrice<0 and  apply_time> '2019-09-01'  limit 100;

select * from weibao_offline_order where 批次号='MPOS154010141266129';

select * from mamahao_warehouse.t_order_batch_settlement where batch_settlement_no='152200100215474'




#----------------------线下正向订单校验---------------------------------

select 订单号,'唯宝线下正向' as 校验类型, replace(实付金额,',','') as 实付金额,cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2)) as 计算的实付金额  from weibao_offline_order a
where replace(ifnull(实付金额,0),',','')-((cast(商品数量 as DECIMAL(10,2))*cast(ifnull(促销价,0) as DECIMAL(10,2))-cast(ifnull(满减金额,0) as DECIMAL(10,2))-cast(ifnull(议价金额,0) as DECIMAL(10,2))-cast(ifnull(妈豆优惠,0) as DECIMAL(10,2))-cast(ifnull(支付优惠金额,0) as DECIMAL(10,2))-cast(ifnull(优惠券金额,0) as DECIMAL(10,2))-cast(ifnull(充值余额,0) as DECIMAL(10,2))-cast(ifnull(储值卡折扣金额,0) as DECIMAL(10,2))))>1
and 下单时间>'2019-11-01 00:00:00'

MPOS155010136465588	唯宝线下正向	19.1700	19.1500

MPOS155010122304310	唯宝线下正向	115.7000	115.0200

MPOS155010138646615	唯宝线下正向	9.8100	6.0100

select * from weibao_offline_order where 订单号='MPOS155010138646615';

select * from mamahao_warehouse.t_order_pay where order_no='MPOS155010138646615';

select * from mamahao_warehouse.t_order_line where order_no='MPOS155010138646615';

select * from  mamahao_warehouse.u_order_line  where order_no='MPOS155010138646615';


