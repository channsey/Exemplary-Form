-- Drop all tables in the correct dependency order
-- since (1) SQLite doesn't support cascade in drop table
-- and (2) PostgreSQL won't drop a table if it would violate
-- foreign key constraints.

drop table if exists One;
drop table if exists Two;
drop table if exists Three;
drop table if exists Four;
drop table if exists Five;
drop table if exists Six;

create table One (
  A varchar(10),
  B varchar(2),
  D integer(4),
  E integer(5),
  I integer(5),
  J integer(7),
  K integer(5),
  L varchar(3),
  M integer(4),
  N integer(4),
  O integer(2),
  P integer(2),
  Q integer(4),
  R integer(4),
  S integer(2),
  T integer(4),
  W integer(1),
  X varchar(1),
  Y integer(0),
  Z integer(4),
  primary key (D)
);

create table Two (
  B varchar(2),
  C integer(5),
  primary key (C)
  foreign key (B) references One (B)
    on delete cascade
);

create table Three (
  E integer(5),
  F integer(7),
  primary key (F)
  foreign key (E) references One (E)
    on delete cascade
);

create table Four (
  F integer(7),
  G integer(5),
  H varchar(3),
  foreign key (F) references Three (F)
    on delete cascade
);

create table Five (
  V integer(2),
  X varchar(1),
  foreign key (X) references One (X)
    on delete cascade
);

create table Six (
  R integer(4),
  S integer(2),
  U integer(4),
  foreign key (R, S) references One (R, S)
    on delete cascade
);

