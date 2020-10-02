create sequence if not exists s1;
create table if not exists t1(
a int default (nextval(s1)), 
b int,
primary key (a)
);
 
insert into t1 (b) values (5), (7);
insert into t1 (b) values (8);
 
select * from t1;
