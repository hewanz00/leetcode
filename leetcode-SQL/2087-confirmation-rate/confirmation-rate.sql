select s.user_id
, ISNULL(
        ROUND(CAST(confirmed AS DECIMAL(10,4)) / NULLIF(requests, 0), 2),
        0
    ) AS confirmation_rate

 from signups s 
left join 

(
select
c.user_id
, count(c.user_id) as requests
, count(case when action = 'confirmed' then c.user_id end ) as confirmed

from confirmations c 
group by c.user_id
) t1


on t1.user_id = s.user_id