insert into One values ('2019-08-01','OO',3139,11638,12892,1289208,32575,'LAX',1215,1210,-5,31,1241,1324,14,1329,0,null,0,209);
insert into One values ('2019-08-01','WN',2461,14107,14831,1483106,32457,'SJC',1850,1912,22,7,1919,2044,4,2040,0,null,0,621);
insert into One values ('2019-08-01','UA',703,11618,12892,1289208,32575,'LAX',845,934,49,37,1011,1207,6,1136,0,null,0,2454);
insert into One values ('2019-08-02','AA',2307,12892,12889,1288903,32211,'LAS',1400,1438,38,31,1509,1550,5,1515,0,null,0,236);
insert into One values ('2019-08-02','WN',742,12889,14679,1467903,33570,'SAN',1830,1829,-1,21,1850,1937,2,1935,0,null,0,258);
insert into One values ('2019-08-02','OO',5880,14771,14004,1400402,34004,'PAE',1302,1304,2,29,1333,1512,5,1519,0,null,0,710);
insert into One values ('2019-08-03','AS',383,14771,14057,1405702,34057,'PDX',900,919,19,26,945,1102,4,1050,0,null,0,550);
insert into One values ('2019-08-03','WN',4785,14869,14831,1483106,32457,'SJC',640,636,-4,8,644,712,8,735,0,null,0,584);
insert into One values ('2019-08-03','WN',5277,12892,14893,1489302,33192,'SMF',955,954,-1,8,1002,1059,18,1120,0,null,0,373);
insert into One values ('2019-08-04','UA',1295,12892,12982,1298202,32982,'LIH',903,855,-8,34,929,1148,7,1159,0,null,0,2615);
insert into One values ('2019-08-04','AA',205,12892,13830,1383002,33830,'OGG',1425,1425,0,14,1439,1647,4,1702,0,null,0,2486);
insert into One values ('2019-08-04','WN',5057,14908,13796,1379608,32457,'OAK',1635,1656,21,10,1706,1800,3,1755,0,null,0,371);
insert into One values ('2019-08-05','DL',613,14771,14869,1486903,34614,'SLC',1852,1847,-5,25,1912,2128,9,2145,0,null,0,599);
insert into One values ('2019-08-05','WN',1575,14893,14679,1467903,33570,'SAN',1500,1501,1,8,1509,1620,2,1630,0,null,0,480);
insert into One values ('2019-08-05','WN',2592,14679,11292,1129202,30325,'DEN',2115,2132,17,11,2143,32,5,30,0,null,0,853);
insert into One values ('2019-08-05','OO',3417,14679,13476,1347605,34922,'MRY',900,848,-12,37,925,1023,4,1025,0,null,0,375);
insert into One values ('2019-08-06','WN',930,14831,10713,1071302,30713,'BOI',1015,1011,-4,11,1022,1230,2,1250,0,null,0,523);
insert into One values ('2019-08-06','OO',5552,10800,11292,1129202,30325,'DEN',1132,1131,-1,9,1140,1436,12,1500,0,null,0,850);
insert into One values ('2019-08-06','WN',833,11259,14679,1467903,33570,'SAN',2030,2028,-2,7,2035,2105,5,2125,0,null,0,1182);
insert into One values ('2019-08-07','DL',2002,14771,14747,1474703,30559,'SEA',1640,1714,34,19,1733,1905,8,1850,0,null,0,679);
insert into One values ('2019-08-07','UA',661,12892,13930,1393007,30977,'ORD',1645,1653,8,24,1717,2242,2,2248,0,null,0,1744);
insert into One values ('2019-08-07','WN',188,14831,14908,1490803,32575,'SNA',1730,1726,-4,9,1735,1838,4,1850,0,null,0,342);
insert into One values ('2019-08-07','OO',3053,14698,14107,1410702,30466,'PHX',612,746,94,18,804,915,5,757,0,null,0,509);
insert into One values ('2019-08-08','WN',2038,14893,12892,1289208,32575,'LAX',625,623,-2,13,636,743,6,755,0,null,0,373);
insert into One values ('2019-08-08','UA',2036,14771,14057,1405702,34057,'PDX',2100,2142,42,19,2201,2313,4,2250,0,null,0,550);
insert into One values ('2019-08-08','OO',5408,12892,10423,1042302,30423,'AUS',930,920,-10,23,943,1424,6,1447,0,null,0,1242);
insert into One values ('2019-08-09','UA',2166,13930,14771,1477104,32457,'SFO',645,650,5,14,704,856,5,916,0,null,0,1846);
insert into One values ('2019-08-09','AA',3,12478,12892,1289208,32575,'LAX',1229,1237,8,20,1257,1518,5,1524,0,null,0,2475);
insert into One values ('2019-08-09','WN',846,14831,14057,1405702,34057,'PDX',1430,1424,-6,10,1434,1552,4,1615,0,null,0,569);
insert into One values ('2019-08-10','HA',64,12982,12892,1289208,32575,'LAX',1250,1256,6,12,1308,2119,15,2130,0,null,0,2615);
insert into One values ('2019-08-10','WN',5104,12892,10821,1082106,30852,'BWI',1505,1504,-1,13,1517,2236,2,2305,0,null,0,2329);
insert into One values ('2019-08-10','NK',217,12266,12892,1289208,32575,'LAX',730,null,null,null,null,null,null,855,1,'A',0,1379);
insert into One values ('2019-08-11','YV',5757,14107,13476,1347605,34922,'MRY',955,1011,16,24,1035,1159,1,1146,0,null,0,598);
insert into One values ('2019-08-11','AA',1284,11298,11638,1163807,31638,'FAT',1845,1845,0,12,1857,1945,4,2006,0,null,0,1313);
insert into One values ('2019-08-11','AA',1394,12266,12892,1289208,32575,'LAX',1331,1327,-4,13,1340,1431,34,1458,0,null,0,1379);
insert into One values ('2019-08-11','OO',5756,14698,14771,1477104,32457,'SFO',1750,1740,-10,13,1753,1832,4,1851,0,null,0,190);
insert into One values ('2019-08-12','AS',1925,12892,14771,1477104,32457,'SFO',630,624,-6,12,636,727,5,800,0,null,0,337);
insert into One values ('2019-08-12','WN',197,13796,13891,1389101,32575,'ONT',2100,2053,-7,9,2102,2204,3,2215,0,null,0,362);
insert into One values ('2019-08-12','UA',1844,12266,14771,1477104,32457,'SFO',1946,1948,2,16,2004,2134,14,2146,0,null,0,1635);
insert into One values ('2019-08-13','AA',480,14679,14107,1410702,30466,'PHX',1859,1850,-9,26,1916,2008,7,2026,0,null,0,304);
insert into One values ('2019-08-13','AA',2653,11638,11298,1129806,30194,'DFW',601,600,-1,12,612,1051,11,1118,0,null,0,1313);
insert into One values ('2019-08-13','DL',2562,14869,14893,1489302,33192,'SMF',1125,1125,0,24,1149,1203,6,1209,0,null,0,532);
insert into One values ('2019-08-14','WN',251,12889,10800,1080003,32575,'BUR',1145,1211,26,9,1220,1301,3,1255,0,null,0,223);
insert into One values ('2019-08-14','UA',1746,12982,14771,1477104,32457,'SFO',2121,2113,-8,9,2122,504,3,526,0,null,0,2447);
insert into One values ('2019-08-14','AS',1380,14747,14679,1467903,33570,'SAN',600,553,-7,29,622,837,12,850,0,null,0,1050);
insert into One values ('2019-08-14','DL',284,12892,10397,1039707,30397,'ATL',800,758,-2,15,813,1443,9,1521,0,null,0,1947);
insert into One values ('2019-08-15','WN',780,14747,13796,1379608,32457,'OAK',1110,1130,20,22,1152,1328,4,1320,0,null,0,672);
insert into One values ('2019-08-15','UA',737,11292,14771,1477104,32457,'SFO',1710,1712,2,11,1723,1830,12,1854,0,null,0,967);
insert into One values ('2019-08-15','AS',1347,14831,14747,1474703,30559,'SEA',1025,1027,2,15,1042,1227,13,1235,0,null,0,696);
insert into One values ('2019-08-16','WN',2315,13796,12892,1289208,32575,'LAX',600,622,22,31,653,747,10,735,0,null,0,337);
insert into One values ('2019-08-16','UA',257,11292,14771,1477104,32457,'SFO',1915,1913,-2,38,1951,2051,32,2052,0,null,0,967);
insert into One values ('2019-08-16','OO',5976,14869,14771,1477104,32457,'SFO',600,554,-6,17,611,706,6,705,0,null,0,599);
insert into One values ('2019-08-17','DL',128,14747,12892,1289208,32575,'LAX',952,948,-4,22,1010,1209,9,1244,0,null,0,954);
insert into One values ('2019-08-17','UA',1781,12266,14893,1489302,33192,'SMF',1015,1013,-2,25,1038,1202,5,1210,0,null,0,1609);
insert into One values ('2019-08-17','WN',4147,14893,13891,1389101,32575,'ONT',1055,1054,-1,8,1102,1201,3,1220,0,null,0,390);
insert into One values ('2019-08-18','UA',1900,14771,14679,1467903,33570,'SAN',1046,1043,-3,14,1057,1211,4,1231,0,null,0,447);
insert into One values ('2019-08-18','WN',4223,14057,14831,1483106,32457,'SJC',1930,1925,-5,10,1935,2059,4,2110,0,null,0,569);
insert into One values ('2019-08-18','OO',4749,13891,14869,1486903,34614,'SLC',1835,1829,-6,12,1841,2059,6,2116,0,null,0,558);
insert into One values ('2019-08-18','DL',129,12892,14747,1474703,30559,'SEA',1145,1139,-6,16,1155,1405,6,1436,0,null,0,954);
insert into One values ('2019-08-19','B6',147,13796,12954,1295407,32575,'LGB',1058,1050,-8,8,1058,1201,5,1217,0,null,0,353);
insert into One values ('2019-08-19','WN',2440,12889,12892,1289208,32575,'LAX',800,810,10,16,826,908,10,915,0,null,0,236);
insert into One values ('2019-08-19','DL',610,12478,14771,1477104,32457,'SFO',1555,1552,-3,155,1827,2056,7,1952,0,null,0,2586);
insert into One values ('2019-08-20','WN',117,13796,14570,1457002,34570,'RNO',1940,1952,12,7,1959,2032,3,2035,0,null,0,181);
insert into One values ('2019-08-20','OO',5216,14771,13871,1387102,33316,'OMA',1833,1833,0,19,1852,2355,4,2359,0,null,0,1433);
insert into One values ('2019-08-20','UA',1700,12266,14771,1477104,32457,'SFO',1639,1632,-7,30,1702,1837,5,1850,0,null,0,1635);
insert into One values ('2019-08-21','NK',658,12892,14122,1412202,30198,'PIT',2340,2339,-1,21,2400,707,4,717,0,null,0,2136);
insert into One values ('2019-08-21','AA',2680,13930,14679,1467903,33570,'SAN',1005,1120,75,18,1138,1330,5,1219,0,null,0,1723);
insert into One values ('2019-08-21','WN',212,14908,13796,1379608,32457,'OAK',825,826,1,10,836,936,6,950,0,null,0,371);
insert into One values ('2019-08-22','HA',23,13796,13830,1383002,33830,'OGG',700,700,0,16,716,910,5,920,0,null,0,2349);
insert into One values ('2019-08-22','AS',1120,14771,14908,1490803,32575,'SNA',1345,1400,15,17,1417,1522,6,1525,0,null,0,372);
insert into One values ('2019-08-22','WN',1919,13796,14679,1467903,33570,'SAN',1330,1328,-2,12,1340,1449,2,1505,0,null,0,446);
insert into One values ('2019-08-22','UA',351,14771,14747,1474703,30559,'SEA',2305,29,84,20,49,225,4,114,0,null,0,679);
insert into One values ('2019-08-23','AS',1911,12889,14771,1477104,32457,'SFO',1200,1152,-8,22,1214,1323,4,1340,0,null,0,414);
insert into One values ('2019-08-23','UA',2154,12264,12892,1289208,32575,'LAX',815,813,-2,15,828,1026,14,1041,0,null,0,2288);
insert into One values ('2019-08-23','WN',571,14869,14893,1489302,33192,'SMF',1320,1317,-3,8,1325,1339,4,1400,0,null,0,532);
insert into One values ('2019-08-24','AA',1674,12892,11057,1105703,31057,'CLT',1121,1119,-2,12,1131,1848,12,1920,0,null,0,2125);
insert into One values ('2019-08-24','WN',4202,14679,14831,1483106,32457,'SJC',1120,1118,-2,9,1127,1223,14,1250,0,null,0,417);
insert into One values ('2019-08-24','DL',503,12892,12339,1233904,32337,'IND',2225,2225,0,10,2235,518,6,525,0,null,0,1814);
insert into One values ('2019-08-25','WN',2711,12889,13796,1379608,32457,'OAK',1620,1630,10,10,1640,1744,4,1755,0,null,0,407);
insert into One values ('2019-08-25','UA',843,12264,14771,1477104,32457,'SFO',2215,2211,-4,14,2225,33,4,104,0,null,0,2419);
insert into One values ('2019-08-25','B6',131,13204,12892,1289208,32575,'LAX',1251,1250,-1,18,1308,1442,6,1507,0,null,0,2218);
insert into One values ('2019-08-26','DL',373,10397,13891,1389101,32575,'ONT',826,823,-3,16,839,935,11,954,0,null,0,1900);
insert into One values ('2019-08-26','WN',2121,13796,14869,1486903,34614,'SLC',2140,2147,7,11,2158,20,2,15,0,null,0,588);
insert into One values ('2019-08-26','UA',413,11042,14771,1477104,32457,'SFO',1916,1913,-3,14,1927,2126,13,2135,0,null,0,2161);
insert into One values ('2019-08-26','AS',1812,14057,14771,1477104,32457,'SFO',2045,2037,-8,16,2053,2216,5,2240,0,null,0,550);
insert into One values ('2019-08-27','WN',989,14679,13796,1379608,32457,'OAK',2230,2222,-8,8,2230,2328,6,2355,0,null,0,446);
insert into One values ('2019-08-27','OO',5309,14683,14771,1477104,32457,'SFO',630,639,9,13,652,755,44,820,0,null,0,1482);
insert into One values ('2019-08-27','DL',1143,14869,14831,1483106,32457,'SJC',1132,1125,-7,14,1139,1204,5,1229,0,null,0,584);
insert into One values ('2019-08-28','AA',1676,14492,12892,1289208,32575,'LAX',1900,1929,29,13,1942,2127,8,2121,0,null,0,2239);
insert into One values ('2019-08-28','WN',1133,12892,14771,1477104,32457,'SFO',2235,2227,-8,9,2236,2325,4,2355,0,null,0,337);
insert into One values ('2019-08-28','OO',5392,14570,12892,1289208,32575,'LAX',1452,1501,9,26,1527,1635,9,1640,0,null,0,391);
insert into One values ('2019-08-29','WN',814,11259,14679,1467903,33570,'SAN',1605,1605,0,19,1624,1659,5,1705,0,null,0,1182);
insert into One values ('2019-08-29','AA',2048,14107,14893,1489302,33192,'SMF',2040,2034,-6,13,2047,2221,6,2240,0,null,0,647);
insert into One values ('2019-08-29','UA',948,14771,11292,1129202,30325,'DEN',835,831,-4,33,904,1206,6,1213,0,null,0,967);
insert into One values ('2019-08-30','WN',833,11259,14679,1467903,33570,'SAN',2030,2140,70,12,2152,2221,2,2125,0,null,0,1182);
insert into One values ('2019-08-30','WN',1325,14893,14679,1467903,33570,'SAN',1855,1854,-1,17,1911,2019,3,2020,0,null,0,480);
insert into One values ('2019-08-30','AA',440,14771,11298,1129806,30194,'DFW',700,705,5,26,731,1236,8,1241,0,null,0,1464);
insert into One values ('2019-08-30','AS',410,12892,12478,1247805,31703,'JFK',715,709,-6,22,731,1527,9,1550,0,null,0,2475);
insert into One values ('2019-08-31','WN',2271,13796,12954,1295407,32575,'LGB',835,827,-8,14,841,942,6,955,0,null,0,353);
insert into One values ('2019-08-31','UA',720,14771,11292,1129202,30325,'DEN',1409,1405,-4,17,1422,1722,17,1749,0,null,0,967);

