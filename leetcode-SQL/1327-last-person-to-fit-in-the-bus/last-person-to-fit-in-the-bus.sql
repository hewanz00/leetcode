with cte as 
(select 
*
, sum(weight) over (order by turn) as total
from queue)

select person_name from cte
where  turn = (select max(turn) from cte where total <=1000)

