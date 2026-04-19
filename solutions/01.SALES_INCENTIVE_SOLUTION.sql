select * from hr.EMPLOYEES;

-- 1.	Write create table syntax for employee table and Incentive table
-- CREATING EMPLOYEE TABLE
create table Employee(
    Emp_id number PRIMARY KEY,
    First_name varchar(20) NOT NULL,
    Last_name varchar(20) NOT NULL,
    Salary NUMBER,
    Joining_date Date,
    Department varchar(20)
);

-- CREATING INCENTIVES TABLE
create table Incentives(
    Employee_ref_id number,
    Incentive_date DATE,
    Incentive_amount number,
    CONSTRAINT Employee_ref_id
    FOREIGN key(Employee_ref_id)
    REFERENCES Employee(Emp_id)
    on DELETE CASCADE
);



drop table INCENTIVES;
select * from INCENTIVES;

-- 2.	Writesyntax forinsert data into table of employee table and Incentive table
-- INSERTING RECORD EMPLOYEE
insert into EMPLOYEE(Emp_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) 
values(1,'John','Abraham',1000000,TO_DATE('01-JAN-13','DD-MON-YY'),'Banking');


insert into EMPLOYEE (Emp_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
values(2,'Michael','Clarke',800000,TO_DATE('01-JAN-13','DD-MON-YY'),'Insurance');

INSERT ALL
    into EMPLOYEE(Emp_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES(3,'Roy','Thomas',700000,TO_DATE('01-FEB-13','DD-MON-YY') ,'Banking')
    into EMPLOYEE(Emp_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES(4,'Tom','Jose',600000,TO_DATE('01-FEB-13','DD-MON-YY') ,'Insurance')
    into EMPLOYEE(Emp_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES(5,'Jerry','Pinto',650000,TO_DATE('01-FEB-13','DD-MON-YY') ,'Insurance')
    into EMPLOYEE(Emp_id,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES(6,'Philip','Mathew',750000,TO_DATE('01-JAN-13','DD-MON-YY') ,'Services')
select * from dual;



-- INSERTING RECORD TO INCENTIVES

insert into INCENTIVES(Employee_ref_id,Incentive_date,Incentive_amount) 
values(1,TO_DATE('01-feb-13','DD-Mon-YY'),5000);

insert into INCENTIVES(Employee_ref_id,Incentive_date,Incentive_amount) 
values(2,TO_DATE('01-feb-13','DD-Mon-YY'),3000);

insert ALL
    into INCENTIVES(Employee_ref_id,Incentive_date,Incentive_amount) VALUES(3,TO_DATE('01-Feb-13','DD-MON-YY'),4000)
    into INCENTIVES(Employee_ref_id,Incentive_date,Incentive_amount) VALUES(1,TO_DATE('01-Jan-13','DD-MON-YY'),4500)
    into INCENTIVES(Employee_ref_id,Incentive_date,Incentive_amount) VALUES(2,TO_DATE('01-Jan-13','DD-MON-YY'),3500)
select * from dual;

COMMIT;


-- 3.	Get all employee details from the employee table
select * from Employee;

-- 4.	Get First_Name,Last_Name from employee table
select first_name,last_name from EMPLOYEE;

-- 5.	Get First_Name from employee table using alias name “Employee Name”
select first_name as "Employee Name" 
from EMPLOYEE;

-- 6.	Get First_Name from employee table in upper case
select upper(first_name) from EMPLOYEE;

-- 7.	Select first 3 characters of FIRST_NAME from EMPLOYEE
select substr(first_name,1,3) as First_name from EMPLOYEE;


-- 8.	Get position of 'o' in name 'John' from employee table
select instr(first_name,'o') 
from employee
where lower(FIRST_NAME) = 'john';

-- 9.	Get FIRST_NAME from employee table after removing white spaces from right side.
select Rtrim(FIRST_name) as First_name from employee;

-- 10.	Get First_Name from employee table after replacing 'o' with '$'
select replace(first_name,'o','$') AS first_name from employee;

-- 11.	Get First_Name and Last_Name as single column from employee table separated by a '_'
select first_name ||'_'||last_name as full_name from employee;

---------------------------------------------------------------------------------------
-- 12.	Get FIRST_NAME, Joiningyear, Joining Month and Joining Date from employee table
select first_name, 
EXTRACT(year from to_date(JOINING_DATE,'DD-MON-YY')) YEAR, 
EXTRACT(MONTH from TO_DATE(JOINING_DATE,'DD-MON-YY')) MONTH,
EXTRACT(DAY from to_date(JOINING_DATE,'DD-MON-YY')) DAY
from employee;
------------------------------------------------------------------------------------------

-- 13.	Get all employee details from the employee table order by First_Name Ascending
select * from EMPLOYEE
order by UPPER(first_name) asc;

-- 14.	Get all employee details from the employee table order by First_Name Ascending and Salary Descending?
select * 
from EMPLOYEE
order by UPPER(first_name) asc, salary desc;

-- 15.	Get employee details from employee table whose employee name is “John”
select * 
from EMPLOYEE
where upper(first_name) ='JOHN';

--------------------------------------------------------------------------------------------
-- 16.	Get employee details from employee table whose employee name are “John” and “Roy”
select * 
from EMPLOYEE
where upper(first_name) IN ('JOHN','ROY');
--------------------------------------------------------------------------------------------

-- 17.	Get employee details from employee table whose employee name are not “John” and “Roy”.
select * 
from EMPLOYEE
where lower(first_name) NOT IN('john','roy');

-- 18.	Get employee details from employee table whose first name starts with 'J'.
select * 
from EMPLOYEE
where upper(FIRST_NAME) like 'J%';

---------------------------------- contains -- any where in name -------------------
-- 19.	Get employee details from employee table whose first name contains 'o'.
select *  
from employee
where Upper(first_name) like '%O%';


-- 20.	Get employee details from employee table whose first name ends with 'n'.
select * 
from EMPLOYEE
where lower(first_name) like '%n';
 
--  21.	Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.
select *
from employee
where lower(first_name) like '___n';

-- 22.	Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.
select * 
from EMPLOYEE
where lower(first_name) like 'j___';

-- 23.	Get employee details from employee table who’s Salary greater than 600000.
select *
from employee
where SALARY >600000;

-- 24.	Get employee details from employee table whose joining year is “2013”.
select *
from employee
where EXTRACT(Year from to_date(Joining_date,'DD-MON-YY')) = 2013;

-- 25.	Get employee details from employee table whose joining month is “January”.
select *
from EMPLOYEE
where extract(MONTH from to_date(joining_date,'DD-MON-YY')) = 01;

-- 26.	Get employee details from employee table who joined before January 1st 2013.
select *
from employee
where JOINING_DATE < to_date('01-JAN-2013','DD-MON-YYYY');

-- 27.	Get employee details from employee table who joined after January 31st
select * 
from EMPLOYEE
where JOINING_DATE > to_date('31-JAN-2013','DD-MON-YYYY');

------------------------------------------------------------
-- 28.	Get Joining Date and Time from employee table
select 
    TO_CHAR(JOINING_DATE,'DD-MON-YYYY') AS Joining_date,
    TO_CHAR(Joining_date,'HH12:MI:SS') AS JOINING_TIME
from employee;
------------------------------------------------------------
-- 29.	Get Joining Date, Time including milliseconds from employee table



-- 30.	Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
select first_name,(i.incentive_date - e.joining_date) AS days_difference
from employee e inner JOIN incentives i
ON e.emp_id = i.EMPLOYEE_REF_ID;


-- 31.	Get department, total salary with respect to a department from employee table.
select DEPARTMENT,sum(salary) as Total_salary
from  EMPLOYEE
group by DEPARTMENT;


-- 32.	Get department, total salary with respect to a department from employee table order by total salary descending.
select * from(
    select department,sum(salary) as Total_salary
    from EMPLOYEE
    group by department
)
order by Total_salary desc;

-- 33.	Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
select department ,count(emp_id),sum(salary) as Total_salary
from EMPLOYEE
group by DEPARTMENT
order by Total_salary desc;

-- 34. Get department wise average salary from employee table order by salary ascending
select department,avg(salary) as avg_sal 
from EMPLOYEE
group by department
order by avg_sal asc;

-- 35. Get department wise maximum salary from employee table order by salary ascending?
select department,max(salary) as max_sal
from employee
group by department 
order by max_sal;

-- 36. Get department wise minimum salary from employee table order by salary ascending?
select department,min(SALARY) as min_salary
from employee
group by DEPARTMENT
order by min_salary asc;

-- 37. Select no of employees joined with respect to year and month from employee table.
select extract(YEAR from joining_date) as Year,extract(month from JOINING_DATE) as month,count(emp_id)
from employee
group by JOINING_DATE;

select extract(YEAR from joining_date) as Year, extract(month from JOINING_DATE) as month,count(emp_id) as NO_OF_EMPLOYEES
from employee
group by extract(YEAR from joining_date), extract(month from JOINING_DATE)
order by year,month;


-- 38. Select department,total salary with respect to a department from employee table
-- where total salary greater than 800000 order by Total_Salary descending
select department,sum(salary) as total_salary 
from employee
group by department
having sum(salary) > 800000;


select * from (select department,sum(salary) as total_salary 
from employee
group by department)
where total_salary > 800000;

-- 39. Select employee details from employee table if data in incentive table?
select distinct e.* 
from employee e inner join INCENTIVES i
on e.emp_id = i.EMPLOYEE_REF_ID
order by e.emp_id;

select e.* 
from EMPLOYEE e
where exists(
    select 1 
    from INCENTIVES  i 
    where e.emp_id = i.EMPLOYEE_REF_ID
);

select translate('Brijesh','esh','jaiho') from dual;    -- if 2 byte given to replace it will replace ony 2 bytes
select replace('Brijesh sh','sh','hoff') from dual;
select substr('Brijesh',1,4) from dual;     -- Brij
select INSTR('Brijesh','j') from dual;      --4

-- 40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from
-- employee table
select FIRST_NAME, SALARY ,
CASE
    WHEN UPPER(FIRST_NAME) ='JOHN' THEN (SALARY * 0.20)
    WHEN UPPER(FIRST_NAME) = 'ROY' THEN (SALARY * 0.10)
    ELSE (SALARY * 0.15)
END AS SALARY_PERCENTAGE
from employee;



-- 41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services
-- Dept' from employee table.

select distinct
    department,
    case
        when DEPARTMENT = 'Banking' THEN 'Bank Dept'
        when DEPARTMENT = 'Insurance' then 'Insurance Dept'
        WHEN DEPARTMENT = 'Services' THEN 'Services Dept'
        else 'NA'
    end as DEPARTMENTs
from employee;


-- 42. Delete employee data from employee table who got incentives in incentive table
delete from employee e
where EXISTS(
    select 1 
    from incentives i
    where i.EMPLOYEE_REF_ID = e.emp_id
);

select * from incentives;
select * from employee;
rollback;


-- 43. Select first_name, incentive amount from employee and incentives table for those
-- employees who have incentives.
select  e.FIRST_NAME,i.INCENTIVE_AMOUNT
from employee e inner join incentives i
on e.EMP_ID = i.Employee_ref_id
where i.INCENTIVE_AMOUNT is not null AND i.INCENTIVE_AMOUNT > 0
order by i.INCENTIVE_AMOUNT;

-- 44. Select first_name, incentive amount from employee and incentives table for those
-- employees who have incentives and incentive amount greater than 3000
select e.FIRST_NAME,i.incentive_amount
from employee e inner join INCENTIVES i
on e.emp_id = i.employee_ref_id
where incentive_amount > 3000
order by i.INCENTIVE_AMOUNT;

-- 45. Select first_name, incentive amount from employee and incentives table for all
-- employees even if they didn't get incentives
select e.first_name,i.i.incentive_amount
from employee e left OUTER join incentives i
on e.emp_id = i.EMPLOYEE_REF_ID
order by e.emp_id; 

-- 46. Select first_name, incentive amount from employee and incentives table for all
-- employees even if they didn't get incentives and set incentive amount as 0 for those
-- employees who didn't get incentives.

select e.first_name,nvl(i.INCENTIVE_AMOUNT,0) INCENTIVE_AMOUNT
from employee e left outer join incentives i
on e.emp_id = i.EMPLOYEE_REF_ID
order by e.emp_id;


-- 47. Select first_name, incentive amount from employee and incentives table for all
-- employees who got incentives using left join

select e.FIRST_NAME,i.incentive_amount
from INCENTIVES i left join employee e
on i.EMPLOYEE_REF_ID = e.emp_id;

select e.FIRST_NAME,i.incentive_amount
from employee e left join INCENTIVES i 
on e.emp_id = i.EMPLOYEE_REF_ID
where i.incentive_amount is not null AND i.incentive_amount > 0
order by e.emp_id;

-- 48. Select max incentive with respect to employee from employee and incentives table
-- using sub query.
/*
select max(i.incentive_amount) AS MAX_SALARY
from employee e inner join incentives i
on e.EMP_ID = i.employee_ref_id;


select e.FIRST_NAME,
(
    select max(i.incentive_amount)
    from incentives i
    where e.emp_id = i.EMPLOYEE_REF_ID
) AS MAX_Incentives
from employee e;



select e.first_name,
(select 
    max(i.incentive_amount)
    from INCENTIVES i 
    where e.emp_id = i.EMPLOYEE_REF_ID) AS max_incentive
from employee e
where exists(
    select 1 
    from INCENTIVES i
    where e.emp_id = i.EMPLOYEE_REF_ID
);

select e.emp_id,e.first_name, max(i.incentive_amount) AS MAX_SALARY
from employee e inner join incentives i
on e.EMP_ID = i.employee_ref_id
group by e.emp_id,e.first_name;
*/

-- correct ans
select e.FIRST_NAME,i.incentive_amount
from employee e inner join INCENTIVES i
on e.EMP_ID = i.employee_ref_id
where i.incentive_amount = (
    select max(incentive_amount) 
    from INCENTIVES
);
























-- ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';
-- select * from v$version;



-- DELETE from EMPLOYEE
-- where Emp_ID=1;



select * from hr.employees;

select max(salary) as second_higest from hr.EMPLOYEES
where max(salary) < (select max(SALARY)
from hr.EMPLOYEEs);
select * from hr.