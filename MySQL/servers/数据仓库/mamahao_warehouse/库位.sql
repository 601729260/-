select * from t_goods_shelf;
select concat(b.goods_shelf_name,"-",a.store_place_name) from t_store_place a left join t_goods_shelf b on a.goods_shelf_id=b.goods_shelf_id;


select c.style_title as 商品,c.barcode as 条码,concat(b.goods_shelf_name,"-",a.store_place_name) as 库位 from  t_store_place_goods_relation c left join t_store_place a on c.store_place_id=a.store_place_id left join t_goods_shelf b on a.goods_shelf_id=b.goods_shelf_id;



select * from t_gb_stock_20190628;



select a.商品,a.条码,
a.app库存+a.公共仓库存+ifnull(b.次品仓,0)+ifnull(b.待退仓,0)+ifnull(b.棉品仓,0)+ifnull(b.格林仓,0)+ifnull(b.积分仓,0)+ifnull(b.中转仓,0)+ifnull(b.特殊用品仓,0) as 总计,
a.app库存 ,a.公共仓库存,ifnull(b.次品仓,0) as 次品仓,
ifnull(b.待退仓,0) as 待退仓,ifnull(b.棉品仓,0) as 棉品仓,ifnull(b.格林仓,0) as 格林仓,
ifnull(b.积分仓,0) as 积分仓,ifnull(b.中转仓,0) as 中转仓,ifnull(b.特殊用品仓,0) as 特殊用品仓
 from 
(select a.item_num_id,c.style_title as 商品,b.BARCODE_1 as 条码,a.qty as app库存 ,a.p_qty as 公共仓库存 from t_gb_stock_20190628 a
 LEFT JOIN gb_share_item b on. a.item_num_id= b.item_num_id
LEFT JOIN gb_style c on b.style_num_id=c.style_num_id
  where storage_id=1800000080 and (qty+p_qty)!=0 ) a
left JOIN  
(select a.item_num_id,e.style_title as  商品 ,c.barcode_1  as 条码,
sum(case a.virtual_stock_type when 2 then a.qty else 0 end) as 次品仓 ,
sum(case a.virtual_stock_type when 3 then a.qty else 0 end) as 待退仓 ,
sum(case a.virtual_stock_type when 4 then a.qty else 0 end) as 棉品仓 ,
sum(case a.virtual_stock_type when 5 then a.qty else 0 end) as 格林仓 ,
sum(case a.virtual_stock_type when 6 then a.qty else 0 end) as 积分仓 ,
sum(case a.virtual_stock_type when 7 then a.qty else 0 end) as 中转仓 ,
sum(case a.virtual_stock_type when 8 then a.qty else 0 end) as 特殊用品仓 ,
sum(case a.virtual_stock_type when 2 then a.qty else 0 end)+sum(case a.virtual_stock_type when 3 then a.qty else 0 end)+sum(case a.virtual_stock_type when 4 then a.qty else 0 end)+sum(case a.virtual_stock_type when 5 then a.qty else 0 end)+sum(case a.virtual_stock_type when 6 then a.qty else 0 end)+sum(case a.virtual_stock_type when 7 then a.qty else 0 end)+sum(case a.virtual_stock_type when 8 then a.qty else 0 end)  as  总计
from t_virtual_stock_20190629   a
left join gb_share_item c on a.item_num_id=c.item_num_id and c.IS_DELETED=0
left join gb_share_item_ext d on a.item_num_id=d.item_num_id 
left join gb_style e on c.style_num_id=e.style_num_id
where  a.qty>0 and a.sid=1800000080
group by e.style_title,c.barcode_1) b on a.item_num_id=b.item_num_id
