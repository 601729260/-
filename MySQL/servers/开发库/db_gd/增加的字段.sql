  alter table t_push_job add `staff_id` int(11) DEFAULT NULL COMMENT '创建员工ID';
  alter table t_push_job add 	  `staff_name` varchar(255) DEFAULT NULL COMMENT '创建员工';
   alter table t_push_job add  `notice_day` int(11) DEFAULT NULL COMMENT '公告时间';
    alter table t_push_job add `staffIds` text COMMENT '当指定员工时候,员工ID以，分隔';
  