insert into Two values ('OO',20304);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AA',19805);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('AS',19930);
insert into Two values ('WN',19393);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AA',19805);
insert into Two values ('WN',19393);
insert into Two values ('DL',19790);
insert into Two values ('WN',19393);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('WN',19393);
insert into Two values ('DL',19790);
insert into Two values ('UA',19977);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('OO',20304);
insert into Two values ('UA',19977);
insert into Two values ('AA',19805);
insert into Two values ('WN',19393);
insert into Two values ('HA',19690);
insert into Two values ('WN',19393);
insert into Two values ('NK',20416);
insert into Two values ('YV',20378);
insert into Two values ('AA',19805);
insert into Two values ('AA',19805);
insert into Two values ('OO',20304);
insert into Two values ('AS',19930);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AA',19805);
insert into Two values ('AA',19805);
insert into Two values ('DL',19790);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AS',19930);
insert into Two values ('DL',19790);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AS',19930);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('OO',20304);
insert into Two values ('DL',19790);
insert into Two values ('UA',19977);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('DL',19790);
insert into Two values ('B6',20409);
insert into Two values ('WN',19393);
insert into Two values ('DL',19790);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('UA',19977);
insert into Two values ('NK',20416);
insert into Two values ('AA',19805);
insert into Two values ('WN',19393);
insert into Two values ('HA',19690);
insert into Two values ('AS',19930);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AS',19930);
insert into Two values ('UA',19977);
insert into Two values ('WN',19393);
insert into Two values ('AA',19805);
insert into Two values ('WN',19393);
insert into Two values ('DL',19790);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('B6',20409);
insert into Two values ('DL',19790);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);
insert into Two values ('AS',19930);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('DL',19790);
insert into Two values ('AA',19805);
insert into Two values ('WN',19393);
insert into Two values ('OO',20304);
insert into Two values ('WN',19393);
insert into Two values ('AA',19805);
insert into Two values ('UA',19977);
insert into Two values ('WN',19393);
insert into Two values ('WN',19393);
insert into Two values ('AA',19805);
insert into Two values ('AS',19930);
insert into Two values ('WN',19393);
insert into Two values ('UA',19977);

