

 alter table t_star_member_sales_detail add  `receive_staff_id` bigint(20) DEFAULT NULL COMMENT '接待员工id';
 alter table t_star_member_sales_detail add  `receive_staff_work_number` varchar(32) DEFAULT NULL COMMENT '接待员工工号';
 alter table t_star_member_sales_detail add  `receive_staff_name` varchar(255) DEFAULT '' COMMENT '接待员工姓名';
 
 select * from  t_star_member_sales_detail where order_no='MPOS145170689827071';
 
select * from  t_star_member_sales_detail  where indirect_type in(7,8);
	
	
	
