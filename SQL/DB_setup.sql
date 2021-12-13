-- auto-generated definition
create schema `jxc manage system` collate utf8mb4_0900_ai_ci;

create table userinfo_t
(
    Uno                int         not null comment '职工编号'
        primary key,
    Uname              varchar(50) not null comment '职工代号，登录姓名',
    Upassword          varchar(50) not null comment '职工的登录密码',
    Utype              varchar(50) not null comment '职工的类型，例如"售货员"，"验收员"',
    Uphone             varchar(20) null comment '职工的联系方式，手机号码',
    Uregister_date     datetime    not null comment '职工账户创建日期',
    Ucancellation_date datetime    null comment '职工的账户注销日期'
)
    comment '用户信息表';

create table user_changebackup_t
(
    CHno         int         not null comment '变更编号'
        primary key,
    CHtype       varchar(50) not null comment '变更类型，"删除","新建","授权"等',
    CHtime       datetime    not null comment '变更提交时间',
    Creator_Uno  int         not null comment '发起者的职工编号',
    Involved_Uno int         not null comment '涉及（被改变）的职工编号',
    BeforeType   varchar(50) null comment '变更前职工类型',
    AfterType    varchar(50) not null comment '变更后职工类型',
    constraint User_changeBackup_T_userinfo_t_Uno_fk_1
        foreign key (Creator_Uno) references userinfo_t (Uno),
    constraint User_changeBackup_T_userinfo_t_Uno_fk_2
        foreign key (Involved_Uno) references userinfo_t (Uno)
)
    comment '人员变更记录表';

