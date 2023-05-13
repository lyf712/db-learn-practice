# SQL的执行过程分析，具体见notes..

# server层
# 关于连接管理部分（用户认证连接，connections管理，空闲连接的处理考虑
# 重点对比一下长连接和短链接的区别以及，解决长连接导致内存占用过大的办法

show processlist ;
kill connection +5;
show variables like 'max_connections';

# 关于查询缓存器、解析器

# 关于SQL执行器：预处理、优化器、执行计划（最终确定，例如选何种索引~）、执行
# 执行计划：explain指令的使用，分析走何种索引

# 见index\index_types.sql的分析

# 关于执行器（主键索引查询、全表扫描、索引下推）：：：重点关注执行器与执行引擎的交互方式和原理，必要时分析一下MySQL的源码

# TODO 后续再结合索引部分深入理解一下