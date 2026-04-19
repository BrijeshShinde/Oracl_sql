select max(salary)
from hr.employees
where salary < (select max(salary) from hr.employees);

select * from hr.employees;

select employee_id, FIRST_NAME, count(EMPLOYEE_ID) as  
from hr.EMPLOYEES
group by EMPLOYEE_ID,first_name
having count(*) >1;