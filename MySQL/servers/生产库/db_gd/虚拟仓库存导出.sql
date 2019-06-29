商品名称、商品条码、次品仓、待退仓 、棉品仓 、格林仓 、积分仓 、中转仓 、特殊用品仓


select * from t_virtual_stock where qty>0 and sid=1800000080;

select * from t_virtual_stock_member where sid=1800000080;
2	次品仓
3	待退仓
4	棉品仓
5	格林仓
6	积分仓
7	中转仓
8	特殊用品仓

select e.style_title,c.barcode_1,
sum(case a.virtual_stock_type when 2 then a.qty else 0 end) as 次品仓 ,
sum(case a.virtual_stock_type when 3 then a.qty else 0 end) as 待退仓 ,
sum(case a.virtual_stock_type when 4 then a.qty else 0 end) as 棉品仓 ,
sum(case a.virtual_stock_type when 5 then a.qty else 0 end) as 格林仓 ,
sum(case a.virtual_stock_type when 6 then a.qty else 0 end) as 积分仓 ,
sum(case a.virtual_stock_type when 7 then a.qty else 0 end) as 中转仓 ,
sum(case a.virtual_stock_type when 8 then a.qty else 0 end) as 特殊用品仓 ,
d.purchase_price as 采购价,
d.purchase_price*(sum(case a.virtual_stock_type when 2 then a.qty else 0 end)+sum(case a.virtual_stock_type when 3 then a.qty else 0 end)+sum(case a.virtual_stock_type when 4 then a.qty else 0 end)+sum(case a.virtual_stock_type when 5 then a.qty else 0 end)+sum(case a.virtual_stock_type when 6 then a.qty else 0 end)+sum(case a.virtual_stock_type when 7 then a.qty else 0 end)+sum(case a.virtual_stock_type when 8 then a.qty else 0 end)
) as  采购总额
from t_virtual_stock  a
left join gb_share_item c on a.item_num_id=c.item_num_id and c.IS_DELETED=0
left join gb_share_item_ext d on a.item_num_id=d.item_num_id 
left join gb_style e on c.style_num_id=d.style_num_id
where  a.qty>0 and a.sid=1800000080
group by e.style_title,c.barcode_1;



