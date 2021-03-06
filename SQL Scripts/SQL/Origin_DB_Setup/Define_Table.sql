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
    Uno                int auto_increment comment '????????????'
        primary key,
    Uname              varchar(50) not null comment '???????????????????????????',
    Upassword          varchar(50) not null comment '?????????????????????',
    Utype              varchar(50) not null comment '????????????????????????"?????????"???"?????????"',
    Uphone             varchar(20) null comment '????????????????????????????????????',
    Uregister_date     datetime    not null comment '????????????????????????',
    Ucancellation_date datetime    null comment '???????????????????????????',
    constraint userinfo_t_Uname_uindex
        unique (Uname)
)
    comment '???????????????';

create table `jxc manage system`.user_changebackup
(
    CHno         int auto_increment comment '????????????'
        primary key,
    CHtype       varchar(50) not null comment '???????????????"??????","??????","??????"???',
    CHtime       datetime    not null comment '??????????????????',
    Creator_Uno  int         not null comment '????????????????????????',
    Involved_Uno int         not null comment '????????????????????????????????????',
    BeforeType   varchar(50) null comment '?????????????????????',
    AfterType    varchar(50) not null comment '?????????????????????',
    constraint User_changeBackup_T_userinfo_t_Uno_fk_1
        foreign key (Creator_Uno) references `jxc manage system`.user_info (Uno),
    constraint User_changeBackup_T_userinfo_t_Uno_fk_2
        foreign key (Involved_Uno) references `jxc manage system`.user_info (Uno)
)
    comment '?????????????????????';

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

