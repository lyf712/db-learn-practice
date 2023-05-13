use practice;
# 基本表结构
#create table practice.user
# (
#     id       int auto_increment
#         primary key,
#     username varchar(50)    null,
#     password varchar(50)    null,
#     age      int            null,
#     salary   decimal(10, 2) null
# );

# explain字段：id,select_type,table,partitions,type,possible_keys,key,key_len,ref,rows,filterd,Extra

# id primary,username ordinary
# 从select的字段去分析
# 1,SIMPLE,user,,ALL,,,,,3,100,
explain select * from user;
# 1,SIMPLE,user,,index,,PRIMARY,4,,3,100,Using index
explain select id from user;
# 1,SIMPLE,user,,index,,user_username_index,203,,3,100,Using index
explain select username from user;
# 1,SIMPLE,user,,ALL,,,,,3,100,
explain select password from user;

# 1,SIMPLE,user,,range,PRIMARY,PRIMARY,4,,3,100,Using where
explain select * from user where id > 1;
# 1,SIMPLE,user,,const,PRIMARY,PRIMARY,4,const,1,100,
explain select * from user where id = 1;
# 1,SIMPLE,user,,range,user_username_index,user_username_index,203,,1,100,Using index condition
explain select * from user where username like 'ok%';
# 1,SIMPLE,user,,ALL,,,,,4,25,Using where
explain select * from user where username like '%ok';
# 1,SIMPLE,user,,range,user_username_index,user_username_index,203,,1,100,Using index condition
explain select * from user where username like ' %ok';
# 1,SIMPLE,user,,ref,user_username_index,user_username_index,203,const,1,100,
explain select * from user where username = 'ok';
# 1,SIMPLE,user,,ref,user_username_index,user_username_index,203,const,1,100,Using index
# 覆盖索引，二级索引存储的是主键，刚才查询的字段为id则 无需回表查询，，Using index
explain select id from user where username = 'ok';
# 50ms

# 联合索引
# 1,SIMPLE,user,,range,"PRIMARY,user_username_index",user_username_index,207,,1,100,Using where; Using index
explain select id from user where username = 'ok' and id > 1;
# 1,SIMPLE,user,,range,"PRIMARY,user_username_index",user_username_index,207,,1,75,Using where; Using index
explain select id from user where username like 'ok%' and id > 1;
# 1,SIMPLE,user,,range,"PRIMARY,user_username_index",user_username_index,207,,1,75,Using where; Using index
explain select id from user where  id > 1 and username like 'ok%';
# 1,SIMPLE,user,,range,"PRIMARY,user_username_index",PRIMARY,4,,3,25,Using where
explain select * from user where  id > 1 and username like 'ok%';
# 1,SIMPLE,user,,range,user_username_index,user_username_index,203,,1,33.33,Using index condition; Using where
# 索引下推，将 server层的部分职责交给存储引擎层，降低回表动作
explain select * from user where  age > 10 and username like 'ok%';