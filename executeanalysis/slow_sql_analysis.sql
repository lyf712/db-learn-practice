# 慢SQL的优化步骤
# 先定位慢SQL，关键变量：long_query_time，slow_query_log,
show variables like 'long_query_time';
show variables like 'slow_%';

use performance_schema;
select * from global_variables where VARIABLE_NAME like 'long_%';
