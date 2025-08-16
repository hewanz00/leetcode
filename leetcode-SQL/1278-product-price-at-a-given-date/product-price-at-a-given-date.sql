with date_filter as (
select 
*
, row_number() over (partition by product_id  order by change_date desc) as newcol
from products
where change_date <= '2019-08-16'

),

all_prods as (
select product_id from products
group by product_id

)

select all_prods.product_id
, isnull(new_price, 10) as price

from all_prods
left join date_filter 
on all_prods.product_id = date_filter.product_id and newcol= 1



