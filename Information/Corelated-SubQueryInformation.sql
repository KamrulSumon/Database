
A Corelated Sub-query should refer its parent(main Query) Table in it. For example See find the Nth max salary by Co-related Sub-query:

SELECT Salary 
FROM Employee E1
WHERE N-1 = (SELECT COUNT(*)
             FROM Employee E2
             WHERE E1.salary <E2.Salary) 
Co-Related Vs Nested-SubQueries.

Technical difference between Normal Sub-query and Co-related sub-query are:

1. Looping: Co-related sub-query loop under main-query; whereas nested not; therefore co-related sub-query executes on each iteration of main query. Whereas in case of Nested-query; subquery executes first then outer query executes next. Hence, the maximum no. of executes are NXM for correlated subquery and N+M for subquery.

2. Dependency(Inner to Outer vs Outer to Inner): In the case of co-related subquery, inner query depends on outer query for processing whereas in normal sub-query, Outer query depends on inner query.

3.Performance: Using Co-related sub-query performance decreases, since, it performs NXM iterations instead of N+M iterations. ¨ Co-related Sub-query Execution.

For more information with examples :

http://dotnetauthorities.blogspot.in/2013/12/Microsoft-SQL-Server-Training-Online-Learning-Classes-Sql-Sub-Queries-Nested-Co-related.html
