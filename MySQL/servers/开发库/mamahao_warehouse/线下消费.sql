
select * from t_crm_consume_analyse where member_id in (1994075)

select 
 uo.mmh_member_id member_id ,
 sum(if(b.payment_amount is null,0,b.pay_price))/100 offline_total_consume_price, 
 sum(if(c.payment_amount is null,0,if(c.item_type=3,c.pay_price,0)))/100 offline_total_refund_price,
 count(DISTINCT uo.order_no) offline_total_consume_num,
 sum(IF(urb.order_no is not null and c.item_type=3,1,0)) offline_total_refund_num,
 sum(if(b.payment_amount is null,0,b.pay_price))/(100*count(DISTINCT uo.order_no)) offline_per_customer_transaction 
 from u_order uo
 left JOIN u_order_pay uop on uo.order_no=uop.order_no
    left Join  u_refund_basic urb on uo.order_no=urb.order_no
	  left join u_order_line b  on uo.order_no=b.order_no
		left join u_order_line c on urb.order_line_id=c.order_line_id
    where     uop.pay_type in (1,2,3,4,7,8,9,10)  
    and order_state in (0,4,5,7)   
		and b.item_type=3
    and uo.mmh_member_id in (1994075)    
		group   by uo.mmh_member_id

select * from u_order where  mmh_member_id in (1994075)

select * from u_order_line where order_no='MPOS147020612609175';

select * from u_order_pay where order_no='MPOS147020612609175' and pay_type=6;


select pay_mbean_count from t_order_pay where order_no='MPOS147020612609175' ;