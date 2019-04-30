select * from t_goods_shelf;
select * from t_store_place_goods_relation;
select * from t_store_place;

select a.barcode,c.goods_shelf_code,b.store_place_code from t_store_place_goods_relation a,t_store_place b,t_goods_shelf c where a.store_place_id=b.store_place_id and b.goods_shelf_id=c.goods_shelf_id;


b.goods_shelf_code,c.store_place_code 
select a.item_num_id
from t_store_place_goods_relation a ,t_goods_shelf b ,t_store_place c where a.store_place_id=c.store_place_id and b.goods_shelf_id=c.goods_shelf_id 
and  item_num_id in 
(1000000397,1000002337,1100001677,1000002391,1000027252,1000001575,1000000341,
1000000427,432204,1000001103,432220,15004373,429684,1000002909,1000003060,1000011132,
1000002362,1000012057,1000001531,1000000507,1000000509,1100000107,1000000262,1000000280,
1000001661,1000001366,1000001385,1000001274,1100001757,1100001745,1000001138,1000001298,
1000000316,1000000241,374482,1000001559,1000001526,1000001564,1000000574,1000001561,1000000911,
1000000571,429687,1100002317,1000000535,1000000530,1000000369,1000027341,1000027340,1000027339,
1000027342,1000027346,428291,233098,1000027250,233099,1000002786,1000002914,1000003557,1000002427,
1000002428,1000001565) group by item_num_id having count(1)>1;


select a.item_num_id ,
b.goods_shelf_code,c.store_place_code 
from t_store_place_goods_relation a ,t_goods_shelf b ,t_store_place c where a.store_place_id=c.store_place_id and b.goods_shelf_id=c.goods_shelf_id 
and  item_num_id in (1000000397,1000002337,1000003557);

select * from t_store_place_goods_relation where item_num_id in (1000000397,1000002337,1000003557) and delete_status=0;