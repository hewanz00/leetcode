/* Write your T-SQL query statement below */
select 
u.unique_id
, e.name
 from employees e 
left join employeeUni u on
e.id = u.id

