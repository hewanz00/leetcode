with cte as (
select  *, [end]-[start] as processing_time from activity

pivot ( max (timestamp) for activity_type in ([start], [end])  ) activity_pvt

) 

select machine_id, round(avg(processing_time),3) as processing_time from cte
group by machine_id



