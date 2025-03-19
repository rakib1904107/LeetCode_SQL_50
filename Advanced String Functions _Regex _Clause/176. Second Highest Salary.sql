select max(salary) as SecondHighestSalary 
from (
    select id, salary, dense_rank() over(order by salary desc) as rnk
    from Employee
) t
where rnk=2;