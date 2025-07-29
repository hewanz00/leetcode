/* Write your T-SQL query statement below */
select 
class
from courses c 

group by class
having count(student) >=5