{{
    config(
        materialized='incremental',
		database='dbt_practice',
		schema='dwh',
		alias='emp_scd_type1',
        unique_key='id',
        on_schema_change='sync_all_columns'
    )
}}
select e.*,current_timestamp as etl_insert_dt from {{source('STG','emp_stg')}} e

{% if is_incremental() %}
where
  update_dt > (select max(update_dt) from {{ this }})
{% endif %}