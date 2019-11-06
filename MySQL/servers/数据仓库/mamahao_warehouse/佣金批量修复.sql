select * from mamahao_warehouse.u_staff where staff_id=73;

18018122882

select * from mamahao_warehouse.t_member_star where member_id=1782576;


18018122882

select * from mamahao_warehouse.t_order_line where created_time>'2019-10-18 00:00:00' and emp_id>0 limit 100


select * from t_star_member_sales_detail a where update_time>'2019-10-10 00:00:00' and channel_type in (0)   and rate=0 and commission_amount=0  ;


select * from mamahao_warehouse.t_order 
where dealing_type=5 
and created_time>'2019-10-18 00:00:00' limit 100;

#-----自营订单有问题的
select distinct concat('{"orderNo":"',a.order_no,'"},') from t_order a 
inner join u_order_line b on
a.order_no=b.order_no 
where b.create_time>'2019-10-18 00:00:00'  and b.create_time<'2019-10-18 11:03:00'  and emp_id>0 
and a.created_time>'2019-10-18 00:00:00'  and a.created_time<'2019-10-18 11:03:00';


select * from 
#-----淘宝订单有问题的数据
SELECT distinct concat('{"orderNo":"',a.trade_parent_id,'","channelType":',order_type,'},') FROM   t_tk_order a WHERE tk_create_time>'2019-09-01 22:41:00'  
AND trade_parent_id NOT IN
(
 SELECT DISTINCT order_no FROM  t_star_member_sales_detail  WHERE order_no IN 
 (
 SELECT DISTINCT trade_parent_id FROM   t_tk_order WHERE tk_create_time>'2019-09-01 22:41:00'  
 )
)


#-------佣金明细
select * from t_star_member_sales_detail where order_no=554961605479852194;

select distinct order_no from t_star_member_sales where channel_type in (1,2,3) and  update_time>'2019-10-18 10:00:00'  ;

select concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},')  from t_star_member_sales a 
where channel_type in (1,2,3) and  update_time>'2019-10-18 10:00:00' and update_time<'2019-10-18 18:00:00'  and order_member_id=999999999 
group by concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},') having count(1)>2;

#-----------10号以后计算了之前的淘宝订单-------

select * from t_star_member_sales_detail where update_time>'2019-10-11 03:00:00' and channel_type in (1,2,3) and order_time<'2019-10-11 00:00:00' and rate=0;

select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},')  from t_star_member_sales_detail a where update_time>'2019-10-11 03:00:00' and channel_type in (1,2,3) and order_time<'2019-10-11 00:00:00' and rate=0;

#-----------10号以后计算了之前的自营订单-------

select * from t_star_member_sales_detail where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and rate=0 and commission_amount=0;

select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,'},')  from t_star_member_sales_detail a where update_time>'2019-10-11 03:00:00' and channel_type in (1,2,3) and order_time<'2019-10-11 00:00:00' and rate=0;


select distinct concat('{"orderNo":"',a.order_no,'"},') from t_star_member_sales_detail a where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and rate=0 and commission_amount=0  ;

select distinct concat('{"orderNo":"',a.order_no,'"},') from t_star_member_sales_detail a where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and rate=0 and commission_amount=0 and sale_status=2;

select distinct concat('{"orderNo":"',a.order_no,'"},') from t_star_member_sales_detail a where update_time>'2019-10-11 03:00:00' and update_time<'2019-10-19 00:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and rate=0 and commission_amount=0 and sale_status=1;

select distinct order_time,item_num_id,rate,order_no,star_member_level ,entry_time from t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and sale_status=1 ;


select * from t_star_member_sales_detail a where update_time>'2019-10-11 03:00:00' and update_time<'2019-10-19 00:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and rate=0 and commission_amount=0 ;

select * from t_star_member_sales_detail where order_no='154090151609020';

select * from t_star_member_sales_detail where order_no='153020113174564';

select * from t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and commission_amount=10
and operate_type=1;


#-----------------根据佣金比例修复
select max(direct_bonus) ,item_num_id from t_star_shop_goods_bonus_log
where item_num_id in (
select distinct order_no, item_num_id,order_create_time from t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>0
and operate_type=1)
group by item_num_id


select * from t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>10
and operate_type=1
and sale_status=2;



select * from t_star_member_sales_detail a inner join t_star_shop_goods_bonus_log b on a.item_num_id=b.item_num_id and b.create_time<a.order_create_time 
where a.update_time>'2019-10-11 03:00:00' and channel_type in (0) and a.order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0
and real_amount>10
and operate_type=1;



