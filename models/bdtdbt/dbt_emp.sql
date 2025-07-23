select 
empno,
ename,
job,
mgr,
hire_date,
salary,
comm,
salary+nvl(comm,0) as tot_sal
from raw.EMP