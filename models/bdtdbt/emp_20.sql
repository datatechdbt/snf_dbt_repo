{{ config (
    materialized="table",transient=false
)}}
select * from raw.emp where deptno=20