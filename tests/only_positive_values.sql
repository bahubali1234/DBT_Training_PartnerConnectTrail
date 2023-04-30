-- refunds have a negative amount so total amount must be >=0
-- therefore return records where this is not true to make test fail

select 
  order_id,
  sum(amount) as total_amount

from {{ ref('stg_payments') }} 
group by 1
having not(total_amount>=0) 