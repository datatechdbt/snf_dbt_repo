{{
    config(
        materialized='incremental',
		database='dbt_practice',
		schema='dwh',
		alias='emp_scd_type1',
        unique_key='id'
    )
}}
select * from {{source('STG','emp_stg')}}

{% if is_incremental() %}
where
  update_dt > (select max(update_dt) from {{ this }})
{% endif %}