select t1.employee_id, t1.department_id 
from Employee t1
where t1.primary_flag ='Y' or (select count(t2.employee_id ) from Employee t2 where t2.employee_id =t1.employee_id )=1;