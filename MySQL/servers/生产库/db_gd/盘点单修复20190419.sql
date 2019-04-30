select * from  u_stock_log where id='MMH2019011810025402'

select * from u_stock_log_detail where id='MMH2019011810025402' and barcode='8712045031261';


select * from u_goods_stock_log where sid=1500000111 and item_num_id=374483;



delete from u_goods_stock_log where seq_id=46955;

create table u_stock_log_detail_MMH2019011810025402 as 
select * from u_stock_log_detail where id='MMH2019011810025402' and barcode='8712045031261';

update u_stock_log_detail set from_num=36 ,
from_qty=36,
to_qty=36,
total_qty=36,
total_different_num=-22,
total_defferent_price=total_different_num*price, 