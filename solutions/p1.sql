select * from hr.EMPLOYEES;

select first_name ,count(*)
from hr.EMPLOYEES
group by first_name
HAVING count(*) >1;


select department_id,FIRST_NAME , max(salary) as max
from hr.EMPLOYEES
group BY department_id ,first_name;

(,)
{ }