insert into Three values (11638,1163807);
insert into Three values (14107,1410702);
insert into Three values (11618,1161802);
insert into Three values (12892,1289208);
insert into Three values (12889,1288903);
insert into Three values (14771,1477104);
insert into Three values (14771,1477104);
insert into Three values (14869,1486903);
insert into Three values (12892,1289208);
insert into Three values (12892,1289208);
insert into Three values (12892,1289208);
insert into Three values (14908,1490803);
insert into Three values (14771,1477104);
insert into Three values (14893,1489302);
insert into Three values (14679,1467903);
insert into Three values (14679,1467903);
insert into Three values (14831,1483106);
insert into Three values (10800,1080003);
insert into Three values (11259,1125904);
insert into Three values (14771,1477104);
insert into Three values (12892,1289208);
insert into Three values (14831,1483106);
insert into Three values (14698,1469802);
insert into Three values (14893,1489302);
insert into Three values (14771,1477104);
insert into Three values (12892,1289208);
insert into Three values (13930,1393007);
insert into Three values (12478,1247805);
insert into Three values (14831,1483106);
insert into Three values (12982,1298202);
insert into Three values (12892,1289208);
insert into Three values (12266,1226603);
insert into Three values (14107,1410702);
insert into Three values (11298,1129806);
insert into Three values (12266,1226603);
insert into Three values (14698,1469802);
insert into Three values (12892,1289208);
insert into Three values (13796,1379608);
insert into Three values (12266,1226603);
insert into Three values (14679,1467903);
insert into Three values (11638,1163807);
insert into Three values (14869,1486903);
insert into Three values (12889,1288903);
insert into Three values (12982,1298202);
insert into Three values (14747,1474703);
insert into Three values (12892,1289208);
insert into Three values (14747,1474703);
insert into Three values (11292,1129202);
insert into Three values (14831,1483106);
insert into Three values (13796,1379608);
insert into Three values (11292,1129202);
insert into Three values (14869,1486903);
insert into Three values (14747,1474703);
insert into Three values (12266,1226603);
insert into Three values (14893,1489302);
insert into Three values (14771,1477104);
insert into Three values (14057,1405702);
insert into Three values (13891,1389101);
insert into Three values (12892,1289208);
insert into Three values (13796,1379608);
insert into Three values (12889,1288903);
insert into Three values (12478,1247805);
insert into Three values (13796,1379608);
insert into Three values (14771,1477104);
insert into Three values (12266,1226603);
insert into Three values (12892,1289208);
insert into Three values (13930,1393007);
insert into Three values (14908,1490803);
insert into Three values (13796,1379608);
insert into Three values (14771,1477104);
insert into Three values (13796,1379608);
insert into Three values (14771,1477104);
insert into Three values (12889,1288903);
insert into Three values (12264,1226402);
insert into Three values (14869,1486903);
insert into Three values (12892,1289208);
insert into Three values (14679,1467903);
insert into Three values (12892,1289208);
insert into Three values (12889,1288903);
insert into Three values (12264,1226402);
insert into Three values (13204,1320402);
insert into Three values (10397,1039707);
insert into Three values (13796,1379608);
insert into Three values (11042,1104205);
insert into Three values (14057,1405702);
insert into Three values (14679,1467903);
insert into Three values (14683,1468305);
insert into Three values (14869,1486903);
insert into Three values (14492,1449202);
insert into Three values (12892,1289208);
insert into Three values (14570,1457002);
insert into Three values (11259,1125904);
insert into Three values (14107,1410702);
insert into Three values (14771,1477104);
insert into Three values (11259,1125904);
insert into Three values (14893,1489302);
insert into Three values (14771,1477104);
insert into Three values (12892,1289208);
insert into Three values (13796,1379608);
insert into Three values (14771,1477104);

