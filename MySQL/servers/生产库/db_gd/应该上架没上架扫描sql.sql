 select
        stk.item_num_id as itemNumId,
        item.style_num_id as styleNumId,
        stk.qty as qty,
        ifnull(o.online,0) online,
            sub.MG_UNIT_NUM_ID as companyId,
            stk.shop_id as sid
       
        from gb_share_item item
        left join gb_style s on  s.style_num_id = item.style_num_id  and s.div_num_id = item.div_num_id
        left join t_gb_stock stk on  item.item_num_id  = stk.item_num_id
            left join gb_cort_sub_unit sub on stk.shop_id = sub.sub_unit_num_id
            left join gb_online o on stk.item_num_id = o.item_id and stk.shop_id = o.sid and o.type = 4
            LEFT JOIN t_platform_offline pof ON item.item_num_id = pof.item_id  AND s.style_num_id = pof.style_id and stk.shop_id = pof.sid and pof.type = 4
        where
        item.ITEM_PIC is not null
        and stk.qty > 0
        and stk.loc_pty_num_id = 1
        and pof.ONLINE is null
            and s.is_totalstorage_send = 0
            AND SUB.ONLINE = 1
            and sub.SALE_STATUS = 1
        and s.online = 1
        and item.online = 1
        and o.online is null
				and sub.source_type = 2;  --27
				
				
				 select
        stk.item_num_id as itemNumId,
        item.style_num_id as styleNumId,
        stk.qty as qty,
        ifnull(o.online,0) online,
            sub.MG_UNIT_NUM_ID as companyId,
            stk.shop_id as sid
       
        from gb_share_item item
        left join gb_style s on  s.style_num_id = item.style_num_id  and s.div_num_id = item.div_num_id
        left join t_gb_stock stk on  item.item_num_id  = stk.item_num_id
            left join gb_cort_sub_unit sub on stk.shop_id = sub.sub_unit_num_id
            left join gb_online o on stk.item_num_id = o.item_id and stk.shop_id = o.sid and o.type = 0
            LEFT JOIN t_platform_offline pof ON item.item_num_id = pof.item_id  AND s.style_num_id = pof.style_id and stk.shop_id = pof.sid and pof.type = 0
        where
        item.ITEM_PIC is not null
        and stk.qty > 0
        and stk.loc_pty_num_id = 1
        and pof.ONLINE is null
            and s.is_totalstorage_send = 0
            AND SUB.ONLINE = 1
            and sub.SALE_STATUS = 1
        and s.online = 1
        and item.online = 1
        and o.online is null
				and sub.source_type !=2;  --3
				
				
				
				
				
						
				 select
        stk.item_num_id as itemNumId,
        item.style_num_id as styleNumId,
        stk.qty as qty,
        ifnull(o.online,0) online,
            sto.MG_UNIT_NUM_ID as companyId,
            stk.storage_id as sid
        from gb_share_item item
        left join gb_style s on  s.style_num_id = item.style_num_id  and s.div_num_id = item.div_num_id
        left join t_gb_stock stk on  item.item_num_id  = stk.item_num_id
            left join gb_storage sto on sto.storage_num_id  = stk.storage_id
            left join gb_online o on stk.item_num_id = o.item_id and stk.storage_id = o.sid and o.type = 1
            LEFT JOIN t_platform_offline pof ON item.item_num_id = pof.item_id AND s.style_num_id = pof.style_id and stk.storage_id = pof.sid and pof.type = 1
        where
        item.ITEM_PIC is not null
            and stk.qty > 0
        and stk.loc_pty_num_id = 1
        and pof.ONLINE is null
            and s.is_totalstorage_send = 0       
            AND sto.status = 3
            and sto.type_num_id = 2
            and sto.sale_status = 1
                  and sto.source_type != 2
        and s.online = 1
        and item.online = 1
        and o.online is null;--34
				
				
				
							 select
        stk.item_num_id as itemNumId,
        item.style_num_id as styleNumId,
        stk.qty as qty,
        ifnull(o.online,0) online,
            sto.MG_UNIT_NUM_ID as companyId,
            stk.storage_id as sid
        from gb_share_item item
        left join gb_style s on  s.style_num_id = item.style_num_id  and s.div_num_id = item.div_num_id
        left join t_gb_stock stk on  item.item_num_id  = stk.item_num_id
            left join gb_storage sto on sto.storage_num_id  = stk.storage_id
            left join gb_online o on stk.item_num_id = o.item_id and stk.storage_id = o.sid and o.type = 2
            LEFT JOIN t_platform_offline pof ON item.item_num_id = pof.item_id AND s.style_num_id = pof.style_id and stk.storage_id = pof.sid and pof.type = 2
        where
        item.ITEM_PIC is not null
            and stk.qty > 0
        and stk.loc_pty_num_id = 1
        and pof.ONLINE is null
            AND sto.status = 3
            and sto.type_num_id = 2
            and sto.sale_status = 1
                  and sto.source_type != 2
        and s.online = 1
        and item.online = 1
        and o.online is null;   --237
				
				
				
							 select
        stk.item_num_id as itemNumId,
        item.style_num_id as styleNumId,
        stk.qty as qty,
        ifnull(o.online,0) online,
            sto.MG_UNIT_NUM_ID as companyId,
            stk.storage_id as sid
        from gb_share_item item
        left join gb_style s on  s.style_num_id = item.style_num_id  and s.div_num_id = item.div_num_id
        left join t_gb_stock stk on  item.item_num_id  = stk.item_num_id
            left join gb_storage sto on sto.storage_num_id  = stk.storage_id
            left join gb_online o on stk.item_num_id = o.item_id and stk.storage_id = o.sid and o.type = 5
            LEFT JOIN t_platform_offline pof ON item.item_num_id = pof.item_id AND s.style_num_id = pof.style_id and stk.storage_id = pof.sid and pof.type = 5
        where
        item.ITEM_PIC is not null
            and stk.qty > 0
        and stk.loc_pty_num_id = 1
        and pof.ONLINE is null
            and s.is_totalstorage_send = 0       
            AND sto.status = 3
            and sto.type_num_id = 2
            and sto.sale_status = 1
                  and sto.source_type = 2
        and s.online = 1
        and item.online = 1
        and o.online is null; --1
				
				
				
				
				