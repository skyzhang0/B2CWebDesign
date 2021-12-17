use infor01;
-- 商品信息表
CREATE TABLE GOODS_INFO
(
    Gno                     INT PRIMARY KEY,
    Gunit                   CHAR(10),
    Gname                   CHAR(100) NOT NULL,
    Gnum                    INT,
    Gprice                  FLOAT,
    GqualityGuaranteePeriod CHAR(10),
    GDateOfProduction       DATE,
    GDueDate                DATE,
    Gkind                   CHAR(10),
    Gprofit                 FLOAT
);

-- 订货信息表
CREATE TABLE ORDER_INFO
(
    Ono      INT PRIMARY KEY,
    Oname    CHAR(100) NOT NULL,
    Onum     INT,
    Oprice   FLOAT,
    Odate    DATE,
    Oquality FLOAT
);

-- 库存信息表
CREATE TABLE STOCK_INFO
(
    Sno                 INT PRIMARY KEY,
    Sname               CHAR(100) NOT NULL,
    Snum                INT,
    Sdate               DATE,
    SArriveDate         DATE,
    SMonthlyStorageCost FLOAT
);

-- 商品出售信息表
CREATE TABLE SELL_INFO
(
    SellNo     INT PRIMARY KEY,
    SellName   CHAR(100) NOT NULL,
    SellNum    INT,
    SellTime   DATE,
    SellProfit FLOAT
);

-- 成本信息表
CREATE TABLE COST_INFO
(
    Corder   FLOAT,
    Cstorage FLOAT,
    Ctran    FLOAT
);

-- 入库信息表
CREATE TABLE WARE_INFO
(
    Gno         INT,
    Gname       CHAR(100),
    Onum        INT,
    Ounit       CHAR(10),
    OArriveDate DATE,
    Oquality    FLOAT,
    Odifference FLOAT,
    PRIMARY KEY (Gno, Gname),
    FOREIGN KEY (Gno) REFERENCES GOODS_INFO (Gno), /*表级完整性约束条件，定义参照完整性*/
    FOREIGN KEY (Gname) REFERENCES GOODS_INFO (Gname) /*表级完整性约束条件，定义参照完整性*/
);

-- 出库信息表
CREATE TABLE OUT_INFO
(
    Gno          INT,
    Gname        CHAR(100),
    Num          INT,
    Ounit        CHAR(10),
    OutStockDate DATE,
    PRIMARY KEY (Gno, Gname),
    FOREIGN KEY (Gno) REFERENCES GOODS_INFO (Gno),
    FOREIGN KEY (Gname) REFERENCES GOODS_INFO (Gname)
);

-- 验收信息表
CREATE TABLE CHECK_INFO
(
    Ono      INT,
    Oname    CHAR(100),
    Knum     INT,
    Kqual    TINYINT(1),
    Kdate    DATE,
    Kquality FLOAT,
    PRIMARY KEY (Ono, Oname),
    FOREIGN KEY (Ono) REFERENCES ORDER_INFO (Ono),
    FOREIGN KEY (Oname) REFERENCES ORDER_INFO (Oname)
);

CREATE TABLE PER_INFO
(
    Uno                INT PRIMARY KEY,
    Uname              CHAR(100) NOT NULL,
    Upassword          CHAR(100),
    Utype              CHAR(10),
    Uphone             CHAR(100),
    Uregister_date     DATE,
    Ucancellation_date DATE
);

CREATE TABLE CH_INFO
(
    CHno        INT PRIMARY KEY,
    CHtype      CHAR(10),
    CHtime      DATE,
    CreatorUno  INT,
    InvolvedUno INT,
    BeforeType  CHAR(10),
    AfterType   CHAR(10)
);