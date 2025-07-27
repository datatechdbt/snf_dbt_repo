{% snapshot emp_scd_typ2 %}
    {{
    config(
        target_database='dbt_practice',
		target_schema='consumption',
        unique_key='empno',
        strategy='check',
		check_cols=['ename','job','mgr','hire_date','salary','comm','deptno']
    )
    }}

select 
	EMPNO,
	ENAME,
	JOB,
	MGR ,
	HIRE_DATE ,
	SALARY ,  
	COMM ,
	DEPTNO,
	CURRENT_TIMESTAMP() as snapshot_at
	from dbt_practice.dbt_schema.emp_scd_stg

{% endsnapshot %}
	