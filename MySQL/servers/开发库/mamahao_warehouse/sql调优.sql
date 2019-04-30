explain select member_id,max(modified_time) as last_consume_datetime from t_order 
where   member_id in (select member_id from t_order a where a.update_time>='2019-03-04 15:07:20')
 and modified_time is not null 
 group by member_id