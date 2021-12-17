-- From File: Define_DB.sql
-- auto-generated definition
create schema `jxc manage system` collate utf8mb4_0900_ai_ci;

-- From File: Define_Table.sql
create table `jxc manage system`.userinfo_t
(
    Uno                int auto_increment comment '职工编号'
        primary key,
    Uname              varchar(50) not null comment '职工代号，登录姓名',
    Upassword          varchar(50) not null comment '职工的登录密码',
    Utype              varchar(50) not null comment '职工的类型，例如"售货员"，"验收员"',
    Uphone             varchar(20) null comment '职工的联系方式，手机号码',
    Uregister_date     datetime    not null comment '职工账户创建日期',
    Ucancellation_date datetime    null comment '职工的账户注销日期'
)
    comment '用户信息表';

create table `jxc manage system`.user_changebackup_t
(
    CHno         int auto_increment not null comment '变更编号'
        primary key,
    CHtype       varchar(50)        not null comment '变更类型，"删除","新建","授权"等',
    CHtime       datetime           not null comment '变更提交时间',
    Creator_Uno  int                not null comment '发起者的职工编号',
    Involved_Uno int                not null comment '涉及（被改变）的职工编号',
    BeforeType   varchar(50)        null comment '变更前职工类型',
    AfterType    varchar(50)        not null comment '变更后职工类型',
    constraint User_changeBackup_T_userinfo_t_Uno_fk_1
        foreign key (Creator_Uno) references userinfo_t (Uno),
    constraint User_changeBackup_T_userinfo_t_Uno_fk_2
        foreign key (Involved_Uno) references userinfo_t (Uno)
)
    comment '人员变更记录表';

-- From File: Insert_userinfo.sql
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (1, 'Administrator', '12345678', 'Administrator', '1234678910', '2021-12-13 18:03:48', null);
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (2, 'seller', '123', 'Seller', '4585646', '2021-12-13 18:33:08', null);
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (3, 'storekeeper', '456', 'StoreKeeper', '5415634', '2021-12-13 18:34:21', null);
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (4, 'buyer', '789', 'Buyer', '54541', '2021-12-13 18:35:01', null);
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (5, 'inspector', '101112', 'Inspector', '515158', '2021-12-13 18:35:35', null);
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (6, 'test_del', '544864', 'Deleted', '5546', '2021-12-13 20:58:49', '2021-12-13 20:58:53');
INSERT INTO `jxc manage system`.userinfo_t (Uno, Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES (7, 'test_ch', '54', 'Buyer', '546', '2021-12-13 21:04:20', null);

-- From File: Insert_user_changebackup.sql
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (1, 'Add', '2021-12-13 18:03:48', 1, 1, 'null', 'Administrator');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (2, 'Add', '2021-12-13 18:33:08', 1, 2, 'null', 'Seller');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (3, 'Add', '2021-12-13 18:34:21', 1, 3, 'null', 'StoreKeeper');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (4, 'Add', '2021-12-13 18:35:01', 1, 4, 'null', 'Buyer');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (5, 'Add', '2021-12-13 18:35:35', 1, 5, 'null', 'Inspector');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (6, 'Add', '2021-12-13 20:58:49', 1, 6, 'null', 'Seller');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (7, 'Delete', '2021-12-13 20:56:33', 1, 6, 'Seller', 'Deleted');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (8, 'Add', '2021-12-13 21:04:20', 1, 7, 'null', 'Seller');
INSERT INTO `jxc manage system`.user_changebackup_t (CHno, CHtype, CHtime, Creator_Uno, Involved_Uno, BeforeType, AfterType) VALUES (9, 'ChAuthority', '2021-12-13 21:04:22', 1, 7, 'Seller', 'Buyer');

