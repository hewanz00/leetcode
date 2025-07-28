

SELECT 
    r.contest_id,
   round( (COUNT(r.user_id) * 1.0 / (SELECT COUNT(DISTINCT user_id) FROM users)) * 100, 2) AS percentage
FROM 
    register r
GROUP BY 
    r.contest_id

order by percentage desc, contest_id asc