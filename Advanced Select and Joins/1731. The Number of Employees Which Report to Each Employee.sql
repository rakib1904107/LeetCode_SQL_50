select t2.employee_id,t2.name,count(*) as reports_count, round(avg(t1.age),0) as average_age 
from Employees t1 join Employees t2
where t1.reports_to = t2.employee_id
group by t2.employee_id
order by employee_id;