select * from t_star_member_sales_detail where member_id=18251130870
18626202975
13319132030






select distinct concat("'",order_no,"',") from t_star_member_sales_detail a 
where update_time>'2019-10-11 03:00:00' and channel_type in (0) and order_time<'2019-10-11 00:00:00' and 
sale_type=4
and rate=0;

select * from t_push where content like '%获得%' limit 100;

select * from  t_jpush   where order_no in () limit 100;





select  * from t_order where order_no='154090151609020';

#--------淘宝佣金比例配置
select * from t_third_goods_bonus_log limit 100;
UPDATE t_third_goods_bonus_log set create_time='2019-07-01 23:00:00' where id in (1,2,3);
UPDATE t_third_goods_bonus_log set create_time='2019-08-01 23:00:00' where id in (4);

#---------扫码的sql

  select distinct order_no from  (
            (select a.order_no from t_order a  
             inner join t_member_star b on a.member_id=b.member_id  
             left join t_star_member_sales c on a.order_no=c.order_no 
            where a.dealing_type not in (4,5)  
            and a.sub_type !=2  
            and a.order_type in (1,6)  
            and a.order_state in (0,4,5,6,9) 
            and a.parent_order_no is not null 
            and ifnull(c.update_time,'2019-10-18 00:00:00') < a.update_time 
            and a.update_time <='2019-10-18 12:59:00' 
            and c.sale_status!=1 
            limit 10000) 
            union all  
            (select a.order_no from t_order a  
             inner join t_member_star b on a.member_id=b.member_id  
             inner join t_star_member_sales c on a.order_no=c.order_no 
             inner join t_refund_line d on a.order_no=d.order_no  
            where a.dealing_type not in (4,5)  
            and a.order_type in (1,6)  
            and a.sub_type !=2  
            and a.order_state in (0,4,5,6,9) 
            and d.status in (1,2,3,4,7,9,11) 
            and a.parent_order_no is not null 
            and c.update_time < d.update_time 
            and a.update_time <='2019-10-18 12:59:00'
            and c.sale_status!=1 
            limit 10000) ) x
						
#-------------------查询订单并批量计算--------------------------

select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,',"insertTmpTable":true},')  
from t_star_member_sales_detail a where order_created_time>'2019-10-11 03:00:00'
and order_created_time<'2019-10-22 00:00:00';

select * from t_star_member_sales_tmp;

select * from t_star_member_sales_detail_tmp;



select * from t_order where order_no='154150119283093';

select * from t_star_member_sales_detail_tmp where order_no='154150119283093';


