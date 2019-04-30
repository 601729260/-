select * from t_crm_consume_analyse where member_id in (1994104);

select e.gt_name as love_category,b.member_id, count(1) as count 
from t_order_line a inner join t_order b on a.order_no=b.order_no 
left join gb_share_item c on a.good_item_id=c.item_num_id 
left join gb_style d on c.STYLE_NUM_ID=d.STYLE_NUM_ID
left join t_goods_type e on d.STYLE_CATELOG_THIRD=e.gt_id 
where b.member_id in (1994104)
and e.gt_name is not null 
group by e.gt_name,b.member_id
order by b.member_id , count desc