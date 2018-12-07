select * from qrtz_triggers;


1540926900000
1540005600000

select FROM_UNIXTIME('1540926900000')

SELECT UNIX_TIMESTAMP('2018-10-20 17:30:00')

select  FROM_UNIXTIME(1540005600)

select * from qrtz_triggers where job_name='gBRemove';

update qrtz_triggers set next_fire_time=1540027800000 where job_name='gBRemove';
select * from  1540005600000
