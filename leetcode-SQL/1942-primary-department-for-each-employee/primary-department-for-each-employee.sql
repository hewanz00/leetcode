
select 
e.employee_id
, e.department_id
from employee e 
join 

(select 
employee_id
, count(employee_id) as no_depts
from employee 
group by employee_id) t1 

on e.employee_id = t1.employee_id

where no_depts = 1 or 
primary_flag = 'Y'