insert into Four values (1163807,31638,'FAT');
insert into Four values (1410702,30466,'PHX');
insert into Four values (1161802,31703,'EWR');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1288903,32211,'LAS');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1486903,34614,'SLC');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1490803,32575,'SNA');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1489302,33192,'SMF');
insert into Four values (1467903,33570,'SAN');
insert into Four values (1467903,33570,'SAN');
insert into Four values (1483106,32457,'SJC');
insert into Four values (1080003,32575,'BUR');
insert into Four values (1125904,30194,'DAL');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1483106,32457,'SJC');
insert into Four values (1469802,34236,'SBP');
insert into Four values (1489302,33192,'SMF');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1393007,30977,'ORD');
insert into Four values (1247805,31703,'JFK');
insert into Four values (1483106,32457,'SJC');
insert into Four values (1298202,32982,'LIH');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1226603,31453,'IAH');
insert into Four values (1410702,30466,'PHX');
insert into Four values (1129806,30194,'DFW');
insert into Four values (1226603,31453,'IAH');
insert into Four values (1469802,34236,'SBP');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1226603,31453,'IAH');
insert into Four values (1467903,33570,'SAN');
insert into Four values (1163807,31638,'FAT');
insert into Four values (1486903,34614,'SLC');
insert into Four values (1288903,32211,'LAS');
insert into Four values (1298202,32982,'LIH');
insert into Four values (1474703,30559,'SEA');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1474703,30559,'SEA');
insert into Four values (1129202,30325,'DEN');
insert into Four values (1483106,32457,'SJC');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1129202,30325,'DEN');
insert into Four values (1486903,34614,'SLC');
insert into Four values (1474703,30559,'SEA');
insert into Four values (1226603,31453,'IAH');
insert into Four values (1489302,33192,'SMF');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1405702,34057,'PDX');
insert into Four values (1389101,32575,'ONT');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1288903,32211,'LAS');
insert into Four values (1247805,31703,'JFK');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1226603,31453,'IAH');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1393007,30977,'ORD');
insert into Four values (1490803,32575,'SNA');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1288903,32211,'LAS');
insert into Four values (1226402,30852,'IAD');
insert into Four values (1486903,34614,'SLC');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1467903,33570,'SAN');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1288903,32211,'LAS');
insert into Four values (1226402,30852,'IAD');
insert into Four values (1320402,31454,'MCO');
insert into Four values (1039707,30397,'ATL');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1104205,30647,'CLE');
insert into Four values (1405702,34057,'PDX');
insert into Four values (1467903,33570,'SAN');
insert into Four values (1468305,33214,'SAT');
insert into Four values (1486903,34614,'SLC');
insert into Four values (1449202,34492,'RDU');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1457002,34570,'RNO');
insert into Four values (1125904,30194,'DAL');
insert into Four values (1410702,30466,'PHX');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1125904,30194,'DAL');
insert into Four values (1489302,33192,'SMF');
insert into Four values (1477104,32457,'SFO');
insert into Four values (1289208,32575,'LAX');
insert into Four values (1379608,32457,'OAK');
insert into Four values (1477104,32457,'SFO');

