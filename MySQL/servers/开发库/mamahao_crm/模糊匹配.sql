select * from t_member a 
inner join 
t_member_binding b 
on a.member_id=b.member_id
where b.staff_id=888
