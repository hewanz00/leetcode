SELECT 
    FORMAT(trans_date, 'yyyy-MM') as month
    , country
    ,COUNT(id) AS trans_count
    , count (case when state = 'approved'then id end ) as approved_count
    , sum(amount) as trans_total_amount
    , isnull(sum(case when state = 'approved' then amount end ),0) as approved_total_amount
FROM 
    transactions t
GROUP BY 
     FORMAT(trans_date, 'yyyy-MM') , country;


