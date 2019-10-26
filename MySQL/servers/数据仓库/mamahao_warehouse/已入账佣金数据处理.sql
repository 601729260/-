150030168130556

create table t_star_member_sales_20190606  as select * from t_star_member_sales where order_no=150030168130556 and member_id=7;
create table t_star_member_sales_detail_20190606 as select * from t_star_member_sales_detail where order_no=150030168130556 and member_id=7;
create table t_star_member_asset_20190606 as select * from t_star_member_asset where member_id=7;
create table t_star_member_asset_log_20190606 as  select * from t_star_member_asset_log where out_serial_number=150030168130556 and member_id=7;
update t_star_member_sales set commission_amount=commission_amount-100 where order_no=150030168130556 and member_id=7;
update t_star_member_sales_detail set commission_amount=commission_amount-100  where order_no=150030168130556 and member_id=7;
update t_star_member_asset set balance=balance-100 where member_id=7;
update t_star_member_asset_log set change_balance=change_balance-100 where out_serial_number=150030168130556 and member_id=7;
 