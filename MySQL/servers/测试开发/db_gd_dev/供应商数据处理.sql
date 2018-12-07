update t_provider_info_2  set provider_name=replace(provider_name,"易易","易");
update t_provider_info_2  set provider_name=replace(provider_name,"⽣生","生");
update t_provider_info_2  set provider_name=replace(provider_name,"⼯工","工");
update t_provider_info_2  set provider_name=replace(provider_name,"⻉贝","贝");
update t_provider_info_2  set provider_name=replace(provider_name,"敏敏","敏");
update t_provider_info_2  set provider_name=replace(provider_name,"⼭山","山");
update t_provider_info_2  set provider_name=replace(provider_name,"⻝⾷食","食");

select * from t_provider_info_1 a where not exists(select  1 from t_provider_info_2 b where a.provider_name=b.provider_name);

select * from t_provider_info_1 a where not exists(select  1 from t_provider_info_2 b where a.provider_id=b.provider_id);



select * from t_provider_info_2 a where not exists(select  1 from t_provider_info_1 b where a.provider_name=b.provider_name);

select * from t_provider_info_2 a where not exists(select  1 from t_provider_info_1 b where a.provider_id=b.provider_id);

select * from t_provider_info_2 where provider_name='常熟若晗服饰贸易有限公司';

select * from t_provider_info_1 where provider_name='常熟若晗服饰贸易有限公司';

select * from t_provider_info_1;

select * from t_provider_info_2;


select * from t_provider_info_1 a where a.provider_name='苏州哥伦布贸易有限公司';

select * from t_provider_info_2 a where a.provider_name like '%苏州哥伦布贸易有限公司%';


delete from t_provider_info where provider_name='';


select replace("苏州哥伦布贸易易有限公司","易易","易") from t_provider_info_2;


select replace(provider_name,"易易","易") from t_provider_info_2 a where not exists(select  1 from t_provider_info_1 b where a.provider_name=b.provider_name);


update t_provider_info_2  set provider_name=replace("苏州哥伦布贸易易有限公司","易易","易");





#-------------------------------------

select * from t_provider_info where provider_name like '%测试%';

select * from  t_provider_goods where   provider_id=10001 and style_num_id=182103;



   create index `u_stock_log_idx_2` on u_stock_log (`to_sid`,`bill_type`);
  create index `u_stock_log_idx_3`  on u_stock_log (`from_sid`,`bill_type`);

#============================================

drop table wgn_tmp;
create table wgn_tmp as 
select provider_id,count(1) ,min(seq_id) as seq_id from t_provider_info group by provider_id having count(1)>1;

select * from wgn_tmp;

delete from t_provider_info where seq_id in (select seq_id from wgn_tmp);

