


with cte as (
select *
,lag( dateadd(day, 1, event_date), 1, null) 
over (partition by player_id
      order by event_date) as c1

, rank () over (partition by player_id order by event_date) as rank1

from activity a 

)

select 
round(
    
    count( distinct case when c1=event_date and rank1 = 2 then player_id end )*1.0 / 
    count(distinct player_id )

, 2) as fraction

from cte