select distinct concat('{"orderNo":"',a.order_no,'","channelType":',0,',"insertTmpTable":true},')   from t_order a where member_id 
in (6509, 517626, 530001, 1190808, 1307890, 1459978, 1469331, 1494774, 1506806, 1514106, 1519335, 1581258, 1591639, 1623782, 1627664, 1633877, 1635829, 1675250, 1778744, 1785479, 1785591, 1788902, 1789214, 1789988, 1792287, 1795528, 1796588, 1799408, 1800304, 1801898, 1805080, 1810450, 1811295, 1816004, 1816416, 1820034, 1820171, 1824026, 1824473, 1826711, 1827406, 1830458, 1836026, 1838605, 1850615, 1851763, 1855251, 1858269, 1858438, 1860373, 1866946, 1870973, 1870989, 1871052, 1874201, 1874464, 1879527, 1880089, 1883508, 1884305, 1884567, 1885897, 1887302, 1887777, 1889744, 1890380, 1891672, 1893323, 1893752, 1894604, 1894840, 1897129, 1897513, 1897518, 1898515, 1898603, 1902026, 1902085, 1902457, 1905696, 1907632, 1907726, 1914982, 1916557, 1918328, 1925743, 1931342, 1931737, 1932081, 1932725, 1932989, 1933682, 1933869, 1936715, 1941933, 1942896, 1943756, 1944212, 1945229, 1947880, 1947923, 1949415, 1950559, 1950820, 1950880, 1951546, 1953474, 1953759, 1954511, 1954664, 1957526, 1959419, 1959833, 1963638, 1963643, 1970769, 1971001, 1973449, 1974035, 1974123, 1977504, 1978073, 1978598, 1978775, 1979728, 1980044, 1980914, 1982774, 1986394, 1995403, 2002110, 2003337, 2003785, 2004907, 2005413, 2005575, 2005609, 2005721, 2005909, 2005991, 2006151, 2006203, 2006223, 2006447, 2006493, 2006554, 2006979, 2007092, 2007123, 2007253, 2007707, 2007918, 2008069, 2008780, 2009304, 2009716, 2010037, 2010390, 2010809, 2010859, 2011073, 2011172, 2011236, 2011502, 2011624, 2012214, 2012771, 2013107, 2013517, 2015497, 2015518, 2015700, 2015916, 2016243, 2016391, 2017095, 2017392, 2017886, 2017908, 2017955, 2018250, 2018865, 2019567, 2019857, 2019859, 2019929, 2019937, 2020048, 2020080, 2020213, 2020248, 2020416, 2020452, 2020454, 2020480, 2020712, 2020792, 2021163, 2021218, 2021222, 2021532, 2021565, 2021572, 2021657, 2021701, 2022007, 2022023, 2022031, 2022035, 2022039, 2022246, 2022325, 2022398, 2022612, 2022616, 2022658, 2022871, 2023513, 2023564, 2023909, 2023912, 2024052, 2024086, 2024090, 2024097, 2024171, 2024233, 2024258, 2024481, 2024510, 2024590, 2024737, 2025037, 2025068, 2025095, 2025126, 2025142, 2025560, 2025574, 2025817, 2025906, 2026022, 2026050, 2026233, 2026337, 2026409, 2026990, 2027008, 2027029, 2027050, 2027098, 2027112, 2027133, 2027197, 2027276, 2027681, 2027813, 2028844, 2029079, 2029154, 2029173, 2029347, 2029531, 2029633, 2029634, 2029682, 2029692, 2029708, 2029716, 2029743, 2029768, 2030010, 2030074, 2030157, 2030159, 2030173, 2030177, 2030612, 2030765, 2030990, 2031111, 2031115, 2031680, 2031811, 2032085, 2032179, 2032422, 2032688, 2033159, 2033177, 2033182, 2033602, 2033751, 2033892, 2033907, 2033928, 2033937, 2033943, 2033956, 2033966, 2034024, 2034036, 2034068, 2034205, 2034219, 2034300, 2034301, 2034321, 2034334, 2034340, 2034497, 2034594, 2034601, 2034611, 2034986, 2035553, 2035562, 2035969, 2036026, 2036052, 2036094, 2036115, 2036145, 2036193, 2036258, 2036300, 2036323, 2036571, 2036947, 2037233, 2037271, 2037284, 2037810, 2038280, 2038282, 2038298, 2038431, 2038535, 2038551, 2038560, 2038564, 2038689, 2039112, 2039393, 2039469, 2039501, 2039675, 2039807, 2040166, 2040270, 2040276, 2040301, 2040353, 2040645, 2040659, 2040671, 2041188, 2041327, 2041330, 2041331, 2041377, 2041680, 2041882, 2041888, 2041918, 2041941, 2041948, 2041961, 2042146, 2042243, 2042308, 2042327, 2042599, 2042889, 2042962, 2042964, 2043005, 2043056, 2043057, 2043116, 2043148, 2043561, 2043988, 2044003, 2044102, 2044212, 2046433, 2046509, 2046530, 2046538, 2046611, 2046639, 2046950, 2047010, 2047069, 2047152, 2047388, 2047389, 2047579, 2047610, 2047628, 2047644, 2047713, 2047850, 2048051, 2048130, 2048248, 2048252, 2048255, 2048287, 2048375, 2048474, 2048659, 2048738, 2048762, 2048788, 2048844, 2048883, 2049316, 2049345, 2049390, 2049524, 2049528, 2049545, 2049588, 2050461, 2050589, 2050604, 2050664, 2050939, 2050945, 2051044, 2051073, 2051098, 2051121, 2051539, 2051543, 2051567, 2051570, 2051695, 2051776, 2051830, 2052056, 2052566, 2052619, 2052683, 2052712, 2052731, 2053228, 2053766, 2054122, 2054155, 2054176, 2054217, 2054218, 2054274, 2054309, 2054353, 2054377, 2054697, 2054766, 2055271, 2055398, 2055422, 2055429, 2055923, 2055925, 2055936, 2056194, 2056215, 2056328, 2056383, 2056432, 2056759, 2056767, 2056812, 2056827, 2056841, 2057067, 2057082, 2057265, 2057876, 2058129, 2058242, 2058271, 2058301, 2058323, 2058593, 2058737, 2058949, 2058952, 2058982, 2058983, 2058996, 2059155, 2059329, 2059520, 2059540, 2059561, 2059724, 2059727, 2059733, 2059742, 2059782, 2059961, 2060046, 2060055, 2060168, 2060332, 2060351, 2060752, 2060781, 2061087, 2061194, 2061209, 2061239, 2061461, 2061502, 2061527, 2061579, 2061812, 2061841, 2061971, 2061973, 2062014, 2062028, 2062038, 2062123, 2062278, 2062381, 2062384, 2062431, 2062809, 2062843, 2062851, 2063073, 2063116, 2063117, 2063186, 2063195, 2063230, 2063460, 2063465, 2063488, 2063556, 2063564, 2063587, 2063622, 2063912, 2064510, 2064540, 2064623, 2064630, 2064641, 2064938, 2065045, 2065258, 2065577, 2065584, 2065596, 2065632, 2065664, 2065703, 2065778, 2065939, 2065955, 2065957, 2066339, 2066410, 2066983, 2067230, 2067255, 2067307, 2067340, 2067349, 2067365, 2067388, 2067423, 2067432, 2067466, 2067471, 2067485, 2067515, 2067524, 2067558, 2067562, 2067564, 2067572, 2067578, 2067586, 2067588, 2067594, 2067597, 2067625, 2067657, 2067664, 2067673, 2067677, 2067702, 2067711, 2067722, 2067775, 2067787, 2067802, 2067814, 2067860, 2067889, 2067900, 2067901, 2067932, 2067944, 2067946, 2067954, 2067967, 2068010, 2068028, 2068377)
and parent_order_no is not null
and created_time>'2019-10-11 00:00:00';
						


