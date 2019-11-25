select date_format(create_time,'%Y%m%d'),channel_type,count(distinct order_no),sum(sale_amount) 
from mamahao_warehouse.t_star_member_sales_detail a 
where create_time>'2019-10-01 00:00:00'
group by  date_format(create_time,'%Y%m%d'),channel_type  limit 1000


select shop_id,date_format(a.created_time,'%Y%m'),sum(b.pay_price)/100 from  t_order a left join t_order_pay b on  a.order_no=b.order_no
where a.created_time>'2018-10-01 00:00:00'
and a.order_type in (0,4,5,6)
group by shop_id,date_format(created_time,'%Y%m')





select distinct  concat('{"orderNo":"',a.trade_parent_id,'","channelType":',a.order_type,'},')  from 
t_tk_order_201911112114   a  WHERE member_id  IS NULL AND paid_time IS  NOT NULL   AND  tk_create_time>='2019-11-11 00:00:00';

select count(1) from t_tk_order_201911112114 WHERE member_id  IS NULL AND paid_time IS  NOT NULL   AND  tk_create_time>='2019-11-11 00:00:00';