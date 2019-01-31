4008976527589
黄桥店家库存不对
系统35，实际15，多出来20[捂脸]门店id：1500000148

select * from gb_share_item where barcode_1=4008976527589 and is_deleted=0;

select * from t_gb_stock where shop_id=1500000148 and item_num_id=1000027252;

select id,sid,item_num_id,pre_qty,qty_change ,create_time from u_goods_stock_log where  sid=1500000148 and item_num_id=1000027252 order by create_time desc;


from u_goods_stock_log where  sid=1500000148 and item_num_id=1000027252 order by create_time desc;


select * from t_gb_stock_20181122 where shop_id=1500000148 and item_num_id=1000027252;


create table t_gb_stock_bak20181122 as select * from t_gb_stock where shop_id in (1500000116,1500000148);
update t_gb_stock a left join u_stock_log_detail b 
on a.shop_id=b.to_sid and a.item_num_id=b.item_num_id
set a.qty=a.qty+b.from_num
where a.shop_id in (1500000116,1500000148)
and b.from_num>0
and b.id in ('MMH2018111710005696','MMH2018112210007749');


create table u_stock_detal_bak20181122 as select * from  u_stock_log_detail 
where  id in ('MMH2018111710005696','MMH2018112210007749');
update u_stock_log_detail set to_num=from_num where  id in ('MMH2018111710005696','MMH2018112210007749') and from_num>0;

select * from  u_stock_log_detail b where b.id in('MMH2018111710005696','MMH2018112210007749') and item_num_id=1000027252;

select * from u_goods_stock_log;