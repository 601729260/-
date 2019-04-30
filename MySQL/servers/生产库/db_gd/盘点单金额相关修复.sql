select * from u_stock_log_detail where id='MMH2018121210014094' and barcode=201802084;


select * from u_stock_log_detail where bill_type=5 and status=8;

update u_stock_log_detail set total_different_cost_price=total_different_num*cost_price where bill_type=5 and status=8;

update u_stock_log a inner join 
(select id,sum(total_different_cost_price) as total_different_cost_price from u_stock_log_detail where bill_type=5 group by id) b
on a.id=b.id
set a.total_different_cost_price=b.total_different_cost_price
where a.bill_type=5
;



select  a.id,a.total_different_cost_price,b.total_different_cost_price from u_stock_log a inner join 
(select id,sum(total_different_cost_price) as total_different_cost_price from u_stock_log_detail where bill_type=5 group by id ) b
on a.id=b.id
where a.bill_type=5 
and a.total_different_cost_price!=b.total_different_cost_price;

select * from u_stock_log_detail where id='MMH2018110510002060';



select id,sum(total_different_cost_price) as total_different_cost_price from u_stock_log_detail where bill_type=5 and status=8 and id='MMH2018120410011547';
select id,total_different_cost_price as total_different_cost_price from u_stock_log where bill_type=5 and status=8 and id='MMH2018120410011547';