select order_no   from t_order a where member_id 
in (6509, 517626, 530001, 1190808, 1307890, 1459978, 1469331, 1494774, 1506806, 1514106, 1519335, 1581258, 1591639, 1623782, 1627664, 1633877, 1635829, 1675250, 1778744, 1785479, 1785591, 1788902, 1789214, 1789988, 1792287, 1795528, 1796588, 1799408, 1800304, 1801898, 1805080, 1810450, 1811295, 1816004, 1816416, 1820034, 1820171, 1824026, 1824473, 1826711, 1827406, 1830458, 1836026, 1838605, 1850615, 1851763, 1855251, 1858269, 1858438, 1860373, 1866946, 1870973, 1870989, 1871052, 1874201, 1874464, 1879527, 1880089, 1883508, 1884305, 1884567, 1885897, 1887302, 1887777, 1889744, 1890380, 1891672, 1893323, 1893752, 1894604, 1894840, 1897129, 1897513, 1897518, 1898515, 1898603, 1902026, 1902085, 1902457, 1905696, 1907632, 1907726, 1914982, 1916557, 1918328, 1925743, 1931342, 1931737, 1932081, 1932725, 1932989, 1933682, 1933869, 1936715, 1941933, 1942896, 1943756, 1944212, 1945229, 1947880, 1947923, 1949415, 1950559, 1950820, 1950880, 1951546, 1953474, 1953759, 1954511, 1954664, 1957526, 1959419, 1959833, 1963638, 1963643, 1970769, 1971001, 1973449, 1974035, 1974123, 1977504, 1978073, 1978598, 1978775, 1979728, 1980044, 1980914, 1982774, 1986394, 1995403, 2002110, 2003337, 2003785, 2004907, 2005413, 2005575, 2005609, 2005721, 2005909, 2005991, 2006151, 2006203, 2006223, 2006447, 2006493, 2006554, 2006979, 2007092, 2007123, 2007253, 2007707, 2007918, 2008069, 2008780, 2009304, 2009716, 2010037, 2010390, 2010809, 2010859, 2011073, 2011172, 2011236, 2011502, 2011624, 2012214, 2012771, 2013107, 2013517, 2015497, 2015518, 2015700, 2015916, 2016243, 2016391, 2017095, 2017392, 2017886, 2017908, 2017955, 2018250, 2018865, 2019567, 2019857, 2019859, 2019929, 2019937, 2020048, 2020080, 2020213, 2020248, 2020416, 2020452, 2020454, 2020480, 2020712, 2020792, 2021163, 2021218, 2021222, 2021532, 2021565, 2021572, 2021657, 2021701, 2022007, 2022023, 2022031, 2022035, 2022039, 2022246, 2022325, 2022398, 2022612, 2022616, 2022658, 2022871, 2023513, 2023564, 2023909, 2023912, 2024052, 2024086, 2024090, 2024097, 2024171, 2024233, 2024258, 2024481, 2024510, 2024590, 2024737, 2025037, 2025068, 2025095, 2025126, 2025142, 2025560, 2025574, 2025817, 2025906, 2026022, 2026050, 2026233, 2026337, 2026409, 2026990, 2027008, 2027029, 2027050, 2027098, 2027112, 2027133, 2027197, 2027276, 2027681, 2027813, 2028844, 2029079, 2029154, 2029173, 2029347, 2029531, 2029633, 2029634, 2029682, 2029692, 2029708, 2029716, 2029743, 2029768, 2030010, 2030074, 2030157, 2030159, 2030173, 2030177, 2030612, 2030765, 2030990, 2031111, 2031115, 2031680, 2031811, 2032085, 2032179, 2032422, 2032688, 2033159, 2033177, 2033182, 2033602, 2033751, 2033892, 2033907, 2033928, 2033937, 2033943, 2033956, 2033966, 2034024, 2034036, 2034068, 2034205, 2034219, 2034300, 2034301, 2034321, 2034334, 2034340, 2034497, 2034594, 2034601, 2034611, 2034986, 2035553, 2035562, 2035969, 2036026, 2036052, 2036094, 2036115, 2036145, 2036193, 2036258, 2036300, 2036323, 2036571, 2036947, 2037233, 2037271, 2037284, 2037810, 2038280, 2038282, 2038298, 2038431, 2038535, 2038551, 2038560, 2038564, 2038689, 2039112, 2039393, 2039469, 2039501, 2039675, 2039807, 2040166, 2040270, 2040276, 2040301, 2040353, 2040645, 2040659, 2040671, 2041188, 2041327, 2041330, 2041331, 2041377, 2041680, 2041882, 2041888, 2041918, 2041941, 2041948, 2041961, 2042146, 2042243, 2042308, 2042327, 2042599, 2042889, 2042962, 2042964, 2043005, 2043056, 2043057, 2043116, 2043148, 2043561, 2043988, 2044003, 2044102, 2044212, 2046433, 2046509, 2046530, 2046538, 2046611, 2046639, 2046950, 2047010, 2047069, 2047152, 2047388, 2047389, 2047579, 2047610, 2047628, 2047644, 2047713, 2047850, 2048051, 2048130, 2048248, 2048252, 2048255, 2048287, 2048375, 2048474, 2048659, 2048738, 2048762, 2048788, 2048844, 2048883, 2049316, 2049345, 2049390, 2049524, 2049528, 2049545, 2049588, 2050461, 2050589, 2050604, 2050664, 2050939, 2050945, 2051044, 2051073, 2051098, 2051121, 2051539, 2051543, 2051567, 2051570, 2051695, 2051776, 2051830, 2052056, 2052566, 2052619, 2052683, 2052712, 2052731, 2053228, 2053766, 2054122, 2054155, 2054176, 2054217, 2054218, 2054274, 2054309, 2054353, 2054377, 2054697, 2054766, 2055271, 2055398, 2055422, 2055429, 2055923, 2055925, 2055936, 2056194, 2056215, 2056328, 2056383, 2056432, 2056759, 2056767, 2056812, 2056827, 2056841, 2057067, 2057082, 2057265, 2057876, 2058129, 2058242, 2058271, 2058301, 2058323, 2058593, 2058737, 2058949, 2058952, 2058982, 2058983, 2058996, 2059155, 2059329, 2059520, 2059540, 2059561, 2059724, 2059727, 2059733, 2059742, 2059782, 2059961, 2060046, 2060055, 2060168, 2060332, 2060351, 2060752, 2060781, 2061087, 2061194, 2061209, 2061239, 2061461, 2061502, 2061527, 2061579, 2061812, 2061841, 2061971, 2061973, 2062014, 2062028, 2062038, 2062123, 2062278, 2062381, 2062384, 2062431, 2062809, 2062843, 2062851, 2063073, 2063116, 2063117, 2063186, 2063195, 2063230, 2063460, 2063465, 2063488, 2063556, 2063564, 2063587, 2063622, 2063912, 2064510, 2064540, 2064623, 2064630, 2064641, 2064938, 2065045, 2065258, 2065577, 2065584, 2065596, 2065632, 2065664, 2065703, 2065778, 2065939, 2065955, 2065957, 2066339, 2066410, 2066983, 2067230, 2067255, 2067307, 2067340, 2067349, 2067365, 2067388, 2067423, 2067432, 2067466, 2067471, 2067485, 2067515, 2067524, 2067558, 2067562, 2067564, 2067572, 2067578, 2067586, 2067588, 2067594, 2067597, 2067625, 2067657, 2067664, 2067673, 2067677, 2067702, 2067711, 2067722, 2067775, 2067787, 2067802, 2067814, 2067860, 2067889, 2067900, 2067901, 2067932, 2067944, 2067946, 2067954, 2067967, 2068010, 2068028, 2068377)
and parent_order_no >0
and order_state in (0,4,5,6)
and created_time>'2019-10-11 00:00:00'


