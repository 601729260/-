select * from u_goods_stock_log where sid=1500000115 and item_num_id=1000001699;
select * from u_goods_stock_log where sid=1500000123 and item_num_id=1000001779;
select * from u_goods_stock_log where sid=1500000128 and item_num_id=1100001394;
select * from u_goods_stock_log where sid=1500000135 and item_num_id=1000027339;
select * from u_goods_stock_log where sid=1500000137 and item_num_id=1100004750;
select * from u_goods_stock_log where sid=1500000143 and item_num_id=1100002489;
select * from u_goods_stock_log where sid=1500000148 and item_num_id=1100001739;
select * from u_goods_stock_log where sid=1500000148 and item_num_id=1100001790;
select * from u_goods_stock_log where sid=1500000148 and item_num_id=1100001792;
select * from u_goods_stock_log where sid=1500000151 and item_num_id=1000000274;


select * from u_goods_stock_log where sid=1800000080 and item_num_id=293848;
select * from u_goods_stock_log where sid=1800000080 and item_num_id=1000001699;
select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100004358;
select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100004712;
select * from u_stock_log_detail where id='MMH2019030810038453' and item_num_id=1100001792;

MMH2019021810032389   1500000123  1000001779 2 条
MMH2019030510037375   1500000128  1100001394 2 条
MMH2019022810035744   1500000135  1000027339 3 条
MMH2019030810038202   1500000137  1100004750 2 条
MMH2019030810038453   1500000148  1100001739 2 条
MMH2019030810038453   1500000148  1100001790 2 条
MMH2019030810038453   1500000148  1100001792 2 条
MMH2019030510037380   1500000151  1000000274 2 条




select * from t_gb_stock  a where a.shop_id=1500000115 and a.item_num_id=1000001699 limit 1;


select * from t_gb_stock   where shop_id=1500000115 and item_num_id=1000001699 union all
select * from t_gb_stock   where shop_id=1500000123 and item_num_id=1000001779 union all
select * from t_gb_stock   where shop_id=1500000128 and item_num_id=1100001394 union all
select * from t_gb_stock   where shop_id=1500000135 and item_num_id=1000027339 union all
select * from t_gb_stock   where shop_id=1500000137 and item_num_id=1100004750 union all
select * from t_gb_stock   where shop_id=1500000143 and item_num_id=1100002489 union all
select * from t_gb_stock   where shop_id=1500000148 and item_num_id=1100001739 union all
select * from t_gb_stock   where shop_id=1500000148 and item_num_id=1100001790 union all
select * from t_gb_stock   where shop_id=1500000151 and item_num_id=1000000274 



---------------库存修复----------------

update t_gb_stock set qty=qty-4 where shop_id=1500000115 and item_num_id=1000001699;

update t_gb_stock set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190301 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190302 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190303 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190304set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190305 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190306 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190307 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190308 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190309 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190310 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;
update t_gb_stock_20190311 set qty=qty+4 where shop_id=1500000123 and item_num_id=1000001779;



update t_gb_stock_20190307 set qty=qty+200 where shop_id=1500000128 and item_num_id=1100001394
update t_gb_stock_20190308 set qty=qty+200 where shop_id=1500000128 and item_num_id=1100001394
update t_gb_stock_20190309 set qty=qty+200 where shop_id=1500000128 and item_num_id=1100001394
update t_gb_stock_20190310 set qty=qty+200 where shop_id=1500000128 and item_num_id=1100001394
update t_gb_stock_20190310 set qty=qty+200 where shop_id=1500000128 and item_num_id=1100001394


update t_gb_stock set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190304 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190305 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190306 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190307 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190308 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190309 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190310 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;
update t_gb_stock_20190311 set qty=qty+6 where shop_id=1500000135 and item_num_id=1000027339;



update t_gb_stock set qty=qty+6 where shop_id=1500000137 and item_num_id=1100004750;




update t_gb_stock set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190127 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190128 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190129 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190130 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190131 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190201 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190202 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190203 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190204 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190205 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190206 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190207 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190209 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190210 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190211 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190212 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190213 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190213 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190215 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190216 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190217 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190218 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190219 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190220 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190221 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190222 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190223 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190224 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190225 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190226 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190227 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190228 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190301 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190302 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190303 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190304 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190305 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190306 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190307 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190308 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190309 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190310 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;
update t_gb_stock_20190311 set qty=qty-1 where shop_id=1500000143 and item_num_id=1100002489;




update t_gb_stock set qty=qty+3 where shop_id=1500000148 and item_num_id=1100001739;




update t_gb_stock set qty=qty+5 where shop_id=1500000148 and item_num_id=1100001790;




update t_gb_stock set qty=qty+3 where shop_id=1500000148 and item_num_id=1100001792;


update t_gb_stock set qty=qty+4 where shop_id=1500000151 and item_num_id=1000000274;
update t_gb_stock_20190309 set qty=qty+4 where shop_id=1500000151 and item_num_id=1000000274;
update t_gb_stock_20190310 set qty=qty+4 where shop_id=1500000151 and item_num_id=1000000274;
update t_gb_stock_20190311 set qty=qty+4 where shop_id=1500000151 and item_num_id=1000000274;


update t_gb_stock set qty=qty+6 where shop_id=1500000116 and item_num_id=1000000242;
update t_gb_stock set qty=qty+6 where shop_id=1500000116 and item_num_id=1000000845;
update t_gb_stock set qty=qty+5 where shop_id=1500000116 and item_num_id=1000000959;
update t_gb_stock set qty=qty+6 where shop_id=1500000116 and item_num_id=1000001071;
update t_gb_stock set qty=qty+6 where shop_id=1500000116 and item_num_id=1000001225;
update t_gb_stock set qty=qty+6 where shop_id=1500000116 and item_num_id=1000001394;
update t_gb_stock set qty=qty+6 where shop_id=1500000116 and item_num_id=1000001420;
update t_gb_stock set qty=qty+2 where shop_id=1500000116 and item_num_id=1100002424;
update t_gb_stock set qty=qty+2 where shop_id=1500000116 and item_num_id=1100002432;


select item_num_id, shop_id, qty from t_gb_stock where shop_id=1500000116 and item_num_id in (1000000242,
1000000845,
1000000959,
1000001071,
1000001225,
1000001394,
1000001420,
1100002424,
1100002432
);


