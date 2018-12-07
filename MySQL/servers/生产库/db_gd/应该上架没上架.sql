

#####门店###############################



select concat('update t_gb_stock set scan_status=0  where shop_id=',STK.shop_id,' and item_num_id=',STK.item_num_id,';')
FROM
	GB_SHARE_ITEM GST
LEFT JOIN GB_STYLE GBS ON GST.STYLE_NUM_ID = GBS.STYLE_NUM_ID
AND GBS.DIV_NUM_ID = GST.DIV_NUM_ID
LEFT JOIN t_gb_stock STK ON STK.ITEM_NUM_ID = GST.ITEM_NUM_ID
LEFT JOIN GB_CORT_SUB_UNIT SUB ON SUB.SUB_UNIT_NUM_ID = STK.shop_id
LEFT JOIN GB_ONLINE O ON GST.ITEM_NUM_ID = o.ITEM_ID
AND SUB.SUB_UNIT_NUM_ID = o.SID
AND o.type = 0
WHERE
	STK.QTY > 0
AND STK.LOC_PTY_NUM_ID = 1
AND sub.SALE_STATUS = 1
AND GBS.IS_TOTALSTORAGE_SEND = 0
AND SUB. ONLINE = 1
AND O. ONLINE IS NULL
AND GST.ITEM_PIC IS NOT NULL
AND GST. ONLINE = 1
AND GBS. ONLINE = 1 
and not exists(select 1 from t_platform_offline t  where t.sid=stk.shop_id and t.item_id=stk.item_num_id);
;


select * from  t_gb_stock where shop_id=90062810 and item_num_id=461078;
select * from  gb_online where sid=90062810 and item_id=461078;
select * from  t_platform_offline where sid=90062810 and item_id=461078;


#####分仓库###############################
select concat('update t_gb_stock set scan_status=0  where storage_id=',STK.storage_id,' and item_num_id=',STK.item_num_id,';')
FROM
	GB_SHARE_ITEM GST
LEFT JOIN GB_STYLE GBS ON GST.STYLE_NUM_ID = GBS.STYLE_NUM_ID
AND GBS.DIV_NUM_ID = GST.DIV_NUM_ID
LEFT JOIN t_gb_stock STK ON STK.ITEM_NUM_ID = GST.ITEM_NUM_ID
LEFT JOIN gb_storage SUB ON SUB.storage_num_id = STK.storage_id
LEFT JOIN GB_ONLINE O ON GST.ITEM_NUM_ID = o.ITEM_ID
AND SUB.storage_num_id = o.SID
AND o.type in (1,3)
WHERE
	STK.QTY > 0
AND STK.LOC_PTY_NUM_ID = 1
AND GBS.IS_TOTALSTORAGE_SEND = 0
and sub.type_num_id = 2
AND SUB.status = 3
AND SUB.SALE_STATUS = 1
AND O. ONLINE IS NULL
AND GST.ITEM_PIC IS NOT NULL
AND GST. ONLINE = 1
AND GBS. ONLINE = 1
and not exists(select 1 from t_platform_offline t  where t.sid=stk.storage_id and t.item_id=stk.item_num_id)
;

select * from gb_online where sid in (1000000004,1000000003,1000000005) and item_id in (1000000032,1000000033,1000000034);

12111018	63	1000000022	1000000032	3	1000000004	1	2018-07-30 14:43:11	388	0	2018-07-30 14:43:11
11794478	63	1000000023	1000000033	3	1000000004	1	2018-07-11 15:06:00	51	0	2018-07-11 15:06:00
11794479	63	1000000024	1000000034	3	1000000004	1	2018-07-11 15:06:00	459	0	2018-07-11 15:06:00
select * from gb_online where sid in (1000000004) and item_id in (1000000037,1000000009);
update t_gb_stock set scan_status=0  where storage_id=1000000004 and item_num_id=1000000037;
update t_gb_stock set scan_status=0  where storage_id=1000000004 and item_num_id=1000000009;

##########总仓库###############################
select concat('update t_gb_stock set scan_status=0  where storage_id=',STK.storage_id,' and item_num_id=',STK.item_num_id,';')
FROM
	GB_SHARE_ITEM GST
LEFT JOIN GB_STYLE GBS ON GST.STYLE_NUM_ID = GBS.STYLE_NUM_ID
AND GBS.DIV_NUM_ID = GST.DIV_NUM_ID
LEFT JOIN t_gb_stock STK ON STK.ITEM_NUM_ID = GST.ITEM_NUM_ID
LEFT JOIN gb_storage SUB ON SUB.storage_num_id = STK.storage_id
LEFT JOIN GB_ONLINE O ON GST.ITEM_NUM_ID = o.ITEM_ID
AND SUB.storage_num_id = o.SID
AND o.type = 2
WHERE
	STK.QTY > 0
AND STK.LOC_PTY_NUM_ID = 1
AND GBS.IS_TOTALSTORAGE_SEND = 0
and sub.type_num_id = 1
AND SUB.status = 3
and sub.SALE_STATUS=1
AND O. ONLINE IS NULL
AND GST.ITEM_PIC IS NOT NULL
AND GST. ONLINE = 1
AND GBS. ONLINE = 1 
and not exists(select 1 from t_platform_offline t  where t.sid=stk.storage_id and t.item_id=stk.item_num_id)
;

update t_gb_stock set scan_status=0  where storage_id=52571 and item_num_id=395030;
update t_gb_stock set scan_status=0  where storage_id=52467 and item_num_id=456322;
update t_gb_stock set scan_status=0  where storage_id=52467 and item_num_id=461073;

select * from t_gb_stock where shop_id=0 and item_num_id=216499;

select * from gb_storage where storage_num_id=52467;

select * from gb_online where sid=52467 and item_id=216499;