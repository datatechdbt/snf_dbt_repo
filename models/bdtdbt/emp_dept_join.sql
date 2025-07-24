--select * from {{ source('raw','EMP')}} e
--inner join {{source('raw','DEPT')}} d on e.deptno=d.deptno

select * from {{source('raw','EMP')}}
inner join {{source('raw','DEPT')}} using (deptno)

