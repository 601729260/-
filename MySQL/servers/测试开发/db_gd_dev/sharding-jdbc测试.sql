#create table wgn_order_0 as select * from wgn_order where 1=2;
#create table wgn_order_1 as select * from wgn_order where 1=2;
#create table wgn_order_item_0 as select * from wgn_order_item where 1=2;
#create table wgn_order_item_1 as select * from wgn_order_item where 1=2;
SELECT
	* 
FROM
	wgn_order;
	
	
INSERT INTO wgn_order
VALUES
	( 5, 4 );
	INSERT INTO wgn_order
VALUES
	( 5, 6 );
	
	select * from wgn_order group by user_id,order_id;
	
	
INSERT INTO wgn_order
VALUES
	( 5, 4 );
DELETE 
FROM
	wgn_order;
	
delete from wgn_order;
delete from wgn_order_0;
delete from wgn_order_1;

SELECT	* FROM wgn_order;
SELECT	* FROM wgn_order_0;
SELECT	* FROM wgn_order_1;
