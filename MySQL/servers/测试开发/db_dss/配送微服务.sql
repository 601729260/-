select  * from t_dispatch WHERE disp_logic_no=140220177360458 ;

select * from t_inspect_pwdbox_order;

select  * from t_dispatch_employee;

select  * from t_dispatch;

select * from  t_dispatch_service_city_area_suport;



select * from t_order where order_batch_no=140240167989155 limit 100;

select * from t_order limit 100;
################发票##############################
select * from t_order_invoice where order_no = 140240191038454 limit 1
140240191087232

select * from t_order_invoice where order_no = 140240191072438 limit 1

select invoice_type,invoice_title from t_order where order_no=140240191072438;

select * from t_invoice_logistics where il_order_no=140240191072438 limit 100;


select * from t_order where order_no=140240191069783 limit 100;



select * from t_order where order_no=140240191042408 limit 100;

oldOrderNo =140240191072438  order_no=14024019104240


select * from t_invoice_logistics where il_order_no=140240191042408 limit 100;


select * from t_invoice_logistics where il_order_no=140240191042408 limit 100;

select * from t_order_invoice where order_no=140240191042408 ;

select * from t_order where  order_no=140240191042408 ;

----线上付款

select * from t_invoice_logistics order by il_apply_time desc limit 100;

select * from t_order_invoice where order_no=140170137403029;

select * from t_order where order_no=140170137403029;


#############################
SELECT
	* 
FROM
	GB_STORAGE S
	LEFT JOIN GB_PRV P ON P.PRV_NUM_ID = S.PRV_NUM_ID
	LEFT JOIN GB_CITY C ON C.CITY_NUM_ID = S.CITY_NUM_ID
	LEFT JOIN GB_CITY_AREA CAERA ON CAERA.CITY_AREA_NUM_ID = S.CITY_AREA_NUM_ID
	LEFT JOIN GB_DIV D ON D.DIV_NUM_ID = S.MG_UNIT_NUM_ID 
WHERE
	S.STORAGE_NUM_ID =1000000059 
	
SELECT
	* 
FROM
	GB_STORAGE S WHERE
	S.STORAGE_NUM_ID =1000000059 
	
	
	
	
	HH140240477922569
	##############################换货单
	select * from t_refund_line where refund_line_no="HH140240477922569" ;
	
	select * from t_refund
	
	###########################订单进度表
	
	select * from t_dispatch limit 100;
	
		select * from t_dispatch where disp_logic_no=132060179750168 ;
		
			select * from t_dispatch where disp_logic_no=140240191042408 ;
		
		yy 查询的表
		
select *			
FROM
	db_gd_dev.t_invoice_logistics t 
WHERE
	1 = 1 
ORDER BY
	il_apply_time DESC ;
	
		select * FROM
	GB_CONSUMER_TRAN_UNIT 
WHERE
	DEL_STATE = 0 
GROUP BY
	TRAN_SIM_NO 
ORDER BY
	SERIES ASC ;

		
dss 查询的表
select * from db_dss.t_dispatch t where disp_logic_no=140240191042408  ;

select * from db_dss.t_dispatch t where disp_logic_no=140240191042408  ;
select *			FROM  db_gd_dev.t_invoice_logistics where il_order_no=140240191042408;



	#######################配送范围
 select
        count(1) 
    from
        t_dispatch_employee_service s 
    left join
        t_dispatch_employee_service_area a 
            on s.emp_service_id = a.emp_service_id 
    where
        s.service_type = 3 
        and a.scas_id = 9;

		
		 select
        count(1) as col_0_0_ 
    from
        t_dispatch dispatchen0_ 
    where
        dispatchen0_.disp_service_type=3 
        and dispatchen0_.disp_area_id=330111;
				
				
				
				select * from db_dss.t_dispatch_employee where emp_name="杨科" ;
				
				select * from db_dss.t_dispatch_employee_service where emp_id=1000117;
		
				
				select * from db_dss.t_dispatch_employee_service_area where  emp_service_id=1309;
				
				select * from db_dss.t_dispatch_service_city_area_suport where scas_id in (2,3);
				
		
		
	#####################根据配送范围查询配送单
	
	
	 select
        count(distinct dispatchen0_.disp_batch_no) as col_0_0_ 
    from
        t_dispatch dispatchen0_ 
    where
        (
            dispatchen0_.disp_area_id in (
                ? , ? , ? , ? , ?
            )
        ) 
        and (
            dispatchen0_.disp_state in (
                ?
            )
        ) 
        and (
            dispatchen0_.disp_type in (
                ? , ? , ? , ? , ? , ?
            )
        ) 
    order by
        dispatchen0_.disp_logic_set_time DESC