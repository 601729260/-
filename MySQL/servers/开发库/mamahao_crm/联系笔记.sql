select * from t_crm_contact_note;
alter table t_crm_contact_note modify create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间';
