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
    `id` bigint not null  AUTO_INCREMENT comment 'id',
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

drop table if exists `category`;
create table `category` (
    `id` bigint not null  AUTO_INCREMENT comment 'id',
    `parent` bigint not null default 0 comment '父id',
    `name` varchar(50) not null comment '分类名',
    `sort` int comment '排序',
    primary key (`id`)
)  engine = innodb default charset = utf8mb4 comment '分类';

insert into `category` (id, parent, name, sort) values (100, 000, '前端开发', 100);
insert into `category` (id, parent, name, sort) values (101, 100, 'Vue', 101);
insert into `category` (id, parent, name, sort) values (102, 100, 'HTML & CSS', 102);
insert into `category` (id, parent, name, sort) values (200, 000, 'Java', 200);
insert into `category` (id, parent, name, sort) values (201, 200, '基础应用', 201);
insert into `category` (id, parent, name, sort) values (202, 200, '框架应用', 202);
insert into `category` (id, parent, name, sort) values (300, 000, 'Python', 300);
insert into `category` (id, parent, name, sort) values (301, 300, '基础应用', 301);
insert into `category` (id, parent, name, sort) values (302, 300, '进阶应用', 302);
insert into `category` (id, parent, name, sort) values (400, 000, '数据库', 400);
insert into `category` (id, parent, name, sort) values (401, 400, 'MySQL', 401);
insert into `category` (id, parent, name, sort) values (500, 000, '其他', 500);
insert into `category` (id, parent, name, sort) values (501, 500, '服务器', 501);
insert into `category` (id, parent, name, sort) values (502, 500, '开发工具', 502);
insert into `category` (id, parent, name, sort) values (503, 500, '服务端语言', 503);

drop table if exists `doc`;
create table `doc` (
    `id` bigint not null AUTO_INCREMENT comment 'id',
    `ebook_id` bigint not null default 0 comment 'EbookId',
    `parent` bigint not null default 0 comment '父id',
    `name` varchar(50) not null comment '名称',
    `sort` int comment '排序',
    `view_count` int default 0 comment '阅读数',
    `vote_count` int default 0 comment '点赞数',
    primary key (`id`)
)  engine = innodb default charset = utf8mb4 comment '文档';

insert into `doc` (`id`, ebook_id, parent, name, sort, view_count, vote_count)
values (1, 1, 0, '文档1', 1, 0, 0);
insert into `doc` (`id`, ebook_id, parent, name, sort, view_count, vote_count)
values (2, 1, 1, '文档1.1', 1, 0, 0);
insert into `doc` (`id`, ebook_id, parent, name, sort, view_count, vote_count)
values (3, 1, 0, '文档2', 2, 0, 0);
insert into `doc` (`id`, ebook_id, parent, name, sort, view_count, vote_count)
values (4, 1, 3, '文档2.1', 1, 0, 0);
insert into `doc` (`id`, ebook_id, parent, name, sort, view_count, vote_count)
values (5, 1, 3, '文档2.2', 2, 0, 0);
insert into `doc` (`id`, ebook_id, parent, name, sort, view_count, vote_count)
values (6, 1, 5, '文档2.2.1', 1, 0, 0);

drop table if exists `content`;
create table `content` (
    `id` bigint not null AUTO_INCREMENT comment '文档id',
    `content` mediumtext not null comment '内容',
    primary key (`id`)
)  engine = innodb default charset = utf8mb4 comment '文档内容';

drop table if exists `user`;
create table `user` (
    `id` bigint not null AUTO_INCREMENT comment '用户id',
    `login_name` varchar(50) not null comment '账户名',
    `name` varchar(50) comment '昵称',
    `password` char(32) not null comment '密码',
    primary key (`id`),
    unique key `login_name_unique` (`login_name`)
)  engine = innodb default charset = utf8mb4 comment '用户';

insert into `user` (`id`, `login_name`, `name`, `password`) values (1, 'test', 'test', 'test');

drop table if exists `ebook_snapshot`;
create table `ebook_snapshot` (
    `id` bigint auto_increment not null comment 'id',
    `ebook_id` bigint not null default 0 comment 'ebookId',
    `date` date not null comment '快照日期',
    `view_count` int not null default 0 comment '阅读数',
    `vote_count` int not null default 0 comment '点赞数',
    `view_increase` int not null default 0 comment '阅读增长',
    `vote_increase` int not null default 0 comment '点赞增长',
    primary key (`id`),
    unique key `ebook_id_date_unique` (`ebook_id`)
)  engine = innodb default charset = utf8mb4 comment 'ebook快照';


select t1.`date` as `date`, sum(t1.view_increase) as viewIncrease, sum(t1.vote_increase) as voteIncrease from ebook_snapshot t1 where t1.`date` between date_sub(curdate(), interval 30 day) and date_sub(curdate(), interval 1 day) group by t1.`date` order by t1.`date` asc;

select t1.`date` as `date`, sum(t1.view_count) as viewCount, sum(t1.vote_count) as voteCount, sum(t1.view_increase) as viewIncrease, sum(t1.vote_increase) as voteIncrease from ebook_snapshot t1 where t1.`date` >= date_sub(curdate(), interval 1 day) group by t1.`date` order by t1.`date` asc;