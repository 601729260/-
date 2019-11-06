
select * from t_star_member_sales_detail order by update_time desc limit 100;


select  * from  t_star_member_sales_detail where order_no in ('MPOS155050147857424test','MPOS155050137406869test');

select  * from  t_star_member_sales_detail_tmp where order_no  in ('MPOS155050147857424test','MPOS155050137406869test');