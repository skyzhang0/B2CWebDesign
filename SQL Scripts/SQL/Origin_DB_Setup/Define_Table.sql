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

