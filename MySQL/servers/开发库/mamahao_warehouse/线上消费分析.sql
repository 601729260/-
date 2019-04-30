
select * from t_crm_consume_analyse where member_id in (1994102)

t_order:
order_state  4 待发货
pay_shop_price 卡项购买
sub_pay_price 卡项购买待运费 
order_type '1-普通订单（默认）；2-妈豆订单（不允许退款退货）；3-pos订单（包括普通POS订单、特卖会）；4-门店扫码；5-众筹订单',
o.parent_order_no is not null 负单不为空
  


select 
o.member_id,
 sum(if(op.sub_pay_price is null,0,op.sub_pay_price)+if(op.pay_price is null,0,op.pay_price))/100 
 online_total_consume_price,
 sum(if(rl.status=4,if(rl.refund_amount is null,0,rl.refund_amount),0)+if(rl.member_card_price is null,0,rl.member_card_price))/100 online_total_refund_price,
 count(DISTINCT o.order_no) online_total_consume_num,
 count(rl.refund_line_no ) online_total_refund_num,
 sum(if(op.sub_pay_price is null,0,op.sub_pay_price)+if(op.pay_price is null,0,op.pay_price))/(100*count(DISTINCT o.order_no)) online_per_customer_transaction
 from t_order as o
 LEFT JOIN t_order_pay op ON op.order_no = o.order_no
 LEFT JOIN t_refund_line rl on o.order_no=rl.order_no
 WHERE o.order_state in (0,4)
 and o.dealing_type not in (4,5)
 and o.order_type in(1,6) 
 and o.parent_order_no is not null
 and  o.member_id in (1994102)
GROUP BY o.member_id



select * from t_order where member_id=1994102 and order_type in(1,6) and parent_order_no is not null;

select * from t_refund_line where order_no in(147040182187511);




select * from t_order_pay where order_no=147020182598740;

0544
3839
7903
0260
0554
8740
7706
