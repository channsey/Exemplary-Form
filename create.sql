-- Drop all tables in the correct dependency order
-- since (1) SQLite doesn't support cascade in drop table
-- and (2) PostgreSQL won't drop a table if it would violate
-- foreign key constraints.
drop table if exists AIRPORTS cascade;
drop table if exists AIRLINES cascade;
drop table if exists FLIGHTS cascade;

create table AIRPORTS (
  AIRPORT_NAME /*DEST & ORIGIN*/varchar(3) unique,
  AIRPORT_ID/*AIRPORT_CITY_MARKET_ID*/ integer,
    primary key (AIRPORT_NAME)
);

create table AIRLINES (
  CARRIER_ID/*OP_UNIQUE_CARRIER*/ varchar(2) unique,
  AIRLINE_ID/*OP_CARRIER_AIRLINE_ID*/ integer,
    primary key (CARRIER_ID)
);

create table FLIGHTS (
  OP_CARRIER_FL_NUM integer,
  FL_DATE date,
  OP_UNIQUE_CARRIER varchar(2),
  --OP_CARRIER_ARILINE_ID integer unique,
  --ORIGIN_AIRPORT_ID integer,
  --ORIGIN_AIRPORT_SEQ_ID integer,
  --ORIGIN_CITY_MARKET_ID integer unique,
  ORIGIN varchar(3),
  --DEST_AIRPORT_ID integer,
  --DEST_AIRPORT_SEQ_ID integer,
  --DEST_CITY_MARKET_ID integer,
  DEST varchar(3),
  CRS_DEP_TIME integer,
  DEP_TIME integer,
  DEP_DELAY integer,
  TAXI_OUT integer,
  WHEELS_OFF integer,
  WHEELS_ON integer,
  TAXI_IN integer,
  CRS_ARR_TIME integer,
  ARR_TIME integer,
  ARR_DELAY integer,
  CANCELLED integer,
  CANCELLED_CODE varchar(1),
  DIVERTED integer,
  DISTANCE integer,
  primary key(OP_CARRIER_FL_NUM, FL_DATE),
  foreign key (ORIGIN) references AIRPORTS (AIRPORT_NAME)
    on delete cascade,
  foreign key (DEST) references AIRPORTS (AIRPORT_NAME)
    on delete cascade,
  foreign key (OP_UNIQUE_CARRIER) references AIRLINES (CARRIER_ID)
    on delete cascade
);

--SYMBOL','AIRPORT_CITY_MARKET_ID');
insert into AIRPORTS values ('ATL','30397');
insert into AIRPORTS values ('AUS','30423');
insert into AIRPORTS values ('BOI','30713');
insert into AIRPORTS values ('BUR','32575');
insert into AIRPORTS values ('BWI','30852');
insert into AIRPORTS values ('CLE','30647');
insert into AIRPORTS values ('CLT','31057');
insert into AIRPORTS values ('DAL','30194');
insert into AIRPORTS values ('DEN','30325');
insert into AIRPORTS values ('DFW','30194');
insert into AIRPORTS values ('EWR','31703');
insert into AIRPORTS values ('FAT','31638');
insert into AIRPORTS values ('IAD','30852');
insert into AIRPORTS values ('IAH','31453');
insert into AIRPORTS values ('IND','32337');
insert into AIRPORTS values ('JFK','31703');
insert into AIRPORTS values ('LAS','32211');
insert into AIRPORTS values ('LAX','32575');
insert into AIRPORTS values ('LGB','32575');
insert into AIRPORTS values ('LIH','32982');
insert into AIRPORTS values ('MCO','31454');
insert into AIRPORTS values ('MRY','34922');
insert into AIRPORTS values ('OAK','32457');
insert into AIRPORTS values ('OGG','33830');
insert into AIRPORTS values ('OMA','33316');
insert into AIRPORTS values ('ONT','32575');
insert into AIRPORTS values ('ORD','30977');
insert into AIRPORTS values ('PAE','34004');
insert into AIRPORTS values ('PDX','34057');
insert into AIRPORTS values ('PHX','30466');
insert into AIRPORTS values ('PIT','30198');
insert into AIRPORTS values ('RDU','34492');
insert into AIRPORTS values ('RNO','34570');
insert into AIRPORTS values ('SAN','33570');
insert into AIRPORTS values ('SAT','33214');
insert into AIRPORTS values ('SBP','34236');
insert into AIRPORTS values ('SEA','30559');
insert into AIRPORTS values ('SFO','32457');
insert into AIRPORTS values ('SJC','32457');
insert into AIRPORTS values ('SLC','34614');
insert into AIRPORTS values ('SMF','33192');
insert into AIRPORTS values ('SNA','32575');

