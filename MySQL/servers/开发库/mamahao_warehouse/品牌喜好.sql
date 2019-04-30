select * from t_crm_consume_analyse where member_id in (1994104);

select d.b_name as gb_name,b.member_id, count(1) as count 
from t_order_line a inner join t_order b on a.order_no=b.order_no 
left join gb_share_item c on a.good_item_id=c.item_num_id 
left join gb_style e on c.style_num_id=e.style_num_id
left join t_brand d on e.brand_id=d.b_id
where b.member_id in (1994104)
and d.b_name is not null 
group by d.b_name,b.member_id
order by b.member_id , count desc



select * from t_order_line a inner join t_order b on a.order_no=b.order_no where member_id in(1994104);

select * from  t_order_line a where order_no in (select order_no from  t_order b where b.member_id in (1994103));

select * from gb_style where style_num_id in(
select style_num_id from gb_share_item where item_num_id in (1100005119))


select * from gb_share_item where item_num_id in (1100005119)
select * from t_brand where b_id =949;

drop table t_brand;
create view t_brand as select * from db_gd.t_brand;

949
831
select * from t_brand where b_name='酷眯'





select * from gb_style limit 100;

