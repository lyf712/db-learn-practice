# show engines;
use practice;
# explain insert into t_bulletin values (1,'test_title','hello','2022-04-11',1,false)

# 1,SIMPLE,t_bulletin,,ref,t_bulletin_title__index,t_bulletin_title__index,803,const,1,100,
# explain select * from t_bulletin where title = 'hello';

# 1,SIMPLE,t_bulletin,,ALL,,,,,1,100,Using where
explain select * from t_bulletin where content = 'hello';