{{config
(materialized='incremental',alias='scd_type0',database='dbt_practice',schema='dwh')}}

select * from {{source('STG','emp_stg')}}