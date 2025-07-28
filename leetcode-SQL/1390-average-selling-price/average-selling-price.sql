select p.product_id

, isnull(round(cast(sum(units*price) as float)/ sum(units),2),0) as average_price


 from prices p 
left join unitssold s 
on p.product_id = s.product_id and purchase_date between start_date and end_date
group by p.product_id