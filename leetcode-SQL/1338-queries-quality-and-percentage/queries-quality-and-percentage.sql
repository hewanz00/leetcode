select 
query_name
, round( avg(rating *1.0/position), 2) as quality
, round(
    
    (count(case when rating < 3 then result end ) *100.0)
    
     / count(result) 
     
     ,2) 
     as poor_query_percentage

from queries q 
group by query_name