--airline_symbol','airline_ID');
insert into AIRLINES values ('AA','19805');
insert into AIRLINES values ('AS','19930');
insert into AIRLINES values ('B6','20409');
insert into AIRLINES values ('DL','19790');
insert into AIRLINES values ('HA','19690');
insert into AIRLINES values ('NK','20416');
insert into AIRLINES values ('OO','20304');
insert into AIRLINES values ('UA','19977');
insert into AIRLINES values ('WN','19393');
insert into AIRLINES values ('YV','20378');

/*
OP_CARRIER_FL_NUM','FL_DATE','OP_UNIQUE_CARRIER','ORIGIN','DEST','CRS_DEP_TIME','DEP_TIME','DEP_DELAY','TAXI_OUT','WHEELS_OFF','WHEELS_ON','TAXI_IN','CRS_ARR_TIME','ARR_TIME','ARR_DELAY','CANCELLED','CANCELLATION_CODE','DIVERTED','DISTANCE');
*/
insert into FLIGHTS values ('3','2019-08-09','AA','JFK','LAX','1229','1237','8','20','1257','1518','5','1524','1523','-1','0',null,'0','2475');
insert into FLIGHTS values ('23','2019-08-22','HA','OAK','OGG','700','700','0','16','716','910','5','920','915','-5','0',null,'0','2349');
insert into FLIGHTS values ('64','2019-08-10','HA','LIH','LAX','1250','1256','6','12','1308','2119','15','2130','2134','4','0',null,'0','2615');
insert into FLIGHTS values ('117','2019-08-20','WN','OAK','RNO','1940','1952','12','7','1959','2032','3','2035','2035','0','0',null,'0','181');
insert into FLIGHTS values ('128','2019-08-17','DL','SEA','LAX','952','948','-4','22','1010','1209','9','1244','1218','-26','0',null,'0','954');
insert into FLIGHTS values ('129','2019-08-18','DL','LAX','SEA','1145','1139','-6','16','1155','1405','6','1436','1411','-25','0',null,'0','954');
insert into FLIGHTS values ('131','2019-08-25','B6','MCO','LAX','1251','1250','-1','18','1308','1442','6','1507','1448','-19','0',null,'0','2218');
insert into FLIGHTS values ('147','2019-08-19','B6','OAK','LGB','1058','1050','-8','8','1058','1201','5','1217','1206','-11','0',null,'0','353');
insert into FLIGHTS values ('188','2019-08-07','WN','SJC','SNA','1730','1726','-4','9','1735','1838','4','1850','1842','-8','0',null,'0','342');
insert into FLIGHTS values ('197','2019-08-12','WN','OAK','ONT','2100','2053','-7','9','2102','2204','3','2215','2207','-8','0',null,'0','362');
insert into FLIGHTS values ('205','2019-08-04','AA','LAX','OGG','1425','1425','0','14','1439','1647','4','1702','1651','-11','0',null,'0','2486');
insert into FLIGHTS values ('212','2019-08-21','WN','SNA','OAK','825','826','1','10','836','936','6','950','942','-8','0',null,'0','371');
insert into FLIGHTS values ('217','2019-08-10','NK','IAH','LAX','730',null,null,null,null,null,null,'855',null,null,'1','A','0','1379');
insert into FLIGHTS values ('251','2019-08-14','WN','LAS','BUR','1145','1211','26','9','1220','1301','3','1255','1304','9','0',null,'0','223');
insert into FLIGHTS values ('257','2019-08-16','UA','DEN','SFO','1915','1913','-2','38','1951','2051','32','2052','2123','31','0',null,'0','967');
insert into FLIGHTS values ('284','2019-08-14','DL','LAX','ATL','800','758','-2','15','813','1443','9','1521','1452','-29','0',null,'0','1947');
insert into FLIGHTS values ('351','2019-08-22','UA','SFO','SEA','2305','29','84','20','49','225','4','114','229','75','0',null,'0','679');
insert into FLIGHTS values ('373','2019-08-26','DL','ATL','ONT','826','823','-3','16','839','935','11','954','946','-8','0',null,'0','1900');
insert into FLIGHTS values ('383','2019-08-03','AS','SFO','PDX','900','919','19','26','945','1102','4','1050','1106','16','0',null,'0','550');
insert into FLIGHTS values ('410','2019-08-30','AS','LAX','JFK','715','709','-6','22','731','1527','9','1550','1536','-14','0',null,'0','2475');
insert into FLIGHTS values ('413','2019-08-26','UA','CLE','SFO','1916','1913','-3','14','1927','2126','13','2135','2139','4','0',null,'0','2161');
insert into FLIGHTS values ('440','2019-08-30','AA','SFO','DFW','700','705','5','26','731','1236','8','1241','1244','3','0',null,'0','1464');
insert into FLIGHTS values ('480','2019-08-13','AA','SAN','PHX','1859','1850','-9','26','1916','2008','7','2026','2015','-11','0',null,'0','304');
insert into FLIGHTS values ('503','2019-08-24','DL','LAX','IND','2225','2225','0','10','2235','518','6','525','524','-1','0',null,'0','1814');
insert into FLIGHTS values ('571','2019-08-23','WN','SLC','SMF','1320','1317','-3','8','1325','1339','4','1400','1343','-17','0',null,'0','532');
insert into FLIGHTS values ('610','2019-08-19','DL','JFK','SFO','1555','1552','-3','155','1827','2056','7','1952','2103','71','0',null,'0','2586');
insert into FLIGHTS values ('613','2019-08-05','DL','SFO','SLC','1852','1847','-5','25','1912','2128','9','2145','2137','-8','0',null,'0','599');
insert into FLIGHTS values ('658','2019-08-21','NK','LAX','PIT','2340','2339','-1','21','2400','707','4','717','711','-6','0',null,'0','2136');
insert into FLIGHTS values ('661','2019-08-07','UA','LAX','ORD','1645','1653','8','24','1717','2242','2','2248','2244','-4','0',null,'0','1744');
insert into FLIGHTS values ('703','2019-08-01','UA','EWR','LAX','845','934','49','37','1011','1207','6','1136','1213','37','0',null,'0','2454');
insert into FLIGHTS values ('720','2019-08-31','UA','SFO','DEN','1409','1405','-4','17','1422','1722','17','1749','1739','-10','0',null,'0','967');
insert into FLIGHTS values ('737','2019-08-15','UA','DEN','SFO','1710','1712','2','11','1723','1830','12','1854','1842','-12','0',null,'0','967');
insert into FLIGHTS values ('742','2019-08-02','WN','LAS','SAN','1830','1829','-1','21','1850','1937','2','1935','1939','4','0',null,'0','258');
insert into FLIGHTS values ('780','2019-08-15','WN','SEA','OAK','1110','1130','20','22','1152','1328','4','1320','1332','12','0',null,'0','672');
insert into FLIGHTS values ('814','2019-08-29','WN','DAL','SAN','1605','1605','0','19','1624','1659','5','1705','1704','-1','0',null,'0','1182');
insert into FLIGHTS values ('833','2019-08-06','WN','DAL','SAN','2030','2028','-2','7','2035','2105','5','2125','2110','-15','0',null,'0','1182');
insert into FLIGHTS values ('833','2019-08-30','WN','DAL','SAN','2030','2140','70','12','2152','2221','2','2125','2223','58','0',null,'0','1182');
insert into FLIGHTS values ('843','2019-08-25','UA','IAD','SFO','2215','2211','-4','14','2225','33','4','104','37','-27','0',null,'0','2419');
insert into FLIGHTS values ('846','2019-08-09','WN','SJC','PDX','1430','1424','-6','10','1434','1552','4','1615','1556','-19','0',null,'0','569');
insert into FLIGHTS values ('930','2019-08-06','WN','SJC','BOI','1015','1011','-4','11','1022','1230','2','1250','1232','-18','0',null,'0','523');
insert into FLIGHTS values ('948','2019-08-29','UA','SFO','DEN','835','831','-4','33','904','1206','6','1213','1212','-1','0',null,'0','967');
insert into FLIGHTS values ('989','2019-08-27','WN','SAN','OAK','2230','2222','-8','8','2230','2328','6','2355','2334','-21','0',null,'0','446');
insert into FLIGHTS values ('1120','2019-08-22','AS','SFO','SNA','1345','1400','15','17','1417','1522','6','1525','1528','3','0',null,'0','372');
insert into FLIGHTS values ('1133','2019-08-28','WN','LAX','SFO','2235','2227','-8','9','2236','2325','4','2355','2329','-26','0',null,'0','337');
insert into FLIGHTS values ('1143','2019-08-27','DL','SLC','SJC','1132','1125','-7','14','1139','1204','5','1229','1209','-20','0',null,'0','584');
insert into FLIGHTS values ('1284','2019-08-11','AA','DFW','FAT','1845','1845','0','12','1857','1945','4','2006','1949','-17','0',null,'0','1313');
insert into FLIGHTS values ('1295','2019-08-04','UA','LAX','LIH','903','855','-8','34','929','1148','7','1159','1155','-4','0',null,'0','2615');
insert into FLIGHTS values ('1325','2019-08-30','WN','SMF','SAN','1855','1854','-1','17','1911','2019','3','2020','2022','2','0',null,'0','480');
insert into FLIGHTS values ('1347','2019-08-15','AS','SJC','SEA','1025','1027','2','15','1042','1227','13','1235','1240','5','0',null,'0','696');
insert into FLIGHTS values ('1380','2019-08-14','AS','SEA','SAN','600','553','-7','29','622','837','12','850','849','-1','0',null,'0','1050');
insert into FLIGHTS values ('1394','2019-08-11','AA','IAH','LAX','1331','1327','-4','13','1340','1431','34','1458','1505','7','0',null,'0','1379');
insert into FLIGHTS values ('1575','2019-08-05','WN','SMF','SAN','1500','1501','1','8','1509','1620','2','1630','1622','-8','0',null,'0','480');
insert into FLIGHTS values ('1674','2019-08-24','AA','LAX','CLT','1121','1119','-2','12','1131','1848','12','1920','1900','-20','0',null,'0','2125');
insert into FLIGHTS values ('1676','2019-08-28','AA','RDU','LAX','1900','1929','29','13','1942','2127','8','2121','2135','14','0',null,'0','2239');
insert into FLIGHTS values ('1700','2019-08-20','UA','IAH','SFO','1639','1632','-7','30','1702','1837','5','1850','1842','-8','0',null,'0','1635');
insert into FLIGHTS values ('1746','2019-08-14','UA','LIH','SFO','2121','2113','-8','9','2122','504','3','526','507','-19','0',null,'0','2447');
insert into FLIGHTS values ('1781','2019-08-17','UA','IAH','SMF','1015','1013','-2','25','1038','1202','5','1210','1207','-3','0',null,'0','1609');
insert into FLIGHTS values ('1812','2019-08-26','AS','PDX','SFO','2045','2037','-8','16','2053','2216','5','2240','2221','-19','0',null,'0','550');
insert into FLIGHTS values ('1844','2019-08-12','UA','IAH','SFO','1946','1948','2','16','2004','2134','14','2146','2148','2','0',null,'0','1635');
insert into FLIGHTS values ('1900','2019-08-18','UA','SFO','SAN','1046','1043','-3','14','1057','1211','4','1231','1215','-16','0',null,'0','447');
insert into FLIGHTS values ('1911','2019-08-23','AS','LAS','SFO','1200','1152','-8','22','1214','1323','4','1340','1327','-13','0',null,'0','414');
insert into FLIGHTS values ('1919','2019-08-22','WN','OAK','SAN','1330','1328','-2','12','1340','1449','2','1505','1451','-14','0',null,'0','446');
insert into FLIGHTS values ('1925','2019-08-12','AS','LAX','SFO','630','624','-6','12','636','727','5','800','732','-28','0',null,'0','337');
insert into FLIGHTS values ('2002','2019-08-07','DL','SFO','SEA','1640','1714','34','19','1733','1905','8','1850','1913','23','0',null,'0','679');
insert into FLIGHTS values ('2036','2019-08-08','UA','SFO','PDX','2100','2142','42','19','2201','2313','4','2250','2317','27','0',null,'0','550');
insert into FLIGHTS values ('2038','2019-08-08','WN','SMF','LAX','625','623','-2','13','636','743','6','755','749','-6','0',null,'0','373');
insert into FLIGHTS values ('2048','2019-08-29','AA','PHX','SMF','2040','2034','-6','13','2047','2221','6','2240','2227','-13','0',null,'0','647');
insert into FLIGHTS values ('2121','2019-08-26','WN','OAK','SLC','2140','2147','7','11','2158','20','2','15','22','7','0',null,'0','588');
insert into FLIGHTS values ('2154','2019-08-23','UA','IAD','LAX','815','813','-2','15','828','1026','14','1041','1040','-1','0',null,'0','2288');
insert into FLIGHTS values ('2166','2019-08-09','UA','ORD','SFO','645','650','5','14','704','856','5','916','901','-15','0',null,'0','1846');
insert into FLIGHTS values ('2271','2019-08-31','WN','OAK','LGB','835','827','-8','14','841','942','6','955','948','-7','0',null,'0','353');
insert into FLIGHTS values ('2307','2019-08-02','AA','LAX','LAS','1400','1438','38','31','1509','1550','5','1515','1555','40','0',null,'0','236');
insert into FLIGHTS values ('2315','2019-08-16','WN','OAK','LAX','600','622','22','31','653','747','10','735','757','22','0',null,'0','337');
insert into FLIGHTS values ('2440','2019-08-19','WN','LAS','LAX','800','810','10','16','826','908','10','915','918','3','0',null,'0','236');
insert into FLIGHTS values ('2461','2019-08-01','WN','PHX','SJC','1850','1912','22','7','1919','2044','4','2040','2048','8','0',null,'0','621');
insert into FLIGHTS values ('2562','2019-08-13','DL','SLC','SMF','1125','1125','0','24','1149','1203','6','1209','1209','0','0',null,'0','532');
insert into FLIGHTS values ('2592','2019-08-05','WN','SAN','DEN','2115','2132','17','11','2143','32','5','30','37','7','0',null,'0','853');
insert into FLIGHTS values ('2653','2019-08-13','AA','FAT','DFW','601','600','-1','12','612','1051','11','1118','1102','-16','0',null,'0','1313');
insert into FLIGHTS values ('2680','2019-08-21','AA','ORD','SAN','1005','1120','75','18','1138','1330','5','1219','1335','76','0',null,'0','1723');
insert into FLIGHTS values ('2711','2019-08-25','WN','LAS','OAK','1620','1630','10','10','1640','1744','4','1755','1748','-7','0',null,'0','407');
insert into FLIGHTS values ('3053','2019-08-07','OO','SBP','PHX','612','746','94','18','804','915','5','757','920','83','0',null,'0','509');
insert into FLIGHTS values ('3139','2019-08-01','OO','FAT','LAX','1215','1210','-5','31','1241','1324','14','1329','1338','9','0',null,'0','209');
insert into FLIGHTS values ('3417','2019-08-05','OO','SAN','MRY','900','848','-12','37','925','1023','4','1025','1027','2','0',null,'0','375');
insert into FLIGHTS values ('4147','2019-08-17','WN','SMF','ONT','1055','1054','-1','8','1102','1201','3','1220','1204','-16','0',null,'0','390');
insert into FLIGHTS values ('4202','2019-08-24','WN','SAN','SJC','1120','1118','-2','9','1127','1223','14','1250','1237','-13','0',null,'0','417');
insert into FLIGHTS values ('4223','2019-08-18','WN','PDX','SJC','1930','1925','-5','10','1935','2059','4','2110','2103','-7','0',null,'0','569');
insert into FLIGHTS values ('4749','2019-08-18','OO','ONT','SLC','1835','1829','-6','12','1841','2059','6','2116','2105','-11','0',null,'0','558');
insert into FLIGHTS values ('4785','2019-08-03','WN','SLC','SJC','640','636','-4','8','644','712','8','735','720','-15','0',null,'0','584');
insert into FLIGHTS values ('5057','2019-08-04','WN','SNA','OAK','1635','1656','21','10','1706','1800','3','1755','1803','8','0',null,'0','371');
insert into FLIGHTS values ('5104','2019-08-10','WN','LAX','BWI','1505','1504','-1','13','1517','2236','2','2305','2238','-27','0',null,'0','2329');
insert into FLIGHTS values ('5216','2019-08-20','OO','SFO','OMA','1833','1833','0','19','1852','2355','4','2359','2359','0','0',null,'0','1433');
insert into FLIGHTS values ('5277','2019-08-03','WN','LAX','SMF','955','954','-1','8','1002','1059','18','1120','1117','-3','0',null,'0','373');
insert into FLIGHTS values ('5309','2019-08-27','OO','SAT','SFO','630','639','9','13','652','755','44','820','839','19','0',null,'0','1482');
insert into FLIGHTS values ('5392','2019-08-28','OO','RNO','LAX','1452','1501','9','26','1527','1635','9','1640','1644','4','0',null,'0','391');
insert into FLIGHTS values ('5408','2019-08-08','OO','LAX','AUS','930','920','-10','23','943','1424','6','1447','1430','-17','0',null,'0','1242');
insert into FLIGHTS values ('5552','2019-08-06','OO','BUR','DEN','1132','1131','-1','9','1140','1436','12','1500','1448','-12','0',null,'0','850');
insert into FLIGHTS values ('5756','2019-08-11','OO','SBP','SFO','1750','1740','-10','13','1753','1832','4','1851','1836','-15','0',null,'0','190');
insert into FLIGHTS values ('5757','2019-08-11','YV','PHX','MRY','955','1011','16','24','1035','1159','1','1146','1200','14','0',null,'0','598');
insert into FLIGHTS values ('5880','2019-08-02','OO','SFO','PAE','1302','1304','2','29','1333','1512','5','1519','1517','-2','0',null,'0','710');
insert into FLIGHTS values ('5976','2019-08-16','OO','SLC','SFO','600','554','-6','17','611','706','6','705','712','7','0',null,'0','599');
