# C:\ProgramData\MySQL\MySQL Server 8.0\Data\
show variables like 'datadir';

# 层次的划分：行（记录） ——> 页（方便磁盘，内存的读取，IO，16K） --> 分区（分别索引放在一起，双向链表，顺序IO，1MB） ->
# 段（数据段-叶子结点，索引段-非叶子结点，回滚段）

# 行格式：略---Compact格式---- 变长字段列表，NULL,头信息，row_id,trx_id,roll_ptr,列数据