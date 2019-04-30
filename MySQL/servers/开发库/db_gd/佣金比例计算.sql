select * from t_star_shop_goods_bonus_approve_detail where detai_id=117;

select * from gb_share_item_ext where item_num_id=18431;


select * from t_star_shop_goods_bonus_approve_detail;

select * from gb_share_item where item_num_id=18431;



select a.barcode_1 as '商品条码',b.cost_price*1.1/100  as '到手价（元）' from  gb_share_item a left join gb_share_item_ext  b on a.item_num_id=b.item_num_id  where is_deleted=0 and mod(a.item_num_id,180)=0; 


select a.barcode_1 as '商品条码',29  as '毛利率（元）' from  gb_share_item a left join gb_share_item_ext  b on a.item_num_id=b.item_num_id  where is_deleted=0 and mod(a.item_num_id,10000)=0; 



select * from t_star_shop_goods_bonus_approve_batch order by create_time desc;


truncate  table t_star_shop_goods_bonus_approve_batch;
truncate  table t_star_shop_goods_bonus_approve_detail;


select * from t_star_shop_goods_bonus_approve_batch order by batch_id desc;

select * from t_star_shop_goods_bonus_approve_detail order by batch_id desc limit 100;
select * from t_star_shop_goods_bonus_approve_detail where batch_id=10490;

select * from t_star_shop_goods_bonus_approve_detail where detai_id=347577;

select * from t_daily_standard_price_7_0 limit 100;

select * from gb_style where style_num_id=2961;

select * from gb_share_item where item_num_id=758;

select * from gb_style where style_num_id=2961;


select * from t_star_shop_goods_bonus_approve_detail where barcode='885177300609' and update_flage_value>cost_price;


select *  from t_star_shop_goods_bonus_log where item_num_id=469632 order by create_time desc;
select * from t_star_shop_goods_bonus_log_ext where item_num_id=469632 ;



2019-04-28 20:33:53

2019-04-28 20:33:53


2019-04-28 20:50:01