insert into Five values (9,);
insert into Five values (8,);
insert into Five values (37,);
insert into Five values (40,);
insert into Five values (4,);
insert into Five values (-2,);
insert into Five values (16,);
insert into Five values (-15,);
insert into Five values (-3,);
insert into Five values (-4,);
insert into Five values (-11,);
insert into Five values (8,);
insert into Five values (-8,);
insert into Five values (-8,);
insert into Five values (7,);
insert into Five values (2,);
insert into Five values (-18,);
insert into Five values (-12,);
insert into Five values (-15,);
insert into Five values (23,);
insert into Five values (-4,);
insert into Five values (-8,);
insert into Five values (83,);
insert into Five values (-6,);
insert into Five values (27,);
insert into Five values (-17,);
insert into Five values (-15,);
insert into Five values (-1,);
insert into Five values (-19,);
insert into Five values (4,);
insert into Five values (-27,);
insert into Five values (,'A');
insert into Five values (14,);
insert into Five values (-17,);
insert into Five values (7,);
insert into Five values (-15,);
insert into Five values (-28,);
insert into Five values (-8,);
insert into Five values (2,);
insert into Five values (-11,);
insert into Five values (-16,);
insert into Five values (0,);
insert into Five values (9,);
insert into Five values (-19,);
insert into Five values (-1,);
insert into Five values (-29,);
insert into Five values (12,);
insert into Five values (-12,);
insert into Five values (5,);
insert into Five values (22,);
insert into Five values (31,);
insert into Five values (7,);
insert into Five values (-26,);
insert into Five values (-3,);
insert into Five values (-16,);
insert into Five values (-16,);
insert into Five values (-7,);
insert into Five values (-11,);
insert into Five values (-25,);
insert into Five values (-11,);
insert into Five values (3,);
insert into Five values (71,);
insert into Five values (0,);
insert into Five values (0,);
insert into Five values (-8,);
insert into Five values (-6,);
insert into Five values (76,);
insert into Five values (-8,);
insert into Five values (-5,);
insert into Five values (3,);
insert into Five values (-14,);
insert into Five values (75,);
insert into Five values (-13,);
insert into Five values (-1,);
insert into Five values (-17,);
insert into Five values (-20,);
insert into Five values (-13,);
insert into Five values (-1,);
insert into Five values (-7,);
insert into Five values (-27,);
insert into Five values (-19,);
insert into Five values (-8,);
insert into Five values (7,);
insert into Five values (4,);
insert into Five values (-19,);
insert into Five values (-21,);
insert into Five values (19,);
insert into Five values (-20,);
insert into Five values (14,);
insert into Five values (-26,);
insert into Five values (4,);
insert into Five values (-1,);
insert into Five values (-13,);
insert into Five values (-1,);
insert into Five values (58,);
insert into Five values (2,);
insert into Five values (3,);
insert into Five values (-14,);
insert into Five values (-7,);
insert into Five values (-10,);

