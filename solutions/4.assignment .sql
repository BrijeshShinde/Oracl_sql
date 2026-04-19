-- assignment -4 5
select * from hr.locations;
select * from hr.countries;
select * from hr.EMPLOYEEs;
select * from hr.departments;
-- Q1.
select * from EMPLOYEE;
select emp_id, first_name||' '||last_name as full_name,salary
from EMPLOYEE;

-- Q2.Write a query to display job_id and number of manager under particular job. 
-- Show only those jobs that have more than one manager.
select job_id,count(manager_id) managers
from hr.Employees
group by job_id
having count(manager_id) > 1;

-- Q3. Display the country name and number of employees 
-- those working in particular city that count of employee is greater than 30.
SELECT count(employee_id),c.country_name
FROM hr.employees e,hr.departments d,hr.locations l,hr.countries c
WHERE e.department_id=d.department_id
AND d.location_id=l.location_id
AND l.country_id=c.country_id
group by c.country_name
HAVING count(employee_id)>30;


-- Q4. Display cities name and number of departments present those cities. And exculde departments 
-- there are no any employees.
select l.city,count(distinct d.department_id) as no_of_deptartment
from hr.locations l inner join hr.departments d
on l.location_id = d.location_id
inner join hr.employees e
on d.department_id = e.department_id
group by l.city
order by l.city;



-- Q5. Display the salary range and number of employees how are salary in between of range
-- SELECT
--     CASE
--         WHEN salary BETWEEN 1000 AND 2999 THEN '1000 - 2999'
--         WHEN salary BETWEEN 3000 AND 5999 THEN '3000 - 5999'
--         WHEN salary BETWEEN 6000 AND 9999 THEN '6000 - 9999'
--         WHEN salary >= 10000 THEN '10000+'
--     END AS salary_range,
--     COUNT(*) AS NO_OF_EMP
-- FROM hr.EMPLOYEES
-- GROUP BY
--     CASE
--         WHEN salary BETWEEN 1000 AND 2999 THEN '1000 - 2999'
--         WHEN salary BETWEEN 3000 AND 5999 THEN '3000 - 5999'
--         WHEN salary BETWEEN 6000 AND 9999 THEN '6000 - 9999'
--         WHEN salary >= 10000 THEN '10000+'
--     END
-- ORDER BY SALARY_RANGE;



-- Q6. Display Year list and number of Employees join in particular year.
select extract(year from to_date(hire_date)) hire_year,count(employee_id) count_of_emp_joined
from hr.Employees
group by extract(year from to_date(hire_date));


-- Q7. Display Manager_id , Manager Full Name and Under number of employees only those managers 
-- how have more than 5 employees under working. Result sort by manager_ID
select e1.manager_ID,e2.first_name||' '||e2.last_name as manager_full_name ,count(e1.employee_id) as no_of_employee
from hr.employees e1 inner join hr.employees e2
on e1.manager_id=e2.employee_id
group by e1.manager_ID,e2.first_name,e2.last_name
having count(e2.employee_id) >5;




------------------------------------------------------------------------------------------------------

-- Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ 
-- character.
SELECT employee_id ,FIRST_NAME||' '||last_name full_name,SALARY, hire_date
from hr.employees
where lower(first_name) like 's%';

-- Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum
-- ,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
select round(max(salary)) highest, round(min(salary)) minimum,round(sum(salary)) sum, round(avg(salary)) avg
from hr.employees;

-- Q3. Display following output .
-- Employee Details-------------------------------------------------------------------------------------
-- King earns $24,000.00 monthly but wants $72,000.00.
-- Kochhar earns $20,000.00 monthly but wants $60,000.00.
-- De Haan earns $17,000.00 monthly but wants $51,000.00.
-- Hunold earns $9,000.00 monthly but wants $27,000.00.
-- Ernst earns $6,000.00 monthly but wants $18,000.00.
-- Austin earns $4,800.00 monthly but wants $14,400.00.

select last_name||' '||'earns ' ||'$'|| to_char(salary) ||' '||'but wants' ||' '||'$'|| to_char(salary*3) as employee_details
from hr.employees;

-- Q4. Determine the number of managers without listing them. Label the column  Number of 
-- Managers Hint: Use the MANAGER_ID column to determine the number of managers.
select count(manager_ID) no_of_manager
from hr.employees;

-- Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE
select max(salary) - min(salary) difference
from hr.employees;

-- Q6. Display how many employees joined in each month
-- Hint: Grouping by month and count the employees .use TO_CHAR functions also
select extract(month from to_date(hire_date)) month, count(employee_id)
from hr.employees
group by extract(month from to_date(hire_date))
order by month ;

-- Q7. Display employee id , full name of employees and their hire date only those employees that has 
-- greater than 10 year experience in company.
select employee_id,first_name||' '||last_name Full_name,hire_date
from hr.employees
where (to_char(hire_date)<sysdate-365*10);

-- Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.
-- Hint: Commission column contain null values
select (salary*nvl(comm,1)) as sal , avg(salary)
from hr.employees
group by (salary*nvl(comm,1));

-- Q9.Write a query to display department_id and number of manager under the particular department 
-- exclude the null department.
-- Hint: Grouping on department id
select department_id,count(manager_id) count_of_manager
from hr.departments
where department_id is not null
group by department_id;

-- Q10.Display job title and number of employees working those job and number of manager they 
-- perform job.
select job_id,count(employee_id) no_of_emp,count(manager_ID) no_of_manager
from hr.employees
group by job_id
order by job_id;

-- Q11. Display employee full name and pad both side asterisk sing 10 time . Example
select rpad(
    lpad(FIRST_name ||' '|| last_name,
    length(FIRST_name ||' '|| last_name)+10,'*'),
    length(first_name || ' '|| last_name)+20,'*') as padded_name
from hr.EMPLOYEES;


-- Q12. Display following output. (Hint: Use Months_between Function)
-- Employee_Id |Last_name |Weeks  |Months |Year
-- 100 King 24 166 14
-- 101 Kochhar 20 139 12
-- 102 De Haan 28 195 16
-- 103 Hunold 19 136 11
-- 104 Ernst 17 119 10
-- 105 Austin 20 142 12

SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) * 4, 52)) AS WEEKS,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MONTHS,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS YEAR
FROM hr.EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 105
ORDER BY EMPLOYEE_ID;
