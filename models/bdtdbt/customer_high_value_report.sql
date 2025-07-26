  with high_value_orders as (
  select * FROM
  {{ref('high_value_orders')}}
  ),
  customer_high_value_data as (
  SELECT
  c.customer_id,
  c.customer_name,
  c.customer_email,
  hvo.total_amount
  FROM
  {{source('raw','customers')}} c
  left join high_value_orders hvo
  on c.customer_id=hvo.customer_id
  )
  select * from customer_high_value_data