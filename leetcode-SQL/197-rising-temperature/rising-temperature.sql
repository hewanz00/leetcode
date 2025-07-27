with cte as (
select w1.id
, w1.recorddate
, w1.temperature
, lag(w1.temperature) over (order by w1.recorddate) as prev_day_temp
, lag(w1.recorddate) over (order by w1.recorddate) as prev_day
 from weather w1
 join weather w2
 on w1.id = w2.id
)

select id from cte 
where temperature> prev_day_temp 
and datediff(recorddate, prev_day) = 1




