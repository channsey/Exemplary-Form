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
insert into Six values (,,);
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