insert into Six values (1324,14,1338);
insert into Six values (2044,4,2048);
insert into Six values (1207,6,1213);
insert into Six values (1550,5,1555);
insert into Six values (1937,2,1939);
insert into Six values (1512,5,1517);
insert into Six values (1102,4,1106);
insert into Six values (712,8,720);
insert into Six values (1059,18,1117);
insert into Six values (1148,7,1155);
insert into Six values (1647,4,1651);
insert into Six values (1800,3,1803);
insert into Six values (2128,9,2137);
insert into Six values (1620,2,1622);
insert into Six values (32,5,37);
insert into Six values (1023,4,1027);
insert into Six values (1230,2,1232);
insert into Six values (1436,12,1448);
insert into Six values (2105,5,2110);
insert into Six values (1905,8,1913);
insert into Six values (2242,2,2244);
insert into Six values (1838,4,1842);
insert into Six values (915,5,920);
insert into Six values (743,6,749);
insert into Six values (2313,4,2317);
insert into Six values (1424,6,1430);
insert into Six values (856,5,901);
insert into Six values (1518,5,1523);
insert into Six values (1552,4,1556);
insert into Six values (2119,15,2134);
insert into Six values (2236,2,2238);
insert into Six values (,null,);
insert into Six values (1159,1,1200);
insert into Six values (1945,4,1949);
insert into Six values (1431,34,1505);
insert into Six values (1832,4,1836);
insert into Six values (727,5,732);
insert into Six values (2204,3,2207);
insert into Six values (2134,14,2148);
insert into Six values (2008,7,2015);
insert into Six values (1051,11,1102);
insert into Six values (1203,6,1209);
insert into Six values (1301,3,1304);
insert into Six values (504,3,507);
insert into Six values (837,12,849);
insert into Six values (1443,9,1452);
insert into Six values (1328,4,1332);
insert into Six values (1830,12,1842);
insert into Six values (1227,13,1240);
insert into Six values (747,10,757);
insert into Six values (2051,32,2123);
insert into Six values (706,6,712);
insert into Six values (1209,9,1218);
insert into Six values (1202,5,1207);
insert into Six values (1201,3,1204);
insert into Six values (1211,4,1215);
insert into Six values (2059,4,2103);
insert into Six values (2059,6,2105);
insert into Six values (1405,6,1411);
insert into Six values (1201,5,1206);
insert into Six values (908,10,918);
insert into Six values (2056,7,2103);
insert into Six values (2032,3,2035);
insert into Six values (2355,4,2359);
insert into Six values (1837,5,1842);
insert into Six values (707,4,711);
insert into Six values (1330,5,1335);
insert into Six values (936,6,942);
insert into Six values (910,5,915);
insert into Six values (1522,6,1528);
insert into Six values (1449,2,1451);
insert into Six values (225,4,229);
insert into Six values (1323,4,1327);
insert into Six values (1026,14,1040);
insert into Six values (1339,4,1343);
insert into Six values (1848,12,1900);
insert into Six values (1223,14,1237);
insert into Six values (518,6,524);
insert into Six values (1744,4,1748);
insert into Six values (33,4,37);
insert into Six values (1442,6,1448);
insert into Six values (935,11,946);
insert into Six values (20,2,22);
insert into Six values (2126,13,2139);
insert into Six values (2216,5,2221);
insert into Six values (2328,6,2334);
insert into Six values (755,44,839);
insert into Six values (1204,5,1209);
insert into Six values (2127,8,2135);
insert into Six values (2325,4,2329);
insert into Six values (1635,9,1644);
insert into Six values (1659,5,1704);
insert into Six values (2221,6,2227);
insert into Six values (1206,6,1212);
insert into Six values (2221,2,2223);
insert into Six values (2019,3,2022);
insert into Six values (1236,8,1244);
insert into Six values (1527,9,1536);
insert into Six values (942,6,948);
insert into Six values (1722,17,1739);