#-----------------------------


select * from t_star_member_sales_tmp;

select a.member_id,a.order_no from t_star_member_sales_detail a left join  t_star_member_sales_detail_tmp b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null
and a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:00:00';





select a.member_id,a.order_no from t_star_member_sales_detail_tmp a left join  t_star_member_sales_detail b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null
and a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:40:00';


#------------------------计算后又发生退款的数据-----------------------------
select a.* from t_star_member_sales_detail a inner join  t_star_member_sales_detail_tmp b
on a.order_no=b.order_no and a.member_id=b.member_id and a.operate_type=b.operate_type and a.item_num_id=b.item_num_id
where   a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:40:00'
and a.real_commission_amount!=b.real_commission_amount
and a.sale_type=b.sale_type
and a.star_member_level=b.star_member_level
and a.channel_type!=0;




select distinct concat('{"orderNo":"',a.order_no,'","channelType":',a.channel_type,',"insertTmpTable":true},')   from t_star_member_sales_detail a inner join  t_star_member_sales_detail_tmp b
on a.order_no=b.order_no and a.member_id=b.member_id and a.operate_type=b.operate_type and a.item_num_id=b.item_num_id
where   a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:40:00'
and a.real_commission_amount!=b.real_commission_amount
and a.sale_type=b.sale_type
and a.star_member_level=b.star_member_level
and a.channel_type!=0;

