 SELECT seq_id,staff_id,staff_name,label_value,pinyin_label,create_time FROM t_staff_label_his WHERE ( staff_id = ? ) order by create_time desc 
2019-02-28 10:50:39.314 DEBUG 22128 --- [nio-8022-exec-1] c.m.e.c.p.r.S.selectByExample            : ==> Parameters: 888(Integer)

select * from  t_staff_label_his where staff_id=888;

  `pinyin_label` varchar(255) DEFAULT NULL COMMENT '拼音',
