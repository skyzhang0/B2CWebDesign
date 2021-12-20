-- From File: Define_DB.sql
-- auto-generated definition
create schema `jxc manage system` collate utf8mb4_0900_ai_ci;

-- From File: Define_Table.sql
create table `jxc manage system`.goods_info
(
    Gno                     int auto_increment
        primary key,
    Gunit                   char(10)  null,
    Gname                   char(100) null,
    Gnum                    int       null,
    Gprice                  float     null,
    GqualityGuaranteePeriod char(10)  null,
    GDateOfProduction       date      null,
    GDueDate                date      null,
    Gkind                   char(10)  null,
    Gprofit                 float     null
);

create table `jxc manage system`.check_info
(
    Kno      int auto_increment
        primary key,
    Gno      int        null,
    Knum     int        null,
    Kqual    tinyint(1) null,
    Kdate    date       null,
    Kquality float      null,
    constraint check_info_goods_info_Gno_fk
        foreign key (Gno) references `jxc manage system`.goods_info (Gno)
);

create table `jxc manage system`.order_info
(
    Ono      int auto_increment
        primary key,
    Gno      int   null,
    Onum     int   null,
    Oprice   float null,
    Odate    date  null,
    Oquality float null,
    constraint order_info_goods_info_Gno_fk
        foreign key (Gno) references `jxc manage system`.goods_info (Gno)
);

create table `jxc manage system`.out_info
(
    Ouno         int auto_increment
        primary key,
    Gno          int  null,
    Onum         int  null,
    OutStockDate date null,
    constraint out_info_goods_info_Gno_fk
        foreign key (Gno) references `jxc manage system`.goods_info (Gno)
);

create table `jxc manage system`.sell_info
(
    SLno   int auto_increment
        primary key,
    Gno    int  null,
    SLnum  int  null,
    SLtime date null,
    constraint sell_info_goods_info_Gno_fk
        foreign key (Gno) references `jxc manage system`.goods_info (Gno)
);

create table `jxc manage system`.stock_info
(
    Sno                 int auto_increment
        primary key,
    Gno                 int   null,
    Snum                int   null,
    SMonthlyStorageCost float null,
    constraint stock_info_goods_info_Gno_fk
        foreign key (Gno) references `jxc manage system`.goods_info (Gno)
);

create table `jxc manage system`.user_info
(
    Uno                int auto_increment comment '职工编号'
        primary key,
    Uname              varchar(50) not null comment '职工代号，登录姓名',
    Upassword          varchar(50) not null comment '职工的登录密码',
    Utype              varchar(50) not null comment '职工的类型，例如"售货员"，"验收员"',
    Uphone             varchar(20) null comment '职工的联系方式，手机号码',
    Uregister_date     datetime    not null comment '职工账户创建日期',
    Ucancellation_date datetime    null comment '职工的账户注销日期',
    constraint userinfo_t_Uname_uindex
        unique (Uname)
)
    comment '用户信息表';

create table `jxc manage system`.user_changebackup
(
    CHno         int auto_increment comment '变更编号'
        primary key,
    CHtype       varchar(50) not null comment '变更类型，"删除","新建","授权"等',
    CHtime       datetime    not null comment '变更提交时间',
    Creator_Uno  int         not null comment '发起者的职工编号',
    Involved_Uno int         not null comment '涉及（被改变）的职工编号',
    BeforeType   varchar(50) null comment '变更前职工类型',
    AfterType    varchar(50) not null comment '变更后职工类型',
    constraint User_changeBackup_T_userinfo_t_Uno_fk_1
        foreign key (Creator_Uno) references `jxc manage system`.user_info (Uno),
    constraint User_changeBackup_T_userinfo_t_Uno_fk_2
        foreign key (Involved_Uno) references `jxc manage system`.user_info (Uno)
)
    comment '人员变更记录表';

create table `jxc manage system`.ware_info
(
    Wno         int auto_increment
        primary key,
    Gno         int   null,
    Wnum        int   null,
    WArriveDate date  null,
    Wquality    float null,
    constraint ware_info_goods_info_Gno_fk
        foreign key (Gno) references `jxc manage system`.goods_info (Gno)
);


