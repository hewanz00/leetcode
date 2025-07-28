/* Write your T-SQL query statement below */
select 
project_id
, round (avg(cast (experience_years as decimal)),2 ) as average_years

from employee e 
join project p 
on e.employee_id = p.employee_id
group by project_id
order by project_id

