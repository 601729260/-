146170106870163	146170106870163	1800000080	293848	20	293848	0
146180129234156	146180129234156	1500000145	465240	1	465240	0
146180180665361	146180180665361	1000000003	1000000049	-1	1000000049	0
146180180674271	146180180674271	1000000003	1000000049	-1	1000000049	0
146180183178101	146180183178101	1800000080	293848	4	293848	0
146190147967214	146190147967214	1500000151	293848	21	293848	0
146190162516893	146190162516893	1000000003	1000000053	-1	1000000053	0
146190176869401	146190176869401	1000000003	1000000049	-1	1000000049	0
146200146892355	146200146892355	1800000080	293848	38	293848	0


select * from u_goods_stock_log where id in (146170106870163,146180183178101,146200146892355);



select * from u_goods_stock_log where sid=1800000080 and item_num_id=293848 and  id=146200146892355;

create table u_goods_stock_log_bak20190221 as select * from u_goods_stock_log where seq_id in (793621,800970,795887,795798,800944,802977,802756,806409,807834);
delete from u_goods_stock_log where seq_id in (793621,800970,795887,795798,800944,802977,802756,806409,807834);

#------------------------------------------20190221-------------------------------------------------------------

select * from u_goods_stock_log where sid=1500000133 and item_num_id=1100000970;
update  t_gb_stock_20190220 set qty=qty+1 where shop_id=1500000133 and item_num_id=1100000970;
update t_gb_stock set qty=qty+1 where shop_id=1500000133 and item_num_id=1100000970;

select * from u_goods_stock_log where sid=1500000145 and item_num_id=465240;
select * from t_gb_stock_20190217 where shop_id=1500000145 and item_num_id=465240;
select * from t_gb_stock_20190218 where shop_id=1500000145 and item_num_id=465240;
update t_gb_stock_20190218 set qty=qty-1 where shop_id=1500000145 and item_num_id=465240;
update t_gb_stock_20190219 set qty=qty-1 where shop_id=1500000145 and item_num_id=465240;
update t_gb_stock_20190220 set qty=qty-1 where shop_id=1500000145 and item_num_id=465240;
update t_gb_stock set qty=qty-1 where shop_id=1500000145 and item_num_id=465240;

select * from u_goods_stock_log where sid=1500000145 and item_num_id=1100001704;
select * from t_gb_stock_20190219 where shop_id=1500000145 and item_num_id=1100001704;
select * from t_gb_stock where shop_id=1500000145 and item_num_id=1100001704;

update t_gb_stock_20190219 set qty=qty+6 where shop_id=1500000145 and item_num_id=1100001704;
update t_gb_stock_20190220 set qty=qty+6 where shop_id=1500000145 and item_num_id=1100001704;
update t_gb_stock set qty=qty+6 where shop_id=1500000145 and item_num_id=1100001704;


select * from u_goods_stock_log where sid=1800000080 and item_num_id=293848 ;
select * from t_gb_stock_20190217 where storage_id=1800000080 and item_num_id=293848;
update t_gb_stock_20190217 set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;
update t_gb_stock_20190218 set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;
update t_gb_stock_20190219 set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;
update t_gb_stock_20190220 set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;
update t_gb_stock set qty=qty-20 where storage_id=1800000080 and item_num_id=293848;




