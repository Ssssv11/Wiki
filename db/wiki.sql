drop table if exists `db_test`;
create table `db_test` (
    `id` bigint not null comment 'id',
    `name` varchar(50) comment '名称',
    `password` varchar(50) comment '密码',
    primary key (`id`)
) engine = innodb default charset=utf8mb4 comment '测试';

select * from db_test;

insert into `test` values (1, 'test1', '111'),(2, 'test2', '222');

drop table if exists `demo`;
create table `demo` (
   `id` bigint not null comment 'id',
   `name` varchar(50) comment '名称',
   primary key (`id`)
) engine = innodb default charset=utf8mb4 comment '测试';

insert into `demo` values (1, 'test1'),(2, 'test2');

drop table if exists `ebook`;
create table `ebook` (
    `id` bigint not null comment 'id',
    `name` varchar(50) comment '名称',
    `category1_id` bigint comment '分类1',
    `category2_id` bigint comment '分类2',
    `description` varchar(200) comment '描述',
    `cover` varchar(200) comment '封面',
    `doc_count` int comment '文档树',
    `view_count` int comment '阅读数',
    `vote_count` int comment '点赞数',
    primary key (`id`)
) engine = innodb default charset = utf8mb4 comment '电子书';

insert into `ebook` (id, name, description)
    VALUES (1, 'Spring 入门教程', '零基础入门 Java 开发，企业级应用最佳首选框架');
insert into `ebook` (id, name, description)
    VALUES (2, 'Vue 入门教程', '零基础入门 Vue 开发，企业级应用最佳首选框架');
insert into `ebook` (id, name, description)
    VALUES (3, 'Python 入门教程', '零基础入门 Python 开发，企业级应用最佳首选框架');
insert into `ebook` (id, name, description)
    VALUES (4, 'Mysql 入门教程', '零基础入门 Mysql 开发，企业级应用最佳首选框架');
insert into `ebook` (id, name, description)
    VALUES (5, 'Oracle 入门教程', '零基础入门 Oracle 开发，企业级应用最佳首选框架');
