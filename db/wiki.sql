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