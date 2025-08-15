/* Write your T-SQL query statement below */
with cte as(

select *
, lag(temperature) over (order by recorddate) as prev_temp
, lag(recorddate) over (order by recorddate) as prev_date

 from weather
)

select id

from cte 
where temperature > prev_temp and 
 dateadd(day,1, prev_date) = recorddate