
#--查看版本
select version();

show VARIABLES like '%slow_query_log%';
show variables like '%long_query_time%';


show variables like '%storage_engine%';

show status like '%lock%';

show variables like '%lock_wait_timeout%';

set session lock_wait_timeout = 180;
set global lock_wait_timeout = 180;

show global status like '%slow_queries%'

show variables like '%profiling';


show VARIABLES like '%innodb_autoextend_increment%';
show VARIABLES like '%innodb_log_buffer_size%';
show VARIABLES like '%innodb_log_file_size%'; 

#============查看连接===========================
select * from information_schema.PROCESSLIST where host like '%192.168.10.91%';
select * from information_schema.PROCESSLIST where host like '%192.168.50.198%';
select * from information_schema.PROCESSLIST where host like '%192.168.1.4%';

select * from information_schema.PROCESSLIST where host like '%192.168.1.196%';

show status;

select * from information_schema.status;

show variables like '%max_connections%';

show global variables like 'innodb_buffer_pool_size';
show global status like 'Innodb_buffer_pool_pages_data';
show global status like 'Innodb_buffer_pool_pages_total';
show global status like 'Innodb_page_size';

show global variables like 'bulk_insert_buffer_size';

show  variables like 'bulk_insert_buffer_size';

SET GLOBAL bulk_insert_buffer_size= 2684354560;

set   bulk_insert_buffer_size= 2684354560;

show variables like '%created_tmp_tables%';

show status like '%create%';

show variables like 'MAX_HEAP_TABLE_SIZE';
show global variables like 'MAX_HEAP_TABLE_SIZE';




# 处理锁表
show status like 'Table%';

show OPEN TABLES where In_use > 0;

UNLOCK TABLES;

show full processlist;

select trx_state, trx_started, trx_mysql_thread_id, trx_query from information_schema.innodb_trx
 kill 82005;
#mysql临时文件目录

show VARIABLES like '%tmp%';


set GLOBAL tmp_table_size=512000000;
set session tmp_table_size=512000000;



#===========查看数据库中表=============



3,查询数据库所有表的详细信息(包括表的注释).
use information_schema;
select * from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev';
--查询某一张表的
select * from information_schema.TABLES where TABLE_SCHEMA='db_gd_dev' and TABLE_NAME= 'auth_user';

4,查询一张表的详细信息(包括字段注释,字段名称,类型等).
select * from information_schema.columns where table_schema ='db_gd_dev'  and table_name = 'auth_user';

select table_name,column_name,column_type,column_comment from information_schema.columns where table_schema ='db_gd_dev'  and column_comment like '%供应%';


select table_name,column_name,column_type,column_comment from information_schema.columns where table_schema ='db_gd_dev'  and table_name='gb_style';



select * from mmo


t_city_style_price_base_5

#=========================查看慢sql======================

show variables like 'slow_query_log';

show variables like 'long_query_time';

 show variables like 'slow%';


#====================== 设置binlog 最大值
show variables like 'max_binlog_cache_size';
SET GLOBAL max_binlog_cache_size =536870912;
SET GLOBAL binlog_cache_size =20971520;


#=====================mysql查看并设置隔离级别

SELECT @@tx_isolation







