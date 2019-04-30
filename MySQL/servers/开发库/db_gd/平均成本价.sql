CREATE TABLE `t_average_cost_price` (
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
  `item_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'sku id',
  `barcode` varchar(32)  DEFAULT '' COMMENT '条码',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku 名称',
  `total_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '门店成本总价',
  `total_purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '总部成本价',
  `total_num` bigint(18) DEFAULT '0' COMMENT '商品数量',
  `total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量',
  `avarage_cost_price` decimal(10,2) DEFAULT NULL COMMENT '门店平均成本价',
  `avarage_purchase_price` decimal(10,2) DEFAULT NULL COMMENT '总部平均成本价',
  PRIMARY KEY (`sid`,`item_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

drop table t_average_cost_price_log;
CREATE TABLE `t_average_cost_price_log` (
 `seq_id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '默认自增主键||隐藏',
	`id` varchar(32)  DEFAULT NULL COMMENT '单据编号',
	`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '制单时间   |选填|显示',
	`bill_type` int(10) DEFAULT NULL COMMENT '单据类型枚举',
   operate_type int(2) DEFAULT NULL comment '操作类型',	
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
	 sid_type int(10) DEFAULT NULL COMMENT '仓库类型',
	 change_num bigint(18) DEFAULT 0 COMMENT '库存变化' ,
  `item_num_id` bigint(18) NOT NULL DEFAULT 0 COMMENT 'sku id',
  `barcode` varchar(32)  DEFAULT NUll COMMENT '条码',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku 名称',
	`cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '本次成本价',
  `purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '本次进价',
  `pre_total_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '门店成本总价',
  `pre_total_num` bigint(18) DEFAULT '0' COMMENT '商品数量',
	`pre_total_purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '总部成本价',
  `pre_total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量',
  `pre_avarage_cost_price` decimal(10,2) DEFAULT NULL COMMENT '门店平均成本价',
  `pre_avarage_purchase_price` decimal(10,2) DEFAULT NULL COMMENT '总部平均成本价',
	PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


alter table u_goods_stock_log add cost_price decimal(10,2) comment '门店成本价'; 
alter table u_goods_stock_log add  purchase_price decimal(10,2) DEFAULT NULL COMMENT '进价';
alter table t_average_cost_price add 	`sid_type` int(10) DEFAULT NULL COMMENT '仓库类型';
alter table t_average_cost_price add 	create_time timestamp  COMMENT '创建时间';
alter table t_average_cost_price add 	update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间';

alter table t_average_cost_price modify   `total_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '门店成本总价';
alter table t_average_cost_price modify 	`barcode` varchar(32)  DEFAULT NULL COMMENT '条码';
alter table t_average_cost_price modify   `total_purchase_price` decimal(10,2) DEFAULT '0.00' COMMENT '总部成本价';
alter table t_average_cost_price modify   `total_num` bigint(18) DEFAULT '0' COMMENT '商品数量';
alter table t_average_cost_price modify   `total_purchase_num` bigint(18) DEFAULT '0' COMMENT '采购数量';
alter table t_average_cost_price modify   `avarage_cost_price` decimal(10,2) DEFAULT 0 COMMENT '门店平均成本价';
alter table t_average_cost_price modify   `avarage_purchase_price` decimal(10,2) DEFAULT 0 COMMENT '总部平均成本价';


alter table t_average_cost_price drop  PRIMARY KEY;
alter table t_average_cost_price add  PRIMARY KEY(sid,item_num_id);



drop table t_average_purchase_log;
create table t_average_purchase_log(
  sid  bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
	sid_type int(10) DEFAULT NULL COMMENT '仓库类型',
  item_num_id bigint(18) NOT NULL DEFAULT '0' COMMENT 'sku id',
	 create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	 create_date  date comment '日结日期' , 
	 to_num   bigint(18)  NOT NULL DEFAULT '0'  comment '入库数量',
	 to_purchase_price decimal(10,2) default 0 comment '入库采购价',
	 total_to_purchase_price decimal(10,2) default 0 comment '入库采购价',
	 out_num bigint(18)  NOT NULL DEFAULT '0'  comment '出库数量',
	 out_purchase_price decimal(10,2) default 0 comment '出库采购价',
	 total_out_purchase_price decimal(10,2) default 0 comment '出库采购价', 
	 residue_num bigint(18)  NOT NULL DEFAULT '0'  comment '剩余数量',
	 residue_purchase_price decimal(10,2) default 0 comment '剩余采购价',
	 total_residue_purchase_price decimal(10,2) default 0 comment '剩余采购价'
);

drop table t_average_cost_log;
create table t_average_cost_log (
  `sid` bigint(18) NOT NULL DEFAULT '0' COMMENT '门店或仓库ID,1为总部',
	`sid_type` int(10) DEFAULT NULL COMMENT '仓库类型',
  `item_num_id` bigint(18) NOT NULL DEFAULT '0' COMMENT 'sku id',
	`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	 create_date  date comment '日结日期' , 
	 to_num   bigint(18)  NOT NULL DEFAULT '0'  comment '入库数量',
	 to_cost_price decimal(10,2) default 0 comment '入库成本价',
	 total_to_cost_price decimal(10,2) default 0 comment '入库成本总额',
	 out_num bigint(18)  NOT NULL DEFAULT '0'  comment '出库数量',
	 out_cost_price decimal(10,2) default 0 comment '出库成本价',
	 total_out_cost_price decimal(10,2) default 0 comment '出库成本总额',
	 residue_num bigint(18)  NOT NULL DEFAULT '0'  comment '剩余数量',
	 residue_cost_price decimal(10,2) default 0 comment '剩余成本价',
	 total_residue_cost_price decimal(10,2) default 0 comment '剩余成本总额'
	 );
	 
	 select * from t_average_cost_log;
	 
	 select * from u_goods_stock_log;
	 
	  select count(1) from u_goods_stock_log;
	 
	  update u_goods_stock_log set cost_price=90,purchase_price=70 ;
	  update u_goods_stock_log set cost_price=100,purchase_price=80 limit 290000 ;
	  update u_goods_stock_log set cost_price=110,purchase_price=60 limit 190000 ; 
		update u_goods_stock_log set cost_price=120,purchase_price=90 limit 90000 ;
		
	#-----------------初始化1230数据
	
	

	 residue_num,
	 residue_cost_price ,
	 total_residue_cost_price ,
	 residue_purchase_price ,
	 total_residue_purchase_price

   select * from t_average_cost_log;

	 delete from t_average_cost_log;
	 
	 
	 #--------------------------------计算门店成本价----------------------------------------
	 
	 delete from t_average_cost_log;
	 
	 create table t_average_cost_log_20181030 as select * from t_average_cost_log where 1=2;
	 insert into t_average_cost_log_20181030(sid,sid_type,item_num_id,create_date,residue_num,residue_cost_price,total_residue_cost_price) 
	 select shop_id as sid,2 as sid_type,item_num_id,'2018-10-30',100,98,9800 from t_gb_stock  where shop_id>1500000000  ;
	 
	 insert into t_average_cost_log_20181030(sid,sid_type,item_num_id,create_date,residue_num,residue_cost_price,total_residue_cost_price) 
	 select distinct 1 as sid,1 as sid_type,item_num_id,'2018-10-30',100,98,9800 from t_gb_stock where shop_id>1500000000 ;
		
	
	 #----------------生成需要sid的数据--------------------
	 
	 
	 
	
	 insert into t_average_cost_log(sid,sid_type,item_num_id,create_date) 
	 select shop_id as sid,2 as sid_type,item_num_id,'2018-10-31' from t_gb_stock  where shop_id>1500000000  ;
	 
	 
	 #-----------计算门店入库 (调拨入库单 调拨出库单产生的入库)-------------
	 
	update t_average_cost_log t1 
	left join 
	(select sid,
	 sid_type,
	 item_num_id,
	 date_format(create_time,'%Y-%m-%d') as create_date,
	 sum(qty_change) as to_num ,
	 sum(qty_change*ifnull(cost_price,0)) as total_to_cost_price,
	 from u_goods_stock_log
	 where sid_type=2 and bill_type in (1,2,3) 
	 and qty_change>0 
	 and date_format(create_time,'%Y-%m-%d')='2018-10-31'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set t1.total_to_cost_price=ifnull(t1.total_to_cost_price,0)+ifnull(t2.total_to_cost_price,0),
	 t1.to_num=ifnull(t1.to_num,0)+ifnull(t2.to_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=2;
	 
	 
	 
	#--------------计算门店入库   （非调拨入库单 调拨出库单的入库产生的入库）	
	update t_average_cost_log t1 
	left join 
	(select a.sid,
	 a.sid_type,
	 a.item_num_id,
	 date_format(a.create_time,'%Y-%m-%d') as create_date,
	 sum(qty_change) as to_num ,
	 sum(qty_change*ifnull(b.residue_cost_price,0)) as total_to_cost_price,
	 from u_goods_stock_log a
	 left join t_average_cost_log  b on a.sid=b.sid and a.item_num_id=b.item_num_id
	 where a.sid_type=2 and a.bill_type not in (1,2,3) 
	 and a.qty_change>0 
	 and date_format(a.create_time,'%Y-%m-%d')='2018-10-31'
	 and b.create_date='2018-10-30'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set t1.total_to_cost_price=ifnull(t1.total_to_cost_price,0)+ifnull(t2.total_to_cost_price,0),
	 t1.to_num=ifnull(t1.to_num,0)+ifnull(t2.to_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=2;
	 
	 
	 #--------- 计算门店出库    
	 	update t_average_cost_log t1 
	left join 
	(select a.sid,
	 a.sid_type,
	 a.item_num_id,
	 date_format(a.create_time,'%Y-%m-%d') as create_date,
	 sum(qty_change) as out_num ,
	 sum(qty_change*ifnull(b.residue_cost_price,0)) as total_out_cost_price,
	 from u_goods_stock_log a
	 left join t_average_cost_log  b on a.sid=b.sid and a.item_num_id=b.item_num_id
	 where a.sid_type=2 
	 and a.qty_change<0 
	 and date_format(a.create_time,'%Y-%m-%d')='2018-10-31'
	 and b.create_date='2018-10-30'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set t1.total_out_cost_price=ifnull(t1.total_out_cost_price,0)+ifnull(t2.total_out_cost_price,0),
	 t1.out_num=ifnull(t1.out_num,0)+ifnull(t2.out_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=2;
	 

	 
	 
	#------------计算门店的最终结果
	
	insert into t_average_cost_log(sid,sid_type,item_num_id,create_date,
	to_num,total_to_cost_price,
	out_num,total_out_cost_price)
	select 1 as sid,1 as sid_type,item_num_id,create_date,
	sum(to_num) as to_num, sum(total_to_cost_price) as total_to_cost_price,
	sum(out_num) as out_num,sum(total_out_cost_price) as total_out_cost_price
	from t_average_cost_log where create_date='2018-10-31' group by item_num_id,create_date limit 100;
	
	
	update t_average_cost_log set to_cost_price=total_to_cost_price/to_num where create_date='2018-10-31' and sid_type=2 and to_num>0;
  update t_average_cost_log set out_cost_price=total_out_cost_price/out_num where create_date='2018-10-31' and sid_type=2 and out_num<0;
	update t_average_cost_log set total_residue_cost_price=ifnull(total_to_cost_price,0)+ifnull(total_out_cost_price,0),residue_num=ifnull(to_num,0)+ifnull(out_num,0) where create_date='2018-10-31' and sid_type=2 ;
  update t_average_cost_log set total_cost_price=ifnull(total_residue_cost_price,0)/residue_num where create_date='2018-10-31' and sid_type=2 and residue_num!=0 and residue_num!=null;
	

	

	 
	
	
	#################################----------------------计算总部采购价
	
	delete from t_average_purchase_log;
	
	 create table t_average_purchase_log_20181030 as select * from t_average_purchase_log where 1=2;
	 insert into t_average_purchase_log_20181030(sid,sid_type,item_num_id,create_date,residue_num,residue_purchase_price,total_residue_purchase_price) 
	 select storage_id as sid,3 as sid_typ,item_num_id, '2018-10-30',100,78,7800 from t_gb_stock  where storage_id>1800000000;
	 
	 insert into t_average_purchase_log_20181030(sid,sid_type,item_num_id,create_date,residue_num,residue_purchase_price,total_residue_purchase_price) 
	 select distinct 1 as sid,1 as sid_type,item_num_id,'2018-10-30',100,78,7800 from t_gb_stock where  storage_id>1800000000 ;
			
			
	#---------------------生成需要的sid 数据
		 
	 insert into t_average_purchase_log(sid,sid_type,item_num_id,create_date) 
	 select storage_id as sid,3 as sid_typ,item_num_id, '2018-10-31' from t_gb_stock  where storage_id>1800000000;
	 
	 insert into t_average_purchase_log(sid,sid_type,item_num_id,create_date) 
	 select distinct 1 as sid,1 as sid_type,item_num_id,'2018-10-31' from t_gb_stock  where storage_id>1800000000  ;
	 
	 
	
			 #-----------计算仓库入库(采购单、调拨入库、调拨出库、退货单产生的入库）----------
  update t_average_purchase_log t1 
	left join 
	(select sid,
	 sid_type,
	 item_num_id,
	 date_format(create_time,'%Y-%m-%d') as create_date,
	 sum(p_qty_change) as to_num ,
	 sum(p_qty_change*ifnull(cost_price,0)) as total_to_cost_price,
	 sum(p_qty_change*ifnull(purchase_price,0)) as total_to_purchase_price
	 from u_goods_stock_log
	 where sid_type=3 and bill_type in (0,1,2,3)
	 and p_qty_change>0 
	 and date_format(create_time,'%Y-%m-%d')='2018-10-31'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set t1.total_to_cost_price=ifnull(t1.total_to_cost_price,0)+ifnull(t2.total_to_cost_price,0),
	 t1.total_to_purchase_price=ifnull(t1.total_to_purchase_price,0)+ifnull(t2.total_to_purchase_price,0),
	 t1.to_num=ifnull(t1.to_num,0)+ifnull(t2.to_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=3;
	 

#------------计算仓库入库（销售订单退换货）

update t_average_purchase_log t1 
	left join 
	(select a.sid,
	 a.sid_type,
	 a.item_num_id,
	 date_format(a.create_time,'%Y-%m-%d') as create_date,
	 sum(qty_change) as to_num ,
	 sum(qty_change*ifnull(b.residue_cost_price,0)) as total_to_cost_price,
	 sum(qty_change*ifnull(b.residue_purchase_price,0)) as total_to_purchase_price
	 from u_goods_stock_log a
	 left join t_average_cost_log  b on a.sid=b.sid and a.item_num_id=b.item_num_id
	 where a.sid_type=2 
	 and qty_change>0 and p_qty_change!=-qty_change
	 and date_format(a.create_time,'%Y-%m-%d')='2018-10-31'
	 and b.create_date='2018-10-30'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set t1.total_to_cost_price=ifnull(t1.total_to_cost_price,0)+ifnull(t2.total_to_cost_price,0),
	 t1.total_to_purchase_price=ifnull(t1.total_to_purchase_price,0)+ifnull(t2.total_to_purchase_price,0),
	 t1.to_num=ifnull(t1.to_num,0)+ifnull(t2.to_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=2;
	 
#------------计算仓库出库（退货供应商 团购批发）
  update t_average_purchase_log t1 
	left join 
	(select sid,
	 sid_type,
	 item_num_id,
	 date_format(create_time,'%Y-%m-%d') as create_date,
	 sum(p_qty_change) as out_num ,
	 sum(p_qty_change*ifnull(purchase_price,0)) as total_out_purchase_price
	 from u_goods_stock_log
	 where sid_type=3 and bill_type in (6,7)
	 and p_qty_change<0 
	 and date_format(create_time,'%Y-%m-%d')='2018-10-31'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set
	 t1.total_out_purchase_price=ifnull(t1.total_out_purchase_price,0)+ifnull(t2.total_out_purchase_price,0),
	 t1.out_num=ifnull(t1.out_num,0)+ifnull(t2.out_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=3;





#------------计算仓库出库（销售订单）

 	update t_average_purchase_log t1 
	left join 
	(select a.sid,
	 a.sid_type,
	 a.item_num_id,
	 date_format(a.create_time,'%Y-%m-%d') as create_date,
	 sum(qty_change) as out_num ,
	 sum(qty_change*ifnull(b.residue_purchase_price,0)) as total_out_purchase_price
	 from u_goods_stock_log a
	 left join t_average_cost_log  b on a.sid=b.sid and a.item_num_id=b.item_num_id
	 where a.sid_type=3 
	 and a.qty_change<0 and p_qty_change!=-qty_change
	 and date_format(a.create_time,'%Y-%m-%d')='2018-10-31'
	 and b.create_date='2018-10-30'
	 group by date_format(create_time,'%Y-%m-%d'),sid,item_num_id) t2 
	 on t1.sid=t2.sid and t1.item_num_id=t2.item_num_id 
	 set 
	 t1.total_out_purchase_price=ifnull(t1.total_out_purchase_price,0)+ifnull(t2.total_out_purchase_price,0),
	 t1.out_num=ifnull(t1.out_num,0)+ifnull(t2.out_num,0)
	 where t1.create_date='2018-10-31' and t1.sid_type=3;
	 
	 
	 #----------计算仓库的最终结果-------------------------------
	 
	insert into t_average_purchase_log(sid,sid_type,item_num_id,create_date,
	to_num,total_to_purchase_price,
	out_num,total_out_purchase_price)
	select 1 as sid,1 as sid_type,item_num_id,create_date,
	sum(to_num) as to_num, sum(total_to_purchase_price) as total_to_purchase_price,
	sum(out_num) as out_num,sum(total_out_purchase_price) as total_out_purchase_price
	from t_average_cost_log where create_date='2018-10-31' group by item_num_id,create_date limit 100;
	 
	update t_average_purchase_log set to_purchase_price=total_to_purchase_price/to_num where create_date='2018-10-31' and sid_type=3 and to_num>0;
  update t_average_purchase_log set out_purchase_price=total_out_purchase_price/out_num where create_date='2018-10-31' and sid_type=3 and out_num<0;
	update t_average_purchase_log set total_residue_purchase_price=ifnull(total_to_purchase_price,0)+ifnull(total_out_cost_price,0),residue_num=ifnull(to_num,0)+ifnull(out_num,0) where create_date='2018-10-31' and sid_type=3 ;
  update t_average_purchase_log set residue_purchase_price=ifnull(total_residue_purchase_price,0)/residue_num where create_date='2018-10-31' and sid_type=2 and residue_num!=0 and residue_num!=null;
	
	
	
	#---------将结果更新到平均成本价表
	

	update  t_average_cost_price a 
	left join t_average_purchase_log b on a.sid=b.sid and a.item_num_id=b.item_num_id
	set a.average_purchase_price=b.residue_purchase_price
	where b.create_date='2018-10-31';
	
	insert into t_average_cost_price(sid,item_num_id,average_purchase_price)
	select sid,item_num_id,residue_purchase_price from t_average_purchase_log b
	where b.create_date='2018-10-31'
	and not exists(select 1 from  t_average_cost_price a where a.sid=b.sid and a.item_num_id=b.item_num_id);
	
	
	update  t_average_cost_price a 
	left join t_average_cost_log b on a.sid=b.sid and a.item_num_id=b.item_num_id
	set a.average_cost_price=b.residue_cost_price
	where b.create_date='2018-10-31';
	
	insert into t_average_cost_price(sid,item_num_id,average_cost_price)
	select sid,item_num_id,residue_cost_price from t_average_cost_log b
	where b.create_date='2018-10-31'
	and not exists(select 1 from  t_average_cost_price a where a.sid=b.sid and a.item_num_id=b.item_num_id);
	
	
	#####-----------------------数据检测-------------------------
	
		select * from t_average_cost_log_20181214 where item_num_id=1100003794 and sid=1500000102;
		
		  update t_average_cost_log_20181214 set residue_cost_price=ifnull(total_residue_cost_price,0)/residue_num    
      where create_date='2018-12-14' 
			and sid_type=2 and residue_num!=0 and residue_num!=null;              



		  select * from  t_average_cost_log_20181214   
      where create_date='2018-12-14' 
			and sid_type=2 and residue_num!=0 ;  
	
	select * from t_average_cost_log_20181214 where item_num_id=1100003794 and sid=1;
	
	select * from t_average_cost_log_20181215 where item_num_id=1100003794 and sid=1500000102;
	

delete from u_goods_stock_log  where id='MMH2018121910008820';
delete from u_stock_log  where id='MMH2018121910008820';
delete from u_stock_log_detail  where id='MMH2018121910008820';

##############################-----------------------测试-----------------------------------###################################

truncate table t_average_cost_price;
truncate table  t_average_cost_price_log;
delete  from u_goods_stock_log where sid=1800000080 and item_num_id=1100003851;


select * from t_average_cost_price_log;
select * from t_average_cost_price where item_num_id=1100003880;


select * from  u_goods_stock_log where sid=1800000080 and item_num_id=1100003880;



select * from t_average_cost_price_log where item_num_id=1100003880 and id='MMH2018122110009718';


select * from gb_share_item where item_num_id=1100003877 and is_deleted=0;

select * from gb_share_item_ext where sku_name like '%别动%';

select * from u_goods_stock_log where sid=1800000080 and item_num_id=1100003851;


select * from t_gb_stock where storage_id=1800000080 and item_num_id=1100003880;


select * from t_average_cost_price_log where sid=1500000104 and item_num_id=1100003881;


select sum(change_num)/2 from t_average_cost_price_log where sid=1500000104 and item_num_id=1100003881;

select sum(change_num*cost_price)/2 from t_average_cost_price_log where sid=1500000104 and item_num_id=1100003881;


select * from t_average_cost_price where item_num_id=1100003881;
select * from t_average_cost_price_log where sid=1500000104 and item_num_id=1100003881;



select * from t_average_cost_price where sid=1500000104 and item_num_id=1100003881;

select * from t_average_cost_price where item_num_id=1100003851;
select * from t_average_cost_price_log where sid=1500000102 and item_num_id=1100003851;


select * from t_average_cost_price where item_num_id=1100003851;
select * from t_average_cost_price_log where sid=1800000080 and item_num_id=1100003851;


select * from u_stock_log_detail where id='MMH2018122210009843' and item_num_id=1100003851;


select * from t_average_cost_price where 


	 