-- From File: jxc_manage_system_goods_info.sql
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (1, '袋', '瓜子', 20, 5, '12个月', '2021-12-17', '2022-12-17', '食品', 1.8);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (2, '提', '纸巾', 40, 20, '3年', '2021-12-17', '2024-12-17', '日用', 3);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (3, '双', '袜子', 20, 10, '3年', '2021-12-17', '2024-12-17', '日用', 2);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (4, '瓶', '沐浴露', 20, 20, '3年', '2021-12-17', '2024-12-17', '日用', 3);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (5, '根', '毛巾', 10, 20, '4个月', '2021-12-17', '2021-04-17', '日用', 3);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (6, '盒', '泡面', 50, 5, '6个月', '2021-12-17', '2021-06-17', '食品', 1.5);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (7, '瓶', '牛奶', 100, 5, '6个月', '2021-12-17', '2021-06-17', '食品', 1);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (8, '提', '果篮', 20, 20, '1个月', '2021-12-17', '2022-01-17', '生鲜', 3);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (9, '袋', '薯片', 50, 5, '9个月', '2021-12-17', '2022-09-17', '食品', 1);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (10, '个', '巧克力', 50, 5, '12个月', '2021-12-17', '2022-12-17', '食品', 1);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (11, '袋', '饼干', 10, 5, '3个月', '2021-12-17', '2021-03-17', '食品', 1);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (12, '本', '笔记本', 20, 4, '3年', '2021-12-17', '2024-12-17', '文具', 0.5);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (13, '个', '罐头', 20, 10, '12个月', '2021-12-17', '2022-12-17', '食品', 1);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (14, '提', '花生油', 10, 50, '2年', '2021-12-17', '2023-12-17', '食品', 8);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (15, '个', '水杯', 10, 25, '2年', '2021-12-17', '2023-12-17', '日用', 3);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (16, '听', '啤酒', 50, 5, '6个月', '2021-12-17', '2021-06-17', '饮料', 1);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (17, '袋', '海带', 20, 20, '8个月', '2021-12-17', '2021-08-17', '生鲜', 2);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (18, '瓶', '可乐', 50, 3, '9个月', '2021-12-17', '2021-09-17', '饮料', 0.5);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (19, '根', '中性笔', 100, 1, '12个月', '2021-12-17', '2022-12-17', '文具', 0.2);
INSERT INTO `jxc manage system`.goods_info (Gno, Gunit, Gname, Gnum, Gprice, GqualityGuaranteePeriod, GDateOfProduction, GDueDate, Gkind, Gprofit)
VALUES (20, '只', '冻鱼', 20, 20, '3个月', '2021-12-17', '2021-03-17', '生鲜', 3);

-- From File: jxc_manage_system_check_info.sql
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1001, 1, 10, 1, '2021-12-18', 1);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1002, 2, 20, 1, '2021-12-18', 20);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1003, 3, 30, 1, '2021-12-18', 3);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1004, 4, 20, 1, '2021-12-18', 20);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1005, 5, 20, 1, '2021-12-18', 2);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1006, 6, 10, 1, '2021-12-18', 2);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1007, 7, 10, 1, '2021-12-18', 5);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1008, 8, 20, 1, '2021-12-18', 10);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1009, 9, 20, 1, '2021-12-18', 2);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1010, 10, 10, 1, '2021-12-18', 500);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1011, 11, 50, 1, '2021-12-18', 5);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1012, 12, 20, 1, '2021-12-18', 2);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1013, 13, 10, 1, '2021-12-18', 2);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1014, 14, 20, 1, '2021-12-18', 100);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1015, 15, 20, 1, '2021-12-18', 4);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1016, 16, 30, 1, '2021-12-18', 6);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1017, 17, 20, 1, '2021-12-18', 5);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1018, 18, 10, 1, '2021-12-18', 5);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1019, 19, 40, 1, '2021-12-18', 800);
INSERT INTO `jxc manage system`.check_info (Kno, Gno, Knum, Kqual, Kdate, Kquality)
VALUES (1020, 20, 20, 1, '2021-12-18', 8);

-- From File: jxc_manage_system_order_info.sql
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (1, 1, 10, 17, '2021-12-17', 1);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (2, 2, 20, 17, '2021-12-17', 20);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (3, 3, 30, 3.5, '2021-12-17', 3);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (4, 4, 20, 4, '2021-12-17', 20);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (5, 5, 20, 17, '2021-12-17', 2);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (6, 6, 10, 4, '2021-12-17', 2);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (7, 7, 10, 4, '2021-12-17', 5);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (8, 8, 20, 4, '2021-12-17', 10);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (9, 9, 20, 3.5, '2021-12-17', 2);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (10, 10, 10, 9, '2021-12-17', 500);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (11, 11, 50, 42, '2021-12-17', 5);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (12, 12, 20, 22, '2021-12-17', 2);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (13, 13, 10, 4, '2021-12-17', 2);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (14, 14, 20, 18, '2021-12-17', 100);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (15, 15, 20, 2.5, '2021-12-17', 4);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (16, 16, 30, 0.8, '2021-12-17', 6);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (17, 17, 20, 17, '2021-12-17', 5);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (18, 18, 10, 0, '2021-12-17', 5);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (19, 19, 40, 0, '2021-12-17', 800);
INSERT INTO `jxc manage system`.order_info (Ono, Gno, Onum, Oprice, Odate, Oquality)
VALUES (20, 20, 20, 0, '2021-12-17', 8);

