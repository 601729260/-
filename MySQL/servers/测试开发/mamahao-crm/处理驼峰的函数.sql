select table_name from information_schema.tables where table_schema='mamahao-crm';

select table_name from information_schema.tables where table_schema='csdb' and table_type='base table';


select concat('<table tableName="',table_name,'" domainObjectName="UStockLogEntity"></table>')  
from information_schema.tables where table_schema='mamahao-crm';

select replace("t_crm_asset_count","_c","") ;



select REPLACE(body,substring(body, locate('_', body)+5 ),'')  
from information_schema.tables where table_schema='mamahao-crm';


select table_name REGEXP '_?' from information_schema.tables where table_schema='mamahao-crm';

select upper("abdc");

drop function replace2hump;
CREATE FUNCTION replace2hump( str varchar(255))
RETURNS VARCHAR(255)
BEGIN
	DECLARE fstr,tstr varchar(255);
	
	WHILE Locate('_',str)>0 DO 
	set	fstr=substr(str,Locate('_',str),2);
	set	tstr=upper(substr(str,Locate('_',str)+1,1));
	set	str=replace(str,fstr,tstr);
	END WHILE ; 
	return str;
END 


 
 
 select hello();