#-------------------等级不一样的订单-------------

select a.* from t_star_member_sales_detail a inner join  t_star_member_sales_detail_tmp b
on a.order_no=b.order_no and a.member_id=b.member_id and a.operate_type=b.operate_type and a.item_num_id=b.item_num_id
where   a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:40:00'
#and a.real_commission_amount!=b.real_commission_amount
and a.sale_type=b.sale_type
and a.star_member_level!=b.star_member_level
and a.sale_type!=9;


#--------------saleType 不一样的订单----------------

select a.* from t_star_member_sales_detail a inner join  t_star_member_sales_detail_tmp b
on a.order_no=b.order_no and a.member_id=b.member_id and a.operate_type=b.operate_type and a.item_num_id=b.item_num_id
where   a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:40:00'
#and a.real_commission_amount!=b.real_commission_amount
and a.sale_type!=b.sale_type
and a.star_member_level=b.star_member_level
and a.sale_type!=9;

#-------实际表中多出的佣金-----


433760

select * from t_star_member_sales_detail_tmp where 


select * from t_star_member_sales_detail a left join  t_star_member_sales_detail_tmp b
on a.order_no=b.order_no and a.member_id=b.member_id
where b.member_id is null
and a.order_created_time>'2019-10-11 00:00:00'
and a.order_created_time<'2019-10-22 00:00:00'
and a.member_id not in(0,1,2);


select * from  t_order where order_no='MPOS154260134382986';


#---------订单送错人的数据修复



select * from t_star_member_asset_log where out_serial_number in ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215");

create table t_star_member_asset_bak20191026 as 
select a.* from  t_star_member_asset a inner join (
select member_id,sum(change_balance)  as change_balance from t_star_member_asset_log where out_serial_number in ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215")
group by member_id) b 
on a.member_id=b.member_id


update   t_star_member_asset a inner join (
select member_id,sum(change_balance)  as change_balance from t_star_member_asset_log where out_serial_number in ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215")
group by member_id) b 
on a.member_id=b.member_id
set a.balance=a.balance-b.change_balance 

create table t_star_member_asset_log_bak20191026 as select * from t_star_member_asset_log where out_serial_number in ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215");

delete from t_star_member_asset_log where out_serial_number in ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215");

delete from t_star_member_sales where order_no in  ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215");

delete  from t_star_member_sales_detail where order_no in  ("154200136313237",
"MPOS154130155057503",
"154190153948364",
"MPOS154130135700559",
"MPOS154130196683721",
"MPOS154170121982642",
"MPOS154140173863710",
"154190124254423",
"154170100286902",
"154200112288548",
"154170156008215");


						