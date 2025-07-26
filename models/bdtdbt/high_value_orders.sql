  {{config(materialized='ephemeral')}}
  select customer_id, sum(order_amount) as total_amount
  --from raw.orders
  from {{source('raw','orders')}}
	where order_amount > 100
	group by customer_id