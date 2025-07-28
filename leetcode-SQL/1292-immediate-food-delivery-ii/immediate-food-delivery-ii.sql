/* Write your T-SQL query statement below */
;WITH cte AS (
    SELECT
        d.customer_id,
        ROW_NUMBER() OVER (PARTITION BY d.customer_id ORDER BY d.order_date asc) AS row_num,
        CASE 
            WHEN d.order_date = d.customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled'
        END AS sc
    FROM 
        Delivery d
)
select
    round(sum(iif(c.sc = 'immediate', 1, 0)) * 100.0/count(1),2) [immediate_percentage]
from
    cte c 
where
    c.row_num = 1