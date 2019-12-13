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
insert into FLIGHTS values ('3','2019-08-09','AA','JFK','LAX','122900','123700','000800','002000','125700','151800','000500','152400','152300','-000100','0',null,'0','2475');
insert into FLIGHTS values ('23','2019-08-22','HA','OAK','OGG','070000','070000','000000','001600','071600','091000','000500','092000','091500','-000500','0',null,'0','2349');
insert into FLIGHTS values ('64','2019-08-10','HA','LIH','LAX','125000','125600','000600','001200','130800','211900','001500','213000','213400','000400','0',null,'0','2615');
insert into FLIGHTS values ('117','2019-08-20','WN','OAK','RNO','194000','195200','001200','000700','195900','203200','000300','203500','203500','000000','0',null,'0','181');
insert into FLIGHTS values ('128','2019-08-17','DL','SEA','LAX','095200','094800','-000400','002200','101000','120900','000900','124400','121800','-002600','0',null,'0','954');
insert into FLIGHTS values ('129','2019-08-18','DL','LAX','SEA','114500','113900','-000600','001600','115500','140500','000600','143600','141100','-002500','0',null,'0','954');
insert into FLIGHTS values ('131','2019-08-25','B6','MCO','LAX','125100','125000','-000100','001800','130800','144200','000600','150700','144800','-001900','0',null,'0','2218');
insert into FLIGHTS values ('147','2019-08-19','B6','OAK','LGB','105800','105000','-000800','000800','105800','120100','000500','121700','120600','-001100','0',null,'0','353');
insert into FLIGHTS values ('188','2019-08-07','WN','SJC','SNA','173000','172600','-000400','000900','173500','183800','000400','185000','184200','-000800','0',null,'0','342');
insert into FLIGHTS values ('197','2019-08-12','WN','OAK','ONT','210000','205300','-000700','000900','210200','220400','000300','221500','220700','-000800','0',null,'0','362');
insert into FLIGHTS values ('205','2019-08-04','AA','LAX','OGG','142500','142500','000000','001400','143900','164700','000400','170200','165100','-001100','0',null,'0','2486');
insert into FLIGHTS values ('212','2019-08-21','WN','SNA','OAK','082500','082600','000100','001000','083600','093600','000600','095000','094200','-000800','0',null,'0','371');
insert into FLIGHTS values ('217','2019-08-10','NK','IAH','LAX','073000',null,null,null,null,null,null,'085500',null,null,'1','A','0','1379');
insert into FLIGHTS values ('251','2019-08-14','WN','LAS','BUR','114500','121100','002600','000900','122000','130100','000300','125500','130400','000900','0',null,'0','223');
insert into FLIGHTS values ('257','2019-08-16','UA','DEN','SFO','191500','191300','-000200','003800','195100','205100','003200','205200','212300','003100','0',null,'0','967');
insert into FLIGHTS values ('284','2019-08-14','DL','LAX','ATL','080000','075800','-000200','001500','081300','144300','000900','152100','145200','-002900','0',null,'0','1947');
insert into FLIGHTS values ('351','2019-08-22','UA','SFO','SEA','230500','002900','008400','002000','004900','022500','000400','011400','022900','007500','0',null,'0','679');
insert into FLIGHTS values ('373','2019-08-26','DL','ATL','ONT','082600','082300','-000300','001600','083900','093500','001100','095400','094600','-000800','0',null,'0','1900');
insert into FLIGHTS values ('383','2019-08-03','AS','SFO','PDX','090000','091900','001900','002600','094500','110200','000400','105000','110600','001600','0',null,'0','550');
insert into FLIGHTS values ('410','2019-08-30','AS','LAX','JFK','071500','070900','-000600','002200','073100','152700','000900','155000','153600','-001400','0',null,'0','2475');
insert into FLIGHTS values ('413','2019-08-26','UA','CLE','SFO','191600','191300','-000300','001400','192700','212600','001300','213500','213900','000400','0',null,'0','2161');
insert into FLIGHTS values ('440','2019-08-30','AA','SFO','DFW','070000','070500','000500','002600','073100','123600','000800','124100','124400','000300','0',null,'0','1464');
insert into FLIGHTS values ('480','2019-08-13','AA','SAN','PHX','185900','185000','-000900','002600','191600','200800','000700','202600','201500','-001100','0',null,'0','304');
insert into FLIGHTS values ('503','2019-08-24','DL','LAX','IND','222500','222500','000000','001000','223500','051800','000600','052500','052400','-000100','0',null,'0','1814');
insert into FLIGHTS values ('571','2019-08-23','WN','SLC','SMF','132000','131700','-000300','000800','132500','133900','000400','140000','134300','-001700','0',null,'0','532');
insert into FLIGHTS values ('610','2019-08-19','DL','JFK','SFO','155500','155200','-000300','015500','182700','205600','000700','195200','210300','007100','0',null,'0','2586');
insert into FLIGHTS values ('613','2019-08-05','DL','SFO','SLC','185200','184700','-000500','002500','191200','212800','000900','214500','213700','-000800','0',null,'0','599');
insert into FLIGHTS values ('658','2019-08-21','NK','LAX','PIT','234000','233900','-000100','002100','240000','070700','000400','071700','071100','-000600','0',null,'0','2136');
insert into FLIGHTS values ('661','2019-08-07','UA','LAX','ORD','164500','165300','000800','002400','171700','224200','000200','224800','224400','-000400','0',null,'0','1744');
insert into FLIGHTS values ('703','2019-08-01','UA','EWR','LAX','084500','093400','004900','003700','101100','120700','000600','113600','121300','003700','0',null,'0','2454');
insert into FLIGHTS values ('720','2019-08-31','UA','SFO','DEN','140900','140500','-000400','001700','142200','172200','001700','174900','173900','-001000','0',null,'0','967');
insert into FLIGHTS values ('737','2019-08-15','UA','DEN','SFO','171000','171200','000200','001100','172300','183000','001200','185400','184200','-001200','0',null,'0','967');
insert into FLIGHTS values ('742','2019-08-02','WN','LAS','SAN','183000','182900','-000100','002100','185000','193700','000200','193500','193900','000400','0',null,'0','258');
insert into FLIGHTS values ('780','2019-08-15','WN','SEA','OAK','111000','113000','002000','002200','115200','132800','000400','132000','133200','001200','0',null,'0','672');
insert into FLIGHTS values ('814','2019-08-29','WN','DAL','SAN','160500','160500','000000','001900','162400','165900','000500','170500','170400','-000100','0',null,'0','1182');
insert into FLIGHTS values ('833','2019-08-06','WN','DAL','SAN','203000','202800','-000200','000700','203500','210500','000500','212500','211000','-001500','0',null,'0','1182');
insert into FLIGHTS values ('833','2019-08-30','WN','DAL','SAN','203000','214000','007000','001200','215200','222100','000200','212500','222300','005800','0',null,'0','1182');
insert into FLIGHTS values ('843','2019-08-25','UA','IAD','SFO','221500','221100','-000400','001400','222500','003300','000400','010400','003700','-002700','0',null,'0','2419');
insert into FLIGHTS values ('846','2019-08-09','WN','SJC','PDX','143000','142400','-000600','001000','143400','155200','000400','161500','155600','-001900','0',null,'0','569');
insert into FLIGHTS values ('930','2019-08-06','WN','SJC','BOI','101500','101100','-000400','001100','102200','123000','000200','125000','123200','-001800','0',null,'0','523');
insert into FLIGHTS values ('948','2019-08-29','UA','SFO','DEN','083500','083100','-000400','003300','090400','120600','000600','121300','121200','-000100','0',null,'0','967');
insert into FLIGHTS values ('989','2019-08-27','WN','SAN','OAK','223000','222200','-000800','000800','223000','232800','000600','235500','233400','-002100','0',null,'0','446');
insert into FLIGHTS values ('1120','2019-08-22','AS','SFO','SNA','134500','140000','001500','001700','141700','152200','000600','152500','152800','000300','0',null,'0','372');
insert into FLIGHTS values ('1133','2019-08-28','WN','LAX','SFO','223500','222700','-000800','000900','223600','232500','000400','235500','232900','-002600','0',null,'0','337');
insert into FLIGHTS values ('1143','2019-08-27','DL','SLC','SJC','113200','112500','-000700','001400','113900','120400','000500','122900','120900','-002000','0',null,'0','584');
insert into FLIGHTS values ('1284','2019-08-11','AA','DFW','FAT','184500','184500','000000','001200','185700','194500','000400','200600','194900','-001700','0',null,'0','1313');
insert into FLIGHTS values ('1295','2019-08-04','UA','LAX','LIH','090300','085500','-000800','003400','092900','114800','000700','115900','115500','-000400','0',null,'0','2615');
insert into FLIGHTS values ('1325','2019-08-30','WN','SMF','SAN','185500','185400','-000100','001700','191100','201900','000300','202000','202200','000200','0',null,'0','480');
insert into FLIGHTS values ('1347','2019-08-15','AS','SJC','SEA','102500','102700','000200','001500','104200','122700','001300','123500','124000','000500','0',null,'0','696');
insert into FLIGHTS values ('1380','2019-08-14','AS','SEA','SAN','060000','055300','-000700','002900','062200','083700','001200','085000','084900','-000100','0',null,'0','1050');
insert into FLIGHTS values ('1394','2019-08-11','AA','IAH','LAX','133100','132700','-000400','001300','134000','143100','003400','145800','150500','000700','0',null,'0','1379');
insert into FLIGHTS values ('1575','2019-08-05','WN','SMF','SAN','150000','150100','000100','000800','150900','162000','000200','163000','162200','-000800','0',null,'0','480');
insert into FLIGHTS values ('1674','2019-08-24','AA','LAX','CLT','112100','111900','-000200','001200','113100','184800','001200','192000','190000','-002000','0',null,'0','2125');
insert into FLIGHTS values ('1676','2019-08-28','AA','RDU','LAX','190000','192900','002900','001300','194200','212700','000800','212100','213500','001400','0',null,'0','2239');
insert into FLIGHTS values ('1700','2019-08-20','UA','IAH','SFO','163900','163200','-000700','003000','170200','183700','000500','185000','184200','-000800','0',null,'0','1635');
insert into FLIGHTS values ('1746','2019-08-14','UA','LIH','SFO','212100','211300','-000800','000900','212200','050400','000300','052600','050700','-001900','0',null,'0','2447');
insert into FLIGHTS values ('1781','2019-08-17','UA','IAH','SMF','101500','101300','-000200','002500','103800','120200','000500','121000','120700','-000300','0',null,'0','1609');
insert into FLIGHTS values ('1812','2019-08-26','AS','PDX','SFO','204500','203700','-000800','001600','205300','221600','000500','224000','222100','-001900','0',null,'0','550');
insert into FLIGHTS values ('1844','2019-08-12','UA','IAH','SFO','194600','194800','000200','001600','200400','213400','001400','214600','214800','000200','0',null,'0','1635');
insert into FLIGHTS values ('1900','2019-08-18','UA','SFO','SAN','104600','104300','-000300','001400','105700','121100','000400','123100','121500','-001600','0',null,'0','447');
insert into FLIGHTS values ('1911','2019-08-23','AS','LAS','SFO','120000','115200','-000800','002200','121400','132300','000400','134000','132700','-001300','0',null,'0','414');
insert into FLIGHTS values ('1919','2019-08-22','WN','OAK','SAN','133000','132800','-000200','001200','134000','144900','000200','150500','145100','-001400','0',null,'0','446');
insert into FLIGHTS values ('1925','2019-08-12','AS','LAX','SFO','063000','062400','-000600','001200','063600','072700','000500','080000','073200','-002800','0',null,'0','337');
insert into FLIGHTS values ('2002','2019-08-07','DL','SFO','SEA','164000','171400','003400','001900','173300','190500','000800','185000','191300','002300','0',null,'0','679');
insert into FLIGHTS values ('2036','2019-08-08','UA','SFO','PDX','210000','214200','004200','001900','220100','231300','000400','225000','231700','002700','0',null,'0','550');
insert into FLIGHTS values ('2038','2019-08-08','WN','SMF','LAX','062500','062300','-000200','001300','063600','074300','000600','075500','074900','-000600','0',null,'0','373');
insert into FLIGHTS values ('2048','2019-08-29','AA','PHX','SMF','204000','203400','-000600','001300','204700','222100','000600','224000','222700','-001300','0',null,'0','647');
insert into FLIGHTS values ('2121','2019-08-26','WN','OAK','SLC','214000','214700','000700','001100','215800','002000','000200','001500','002200','000700','0',null,'0','588');
insert into FLIGHTS values ('2154','2019-08-23','UA','IAD','LAX','081500','081300','-000200','001500','082800','102600','001400','104100','104000','-000100','0',null,'0','2288');
insert into FLIGHTS values ('2166','2019-08-09','UA','ORD','SFO','064500','065000','000500','001400','070400','085600','000500','091600','090100','-001500','0',null,'0','1846');
insert into FLIGHTS values ('2271','2019-08-31','WN','OAK','LGB','083500','082700','-000800','001400','084100','094200','000600','095500','094800','-000700','0',null,'0','353');
insert into FLIGHTS values ('2307','2019-08-02','AA','LAX','LAS','140000','143800','003800','003100','150900','155000','000500','151500','155500','004000','0',null,'0','236');
insert into FLIGHTS values ('2315','2019-08-16','WN','OAK','LAX','060000','062200','002200','003100','065300','074700','001000','073500','075700','002200','0',null,'0','337');
insert into FLIGHTS values ('2440','2019-08-19','WN','LAS','LAX','080000','081000','001000','001600','082600','090800','001000','091500','091800','000300','0',null,'0','236');
insert into FLIGHTS values ('2461','2019-08-01','WN','PHX','SJC','185000','191200','002200','000700','191900','204400','000400','204000','204800','000800','0',null,'0','621');
insert into FLIGHTS values ('2562','2019-08-13','DL','SLC','SMF','112500','112500','000000','002400','114900','120300','000600','120900','120900','000000','0',null,'0','532');
insert into FLIGHTS values ('2592','2019-08-05','WN','SAN','DEN','211500','213200','001700','001100','214300','003200','000500','003000','003700','000700','0',null,'0','853');
insert into FLIGHTS values ('2653','2019-08-13','AA','FAT','DFW','060100','060000','-000100','001200','061200','105100','001100','111800','110200','-001600','0',null,'0','1313');
insert into FLIGHTS values ('2680','2019-08-21','AA','ORD','SAN','100500','112000','007500','001800','113800','133000','000500','121900','133500','007600','0',null,'0','1723');
insert into FLIGHTS values ('2711','2019-08-25','WN','LAS','OAK','162000','163000','001000','001000','164000','174400','000400','175500','174800','-000700','0',null,'0','407');
insert into FLIGHTS values ('3053','2019-08-07','OO','SBP','PHX','061200','074600','009400','001800','080400','091500','000500','075700','092000','008300','0',null,'0','509');
insert into FLIGHTS values ('3139','2019-08-01','OO','FAT','LAX','121500','121000','-000500','003100','124100','132400','001400','132900','133800','000900','0',null,'0','209');
insert into FLIGHTS values ('3417','2019-08-05','OO','SAN','MRY','090000','084800','-001200','003700','092500','102300','000400','102500','102700','000200','0',null,'0','375');
insert into FLIGHTS values ('4147','2019-08-17','WN','SMF','ONT','105500','105400','-000100','000800','110200','120100','000300','122000','120400','-001600','0',null,'0','390');
insert into FLIGHTS values ('4202','2019-08-24','WN','SAN','SJC','112000','111800','-000200','000900','112700','122300','001400','125000','123700','-001300','0',null,'0','417');
insert into FLIGHTS values ('4223','2019-08-18','WN','PDX','SJC','193000','192500','-000500','001000','193500','205900','000400','211000','210300','-000700','0',null,'0','569');
insert into FLIGHTS values ('4749','2019-08-18','OO','ONT','SLC','183500','182900','-000600','001200','184100','205900','000600','211600','210500','-001100','0',null,'0','558');
insert into FLIGHTS values ('4785','2019-08-03','WN','SLC','SJC','064000','063600','-000400','000800','064400','071200','000800','073500','072000','-001500','0',null,'0','584');
insert into FLIGHTS values ('5057','2019-08-04','WN','SNA','OAK','163500','165600','002100','001000','170600','180000','000300','175500','180300','000800','0',null,'0','371');
insert into FLIGHTS values ('5104','2019-08-10','WN','LAX','BWI','150500','150400','-000100','001300','151700','223600','000200','230500','223800','-002700','0',null,'0','2329');
insert into FLIGHTS values ('5216','2019-08-20','OO','SFO','OMA','183300','183300','000000','001900','185200','235500','000400','235900','235900','000000','0',null,'0','1433');
insert into FLIGHTS values ('5277','2019-08-03','WN','LAX','SMF','095500','095400','-000100','000800','100200','105900','001800','112000','111700','-000300','0',null,'0','373');
insert into FLIGHTS values ('5309','2019-08-27','OO','SAT','SFO','063000','063900','000900','001300','065200','075500','004400','082000','083900','001900','0',null,'0','1482');
insert into FLIGHTS values ('5392','2019-08-28','OO','RNO','LAX','145200','150100','000900','002600','152700','163500','000900','164000','164400','000400','0',null,'0','391');
insert into FLIGHTS values ('5408','2019-08-08','OO','LAX','AUS','093000','092000','-001000','002300','094300','142400','000600','144700','143000','-001700','0',null,'0','1242');
insert into FLIGHTS values ('5552','2019-08-06','OO','BUR','DEN','113200','113100','-000100','000900','114000','143600','001200','150000','144800','-001200','0',null,'0','850');
insert into FLIGHTS values ('5756','2019-08-11','OO','SBP','SFO','175000','174000','-001000','001300','175300','183200','000400','185100','183600','-001500','0',null,'0','190');
insert into FLIGHTS values ('5757','2019-08-11','YV','PHX','MRY','095500','101100','001600','002400','103500','115900','000100','114600','120000','001400','0',null,'0','598');
insert into FLIGHTS values ('5880','2019-08-02','OO','SFO','PAE','130200','130400','000200','002900','133300','151200','000500','151900','151700','-000200','0',null,'0','710');
insert into FLIGHTS values ('5976','2019-08-16','OO','SLC','SFO','060000','055400','-000600','001700','061100','070600','000600','070500','071200','000700','0',null,'0','599');