-- From File: jxc_manage_system_out_info.sql
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (1, 1, 20, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (2, 2, 20, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (3, 4, 10, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (4, 5, 30, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (5, 6, 10, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (6, 8, 20, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (7, 11, 10, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (8, 12, 20, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (9, 15, 30, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (10, 16, 10, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (11, 17, 20, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (12, 19, 20, '2021-12-13');
INSERT INTO `jxc manage system`.out_info (Ouno, Gno, Onum, OutStockDate)
VALUES (13, 20, 30, '2021-12-13');

-- From File: jxc_manage_system_sell_info.sql
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (1, 1, 2, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (2, 3, 5, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (3, 4, 5, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (4, 5, 2, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (5, 9, 5, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (6, 12, 10, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (7, 13, 10, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (8, 15, 2, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (9, 17, 4, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (10, 18, 8, '2021-12-18');
INSERT INTO `jxc manage system`.sell_info (SLno, Gno, SLnum, SLtime)
VALUES (11, 19, 5, '2021-12-18');

-- From File: jxc_manage_system_stock_info.sql
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (1, 1, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (2, 2, 30, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (3, 3, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (4, 4, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (5, 5, 10, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (6, 6, 50, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (7, 7, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (8, 8, 30, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (9, 9, 40, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (10, 10, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (11, 11, 30, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (12, 12, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (13, 13, 10, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (14, 14, 50, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (15, 15, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (16, 16, 30, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (17, 17, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (18, 18, 20, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (19, 19, 50, 100);
INSERT INTO `jxc manage system`.stock_info (Sno, Gno, Snum, SMonthlyStorageCost)
VALUES (20, 20, 30, 100);

-- From File: jxc_manage_system_user_info.sql
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (1, 'Administrator', '12345678', 'Administrator', '1234678910', '2021-12-13 18:03:48', null);
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (2, 'seller', '123', 'Seller', '5141', '2021-12-13 00:00:00', null);
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (3, 'storekeeper', '456', 'StoreKeeper', '5415634', '2021-12-13 18:34:21', null);
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (4, 'buyer', '789', 'Buyer', '54541', '2021-12-13 18:35:01', null);
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (5, 'inspector', '101112', 'Inspector', '515158', '2021-12-13 18:35:35', null);
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (6, 'test_del', '544864', 'Deleted', '5546', '2021-12-13 20:58:49', '2021-12-13 20:58:53');
INSERT INTO `jxc manage system`.user_info (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date)
VALUES (7, 'test_ch', '54', 'Buyer', '546', '2021-12-13 21:04:20', null);

-- From File: jxc_manage_system_user_changebackup.sql
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (1, 'Add', '2021-12-13 18:03:48', 1, 1, 'null', 'Administrator');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (2, 'Add', '2021-12-13 18:33:08', 1, 2, 'null', 'Seller');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (3, 'Add', '2021-12-13 18:34:21', 1, 3, 'null', 'StoreKeeper');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (4, 'Add', '2021-12-13 18:35:01', 1, 4, 'null', 'Buyer');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (5, 'Add', '2021-12-13 18:35:35', 1, 5, 'null', 'Inspector');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (6, 'Add', '2021-12-13 20:58:49', 1, 6, 'null', 'Seller');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (7, 'Delete', '2021-12-13 20:56:33', 1, 6, 'Seller', 'Deleted');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (8, 'Add', '2021-12-13 21:04:20', 1, 7, 'null', 'Seller');
INSERT INTO `jxc manage system`.user_changebackup (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType)
VALUES (9, 'ChAuthority', '2021-12-13 21:04:22', 1, 7, 'Seller', 'Buyer');

-- From File: jxc_manage_system_ware_info.sql
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (1, 1, 10, '2021-12-17', 1);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (2, 2, 20, '2021-12-17', 20);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (3, 3, 30, '2021-12-17', 3);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (4, 4, 20, '2021-12-17', 20);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (5, 5, 20, '2021-12-17', 2);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (6, 6, 10, '2021-12-17', 2);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (7, 7, 10, '2021-12-17', 5);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (8, 8, 20, '2021-12-17', 10);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (9, 9, 20, '2021-12-17', 2);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (10, 10, 10, '2021-12-17', 500);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (11, 11, 50, '2021-12-17', 5);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (12, 12, 20, '2021-12-17', 2);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (13, 13, 10, '2021-12-17', 2);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (14, 14, 20, '2021-12-17', 100);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (15, 15, 20, '2021-12-17', 4);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (16, 16, 30, '2021-12-17', 6);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (17, 17, 20, '2021-12-17', 5);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (18, 18, 10, '2021-12-17', 5);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (19, 19, 40, '2021-12-17', 800);
INSERT INTO `jxc manage system`.ware_info (Wno, Gno, Wnum, WArriveDate, Wquality)
VALUES (20, 20, 20, '2021-12-17', 8);

