sql profile and sql plan baseline
1.A SQL profile is a database object that contains auxiliary statistics specific to a SQL statement.
sql profile 是针对语句的包含辅助统计信息对象
The corrected statistics in a SQL profile can improve optimizer cardinality estimates, which in turn leads the optimizer to select better plans. 
sql profile可以改善优化器基数预估，让优化器选择最佳的执行计划
和hint和outlines不一样，他不会绑定到指定的执行计划，而是通过提供辅助统计信息改善sql执行
可以在DBA_SQL_PROFILEs中查询到
If either the optimizer environment or SQL profile changes, then the optimizer can create a new plan. 
As tables grow, or as indexes are created or dropped, the plan for a SQL profile can change. 
The profile continues to be relevant even if the data distribution or access path of the corresponding statement changes.
当优化器环境或者sql_profile变化，或者表增长，索引创建删除，执行计划会发生改变

In general, you do not need to refresh SQL profiles. Over time, however, profile content can become outdated. 
In this case, performance of the SQL statement may degrade. The statement may appear as high-load or top SQL. 
In this case, the Automatic SQL Tuning task again captures the statement as high-load SQL. You can implement a new SQL profile for the statement.

随着时间推移，sql profile可能会过时，sql语句性能会下降，需要重新生产sql profile


sql profile和sql plan baseline没有直接关系，但是如果一个语句中有多个执行计划，sql profile会帮忙找到最优的执行计划

Both SQL profiles and SQL plan baselines help improve the performance of SQL statements by ensuring that the optimizer uses only optimal plans.

Both profiles and baselines are internally implemented using hints. However, these mechanisms have significant differences, including the following:

In general, SQL plan baselines are proactive, whereas SQL profiles are reactive.
sql plan baseline是主动的，sql profile是被动的
SQL plan baselines reproduce a specific plan, whereas SQL profiles correct optimizer cost estimates.
sql plan baseline 生成一个执行计划，但是sql profile只是更正优化器预估，让优化器使用最佳执行计划

