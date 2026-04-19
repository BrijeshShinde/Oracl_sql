-- Assingment Cutomer ,Salespeople and orders

-- Create above three tables and insert above mentioned data into respective tables.
CREATE TABLE Salespeople(
    Snum NUMBER PRIMARY KEY,
    Sname varchar2(20),
    City varchar2(20),
    Comm Number(10,2)
);

Insert into SALESPEOPLE(snum,SNAME,CITY,COMM) values(1001,'Peel','London', 0.12);
insert ALL
    into SALESPEOPLE(snum,SNAME,CITY,COMM) values(1002,'Serres','San Jose',0.13)
    into SALESPEOPLE(snum,SNAME,CITY,COMM) values(1004,'Monika','London',0.11)
    into SALESPEOPLE(snum,SNAME,CITY,COMM) values(1007,'Rifkin','Barcelona',0.15)
    into SALESPEOPLE(snum,SNAME,CITY,COMM) values(1003,'Axelrod','New York',0.10)
    into SALESPEOPLE(snum,SNAME,CITY,COMM) values(1005,'Franc','London',0.26)
select * from dual;

select * from SALESPEOPLE;

-- ----------------------------------------------CUSTOMERS TABLE -------------------------------------------
CREATE TABLE Customers(
    Cnum NUMBER PRIMARY KEY,
    Cname varchar2(20),
    City varchar2(20),
    Rating number check(Rating IN(100,200,300)),
    Snum Number NOT NULL,
    CONSTRAINT Snum_fk_Salespeople
    FOREIGN Key(Snum)
    REFERENCES Salespeople(Snum)
)

select * from customers;
DESCRIBE customers;

INSERT ALL
    into Customers(cnum,cname,city,rating,snum) values(2001,'Hoffman','London',100,1001)
    into Customers(cnum,cname,city,rating,snum) values(2002,'Giovanni','Rome',200,1003)
    into Customers(cnum,cname,city,rating,snum) values(2003,'Liu','San Jose',200,1002)
    into Customers(cnum,cname,city,rating,snum) values(2004,'Grass','Berlin',300,1002)
    into Customers(cnum,cname,city,rating,snum) values(2006,'Clemens','London',100,1001)
    into Customers(cnum,cname,city,rating,snum) values(2008,'Cisneros','San Jose',300,1007)
    into Customers(cnum,cname,city,rating,snum) values(2007,'Pereira','Rome',100,1004)
select * from dual;


-- ------------------------------ORDERS --------------------------------------------------------------
CREATE TABLE ORDERS(
    Onum NUMBER PRIMARY KEY,
    Amt NUMBER(10,2),
    Odate Date,
    Cnum Number NOT NULL,
    Snum NUMBER NOT NULL,
    CONSTRAINT cnum_fk_customers
    FOREIGN Key(Cnum)
    REFERENCES CUSTOMERS(Cnum),
    CONSTRAINT Snum_fk_Salespeople2
    FOREIGN KEY(Snum)
    REFERENCES Salespeople(Snum)
);


select * from orders;

DESCRIBE orders;

INSERT ALL
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3001,18.69,TO_DATE('03-Oct-96','DD-MON-YY'),2008,1007)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3003,767.19,TO_DATE('03-Oct-96','DD-MON-YY'),2001,1001)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3002,1900.10,TO_DATE('03-Oct-96','DD-MON-YY'),2007,1004)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3005,5160.45,TO_DATE('03-Oct-96','DD-MON-YY'),2003,1002)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3006,1098.16,TO_DATE('03-Oct-96','DD-MON-YY'),2008,1007)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3009,1713.23,TO_DATE('04-Oct-96','DD-MON-YY'),2002,1003)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3007,75.50,TO_DATE('04-Oct-96','DD-MON-YY'),2002,1003)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3008,4723.00,TO_DATE('05-Oct-96','DD-MON-YY'),2006,1001)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3010,1309.95,TO_DATE('06-Oct-96','DD-MON-YY'),2004,1002)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3011,9891.88,TO_DATE('06-Oct-96','DD-MON-YY'),2006,1001)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3012,3455.78,TO_DATE('04-Oct-96','DD-MON-YY'),2002,1003)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3013,1245.98,TO_DATE('04-Oct-96','DD-MON-YY'),2002,1003)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3014,3721.53,TO_DATE('05-Oct-96','DD-MON-YY'),2006,1001)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3015,734.50,TO_DATE('06-Oct-96','DD-MON-YY'),2004,1002)
    into orders(ONUM,AMT,ODATE,CNUM,SNUM) VALUES(3016,1729.67,TO_DATE('06-Oct-96','DD-MON-YY'),2006,1001)
select * from dual;
select * from orders;

COMMIT;

DESCRIBE Salespeople;
select * from SALESPEOPLE;

DESCRIBE CUSTOMERS;
SELECT * from CUSTOMERS;

DESCRIBE ORDERS;
select * from ORDERS;
----------------------------------------------------------------------------------------------------------------------------
--  List all customers with a rating of 100.
select * 
from CUSTOMERS
where rating = 100;

-- 2. Find all records in the Customer table with NULL values in the city column.
select * 
from CUSTOMERS
where city is NULL;

-- 3. Find the largest order taken by each salesperson on each date.
select s.snum,to_char(trunc(odate),'DD-MON-YYYY') as order_date,max(o.amt) as max_orders
from SALESPEOPLE s inner join orders o
on s.snum = o.snum
group by s.snum,to_char(trunc(odate),'DD-MON-YYYY')
order by s.snum;

select snum,to_char(trunc(odate),'DD-MON-YYYY'),max(amt)
from ORDERS
group by SNUM,to_char(trunc(odate),'DD-MON-YYYY')
order by snum;


-- 4. Arrange the Orders table by descending customer number.
select * 
from ORDERS
order by cnum DESC;

-- 5.	Find which salespeople currently have orders in the Orders table.
select DISTINCT s.snum,s.sname,s.city,s.comm
from salespeople s inner join orders o 
ON s.snum = o.snum;

-- 6. List names of all customers matched with the salespeople serving them.
select c.cname, s.sname
from CUSTOMERs c inner join SALESPEOPLE s
on c.snum = s.snum;

-- 7. Find the names and numbers of all salespeople who had more than one customer.
select s.snum,s.sname
from SALESPEOPLE s inner join customers c
ON s.snum = c.SNUM
group by s.SNUM,s.SNAME
having count(s.sname) > 1;

-- 8. Count the orders of each of the salespeople and output the results in descending order.
select s.snum,s.sname,count(o.onum) Orders
from SALESPEOPLE s inner join orders o
on s.snum = o.snum
group by s.snum,s.sname
order by count(o.onum);

-- 9. List the Customer table if and only if one or more of the 
-- customers in the Customer tables are located in San Jose.

select *
from CUSTOMERS
where exists(
    select 1
    from customers 
    where lower(city) = 'san jose'
);

-- 10.Match salespeople to customers according to what city they lived in.
select s.sname,c.cname,s.city
from SALESPEOPLE s inner join CUSTOMERS c
on s.city = c.CITY
order by sname;

-- 11.Find the largest order taken by each salesperson.
select s.snum,s.sname,o.onum,o.amt
from SALESPEOPLE s inner join orders o 
ON s.snum = o.SNUM
where o.amt=(
    select max(o.amt)
    from orders o
    where o.snum = s.snum
);


-- 12.Find customers in San Jose who has a rating above 200
select cname ,city,rating
from CUSTOMERS
where lower(city) ='san jose' AND rating >200;


-- 13.List the names and commissions of all salespeople in London
select sname,comm 
from SALESPEOPLE
where lower(city) = 'london';

-- 14.List all the orders of salesperson Monika from the Orders table.
select o.* 
from salespeople s inner join orders o
on s.snum = o.SNUM
where lower(s.sname) = 'monika';

-- 15.Find all customers with orders on October 3.
select c.cname,to_char(trunc(odate),'DD-MON-YYYY') AS Order_date,o.onum,amt
from CUSTOMERS c inner join orders o
on c.cnum = o.cnum
where to_char(trunc(odate),'DD-MON-YYYY') = date '2096-10-03';

-- 16.Give the sums of the amounts from the orders table, grouped by date,
select to_char(trunc(odate),'DD-MON-YYYY') order_date,sum(amt) sum_of_orders
from orders
group by to_char(trunc(odate),'DD-MON-YYYY');

-- 17.Eliminating all those dates where the SUM was not at
-- least 2000.00 above the MAX amount
    -- Filters out dates where the total is not at least 2000 greater than the largest order.
select to_char(trunc(odate),'DD-MON-YYYY') order_date , sum(amt) sum_of_orders,max(amt) max_amount
from ORDERS
group by trunc(odate)
having sum(amt) >= max(amt) +2000;

-- 18.Select all orders that had amounts that were greater than at least one of the orders from October 6.
select onum,amt 
from orders 
where amt >  (
    select min(amt) 
    from orders 
    where to_char(trunc(odate),'DD-MON-YYYY') = DATE '2096-10-06'
);

-- 19.Write a query that uses the EXISTS operator to extract
-- all salespeople who have customers with a rating of 300.
select s.snum,s.Sname
from salespeople s
where exists(
    select 1 
    from customers c
    where s.snum = c.snum  AND c.rating =300
);


-- 20.Find all pairs of customers having the same rating.
select c1.cname,c2.cname,c2.rating
from customers c1 join customers c2
on c1.rating = c2.rating
-- and c1.cnum <> c2.cnum  
and c1.cnum > c2.cnum;


-- 21.Find all customers with CNUM, 1000 above the SNUM of Serres.
select c.cnum,c.cname
from customers c inner join SALESPEOPLE s
on c.cnum = s.snum + 1000
where lower(s.sname) =  'serres'; 

select cnum,cname
from CUSTOMERS
where cnum = (
    select snum+1000
    from SALESPEOPLE
    where lower(sname) = 'serres'
);

-- 22.Give the salespeople’s commissions as percentage instead of decimal numbers.
select snum,sname,(comm*100) ||'%' as comm_percentages
from SALESPEOPLE;

-- 23.Find the largest order taken by each salesperson on
-- each date, eliminating those MAX orders, which are less
-- than $3000.00 in value.
select s.snum,s.sname,to_char(trunc(o.odate),'DD-MM-YYYY'), max(o.amt)
from salespeople s inner join orders o
on s.snum =o.snum
group by o.odate,s.snum,s.sname
having max(o.amt) > 3000
order by s.snum;

-- 24.List the largest orders on October 3, for each salesperson.
select s.snum,s.sname,to_char(trunc(o.odate)) order_date,max(o.amt) max_amt
from salespeople s inner join orders o
on s.snum = o.snum
where o.odate = date'2096-10-03'
group by s.snum,s.sname,o.odate;

-- 25.Find all customers located in cities where Serres (SNUM1002) has customers.
select cname, city
from customers 
where city IN(
    select city 
    from customers 
    where snum =1002
);

-- 26.Select all customers with a rating above 200.00.
select cnum,cname,rating
from customers
where rating > 200;

-- 27.Count the number of salespeople currently listing orders in the Orders table.
select count(distinct o.snum) Number_of_salespeople
from salespeople s inner join orders o
on s.snum = o.snum;

select count(*)
from SALESPEOPLE
where snum IN(
    select snum
    from orders 
);

-- 28.Write a query that produces all customers serviced by 
-- salespeople with a commission above 12%. Output the
-- customer’s name and the salesperson‘s rate of commission.
-- (Analyst :“Show the names of customers who are assigned to salespeople 
-- whose commission is greater than 12%, along with that commission value.”)

select c.cname,(s.comm*100) ||'%' sales_person_comm
from salespeople s inner join CUSTOMERS c
on s.snum = c.snum
where s.comm > .12;

-- 29.Find salespeople who have multiple customers.
select s.snum,s.Sname,count(c.cnum)
from salespeople s inner join customers c
on s.snum = c.SNUM
group by s.snum,s.sname
having count(c.cnum) >1;

-- 30.find salespeople with customers located in their city.
select distinct s.snum,s.sname,s.city
from SALESPEOPLE s inner join  CUSTOMERS c
on s.snum = c.snum
where c.city = s.city;

-- 31. Find all salespeople whose name starts with ‘P’ and
-- the fourth character is ‘I’
select sname
from SALESPEOPLE
where lower(sname) like 'p___i%';


-- 32.Write a query that uses a sub query to obtain all
-- orders for the customer named ‘Cisneros’. Assume you do
-- not know his customer number.
select o.* 
from orders o
where cnum IN (
    select CNUM
    from customers 
    where lower(cname) = 'cisneros'
);

-- 33.Find the largest orders for ‘Serres’ and ‘Rifkin’.
select s.snum,s.sname,max(o.amt)
from SALESPEOPLE s  inner join orders o
on s.snum = o.snum
where lower(s.sname) in('serres','rifkin')
group by s.snum,s.sname;

-- 34.Extract the Salespeople table in the following order:
-- SNUM,SNAME,COMMISSION, CITY.
select snum,sname,comm commission, city
from SALESPEOPLE;


-- 35. Select all customers whose names fall in between ‘A’
-- and ‘G’ alphabetical range.
select cname
from customers 
where lower(cname) >='a' and lower(cname) <'h';

-- 36.Select all the possible combinations of customers that you can assign.
select sname,cname
from SALESPEOPLE cross join customers;

-- 37.Select all orders that are greater than the average for October 4.
select onum, amt 
from orders
where amt >(
    select avg(amt)
    from orders 
    where trunc(odate) = date'2096-10-04'
);

-- 38.Write a select command using a correlated sub query
-- that selects the names and numbers of all customers with
-- ratings equal to the maximum for their city.

select c1.cnum,c1.Cname
from customers c1
where c1.rating = (
    select max(c2.rating)
    from customers c2
    where c2.city = c1.city
);


-- 40.Write a select command that produces the rating
-- followed by the name of each customer in San Jose.
select rating ,cname
from CUSTOMERS
where lower(city) = 'san jose';

-- 41.Find all orders with amounts smaller than any amount
-- for a customer in San Jose.
select onum,Amt
from orders
where amt <(
    select min(o2.amt)
    from orders o2 inner join customers cu
    on o2.cnum = cu.cnum
    where lower(cu.city) = 'san jose'
);

-- 42.Find all orders with above average amounts for their customers.
select onum ,o.cnum,o.amt
from orders o 
where o.amt<(
    select avg(o2.amt)
    from orders o2
    where o2.cnum = o.cnum
);

-- 43 Write a query that selects the highest rating in each city
select city,max(rating)
from customers
group by city;

-- 44.Write a query that calculates the amount of the
-- salesperson’s commission on order by a customer with a
-- rating above 100.00
select o.onum, s.sname, (o.amt*s.comm) as comm_amt
from orders o inner join customers c1
on o.cnum = c1.cnum
inner join salespeople s
on o.snum = s.snum
where c1.rating >100;

-- 45.Count the customers with rating above San Jose’s average.
select count(cnum)
from customers 
where rating >(
    select avg(rating)
    from customers 
    where lower(city) = 'san jose'
);

-- 46.Write a query that produces all pairs of salespeople
-- with themselves as well as duplicate rows with the order
-- reversed.
select s1.sname , s2.sname
from salespeople s1 , salespeople s2
order by s1.sname desc;

-- 47.Find all salespeople that are located in either
-- Barcelona or London
select sname,city
from salespeople
where lower(city) in('barcelona','london');

-- 48.Find all salespeople with only one customer.
select s.sname
from salespeople s inner join customers c
on s.snum  = c.snum
group by s.sname 
having count(c.snum) =1;

-- 49.Write a query that joins the Customer table to itself
-- to find all pairs of customers served by a single salesperson
select c1.cname customer_01, c2.cname customer_02 , c1.Snum
from CUSTOMERS c1 inner join CUSTOMERs c2
on c1.snum = c2.snum
where  c1.cnum <c2.cnum;

-- 50.Write a query that will give you all orders for more than $1000.00
select onum,amt 
from orders 
where amt > 1000;

-- 51.Write a query that lists each order number followed
-- by the name of the customer who made that order.
select o.onum,c.Cname
from orders o inner join CUSTOMERS c
on o.cnum =c.cnum;

-- 52.Write 2 queries that select all salespeople (by name
-- and number) 
-- who have customers in their cities who they do not service, 
-- one using a join and one a correlated
-- subquery. Which solution is more elegant?

select distinct  s.snum,s.sname
from salespeople s inner join customers c
on s.city = c.city AND s.snum <> c.snum;

select s.snum,s.sname
from salespeople s
where exists(
    select snum
    from customers c
    where c.city = s.city 
);



-- 53.Write a query that selects all customers whose ratings
-- are equal than ANY (in the SQL sense) of Serres.
select c.cnum,c.cname,c.rating
from customers c
where c.rating in(
    select c2.rating
    from salespeople s inner join customers c2
    on s.snum = c2.snum 
    where lower(s.sname) ='serres'
);


-- 54.Write2 queries that will produce all orders taken on
-- October3 or October 4
select onum,amt
from orders 
where odate in (
    to_date('2096-oct-03','YYYY-MON-DD'),
    to_date('2096-oct-04','YYYY-MON-DD'));
select onum,amt
from orders 
where odate between to_date('2096-oct-03','YYYY-MON-DD') AND to_date('2096-oct-04','YYYY-MON-DD');

-- 55.Write a query that produces all pairs of orders by a
-- given customer. Name that customer and eliminate
-- duplicates
select o1.onum,o2.onum,c.cname
from orders o1 inner join orders o2
on o1.cnum = o2.cnum and o1.onum < o2.onum
inner join customers c
on o1.cnum = c.cnum;


-- 56.Find only those customers whose ratings are higher
-- than every customer in Rome.
select cname,rating 
from customers
where rating >(
    select max(rating)
    from customers 
    where lower(city) = 'rome'
);

-- 57.Write a query on the customers table whose output
-- will exclude all customers with a rating < = 100.00, unless
-- they are located in Rome.

select cname,rating
from customers
where rating > 100 or lower(city) ='rome';

-- 58.Find all rows from the Customer table for which the
-- salesperson number is 1001.
select *
from customers 
where snum = 1001;

-- 59.Find the total amount in Orders for each salesperson
-- for which this total is greater than the amount of the
-- largest order in the table.
select o.snum,sum(amt) 
from orders o 
group by o.snum
having sum(amt) >    
    (
    select max(amt)
    from orders
    );

-- 60.Write a query that selects all orders that have Zeroes
-- or NULL in the Amount field.
select onum,amt
from orders
where amt is null or amt = 0;

-- 61.Produce all combinations of salespeople and
-- customer names such that the former precedes the latter
-- alphabetically, and the latter has a rating of less than 200.

select s.sname  as salesperson, c.cname as customer
from salespeople s , customers c
where s.sname < c.cname and c.rating < 200;

-- 62.List all salespeople’s names and the commission they
-- have earned.
select sname,comm
from salespeople;


-- 63.Write a query that produces the names and cities of
-- all customers with the same rating as Hoffman. Write the
-- query using Hoffman’s CNUM rather than his rating, 
-- so that it would still be usable if his rating changed.
select cname,city
from customers 
where rating = (
    select rating 
    from customers 
    where lower(cname) = 'hoffman'
);

select cname,city
from customers 
where rating = (
    select rating 
    from customers 
    where cnum = 2001
);




-- 64.
-- Find all salespeople for whom there are customers
-- that follow them in alphabetical order.
select s.snum ,s.sname
from salespeople s inner join customers c
on s.snum = c.snum
where c.cname >s.sname;

-- 65.Write a query that produces the names and ratings of
-- all customers of all who have above average orders.
select distinct  c.cname,c.rating
from customers c inner join orders o 
on c.cnum = o.cnum
where o.amt >(
    select avg(amt)
    from orders 
);

-- 66.Find the sum of all purchases from the Orders table
select sum(amt)
from orders;

-- 67.Write a select command that produces the order
-- number, amount, and date for all rows in the Order table
select onum,amt,odate
from orders;

-- 68.68.
-- Count the number of not null rating fields in the
-- Customer table including duplicates.
select count(rating)
from customers
where rating is null or rating =0;

-- 69..Write a query that gives the names of both the
-- salesperson and the customer for each order after the
-- order number.

select o.onum,s.sname,c.cname
from orders o inner join SALESPEOPLE s 
on o.snum = s.snum
inner join customers c
on c.cnum = o.cnum
order by onum;

-- 70.List the commissions of all salespeople servicing
-- customers in London.
select distinct s.sname
from salespeople s inner join customers c
on s.snum = c.snum
where lower(c.city) ='london';

-- 71.
-- Write a query using ANY or ALL that will find all
-- salespeople who have no customers located in their city
select s.snum,s.sname
from salespeople s
where s.city <> ALL(
    select c.city
    from customers c
    where c.snum = s.snum
);

-- 72..Write a query using the EXISTS operator that selects
-- all salespeople with customers located in their cities who
-- are not assigned to them.
-- C.city = S.city
-- C.snum ≠ S.snum

select s.sname
from salespeople s
where exists(
    select 1 
    from customers c
    where c.city = s.city and c.snum<> s.snum
);


-- 73.Write a query that selects all customers serviced by
-- Peel or Motika.
select c.cname,s.sname
from customers c inner join salespeople S
on c.snum =s.snum
where lower(s.sname) in('peel','motika');

-- 74.Count the number of salespeople registering orders
-- for each day. (If a salesperson has more than one order on
-- a given day, he or she should be counted only once.).
select snum,odate,count(snum)
from orders
group by snum,ODATE;

-- 75.Find all orders attributed to salespeople in London.
select o.*
from orders o inner join salespeople s
on o.snum = s.snum 
where lower(s.city) = 'london';

-- 76.Find all orders by customers not located in the same
-- cities as their salespeople.
select onum
from orders o inner join customers c
on o.cnum =c.cnum
inner join salespeople s
on s.snum =o.snum
where c.city <> s.city;

-- 77.Find all salespeople who have customers with more
-- than one current order.
select s.snum,s.sname
from salespeople s inner join customers c
on s.snum = c.snum
inner join orders o
on c.cnum = o.cnum
group by s.snum,s.sname
having count(o.onum) >1;

-- 78.Write a query that extracts from the Customer table
-- every customer assigned to a salesperson who currently
-- has at least one other customer (besides the customer
-- being selected) with orders in the Orders table.
select c1.cnum , c1.cname
from customers c1
where exists(
    select 1
    from customers c2
    where c2.snum = c1.snum and c2.cnum <> c1.cnum
    and
    exists(
        select 1
        from orders o
        where o.cnum= c2.cnum
    )
);


-- 
-- 79.Write a query that selects all customers whose name
-- begins with ‘C’.
select cname
from customers 
where lower(cname) like 'c%';

-- 80.Write a query on the Customers table that will find
-- the highest rating in each city. Put the output in this form:
-- for the city (city) the highest rating is : (rating).

select 'for the city '||city||'the highest rating is : '|| max(rating) as result
from customers 
group by city;

-- 81.Write a query that will produce the Snum values of all
-- salespeople with orders currently in the Orders table
-- without any repeats.
select distinct  snum,onum,amt
from orders ;

-- 82.
-- Write a query that lists customers in descending
-- order of rating. Output the rating field first, followed by
-- the customers’ names and numbers.

select rating,cname,cnum
from customers 
order by rating desc;

-- 83.Find the average commission for salespeople in
-- London.
select snum,sname,avg(comm)
from salespeople
where lower(city) = 'london'
group  by snum,sname;

-- 84.
-- Find all orders credited to the same salesperson that
-- services Hoffman.
SELECT o.onum,o.amt,o.snum
FROM orders o
where o.snum = (
    select c.snum
    from customers c
    where lower(c.cname) = 'hoffman'
);

-- 85.
-- Find all salespeople whose commission is in between
-- 0.10 and 0.12 both inclusive.
select *
from salespeople
where comm between 0.10 and 0.12;

-- 86.
-- Write a query that will give you the names and cities
-- of all salespeople in London with commission above 0.10
select sname,city,comm
from salespeople
where comm >0.10;

-- 87.
-- What will be the output from the following query?
-- SELECT * FROM ORDERS 
-- WHERE(AMT<1000 OR NOT(ODATE=10/03/1996 AND CNUM>2003));

-- 88.Write a query that selects each customer’s smallest
-- order.
select o.cnum,o.onum,o.amt
from orders o 
where o.amt = (
    select min(o2.amt)
    from orders o2
    where o2.cnum = o.cnum
);


-- 89.
-- Write a query that selects the first customer in
-- alphabetical order whose name begins with ‘G’.
select cname
from customers 
where lower(cname) like 'g%';

-- 90.
-- Write a query that counts the number of different not
-- NULL city values in the Customers tabl
select count(distinct city)
from customers 
where city is not null;

-- 91.Find the average amount from the Orders table.
select trunc(avg(amt)) 
from orders;

-- 92.
-- What would be the output from the following query?
-- SELECT * FROM ORDERS 
-- WHERE NOT ((Odate = 10/03/1996 OR Snum > 1006) AND amt > = 1500);
--  ->

-- 93.
-- Find all customers who are not located in San Jose &
-- whose rating is above 200.
select cname
from customers
where lower(city) = 'san jose' and rating >200;


-- 94.
-- Give a simpler way to write this query:
-- SELECT Snum, Sname, city, Comm FROM salespeople
-- WHERE(Comm>0.12 andComm<0.14);
SELECT Snum, Sname, city, Comm FROM salespeople
WHERE comm between 0.12 and 0.14;


-- Evaluate the following query: what will execute first in where ? 
SELECT * FROM orders 
WHERE NOT(trunc(Odate) = to_date(('10/03/2096','DD-MON-YYYY') AND Snum>1002) OR amt>2000)



-- 96.Which salespeople attend to customers not in the city
-- they have been assigned to?
select s.sname
from salespeople s inner join customers c
on c.snum =s.snum
where c.city<>s.city;

-- 97.
-- Which salespeople get commission greater than 0.11
-- and serving customers rated less than 250?
select distinct  s.sname ,c.rating
from salespeople s inner join customers c
on c.snum =s.snum
where c.rating < 250 AND  s.comm >0.11;


-- 98..
-- Which salespeople have been assigned to the same
-- city but get different commission percentages?
select s1.sname,s2.sname,s1.comm,s2.comm ,s1.city
from salespeople s1 inner join salespeople s2
on s1.city = s2.city AND s1.comm <> s2.comm 
where s1.snum <s2.snum;


-- 99.Which salesperson has earned the most by way of
-- commission?
select * from(
    select s.snum,s.sname,sum(o.amt * s.comm) total_comm, rank() over(order by sum(o.amt*s.comm) desc) rk
    from salespeople s inner join orders o
    on s.snum = o.snum
    group by s.snum,s.sname
)
where rk =1;


-- 100. Does the customer who has placed the maximum
-- number of orders have the maximum rating?
--> 


-- 101.Has the customer who has spent the largest amount
-- of money been given the highest rating?


--102.List all customers in descending order of customer
-- rating.
select * 
from customers
order by rating desc;

-- 103. On which days has Hoffman placed orders?
select o.odate 
from orders o 
where o.cnum =(
    select c.cnum
    from customers c
    where c.cnum= o.cnum AND c.cname ='Hoffman' 
);

-- 104.Do all sales people have different commissions?
-- yes all have different comm
select snum,sname,comm
from salespeople;

-- 105.Which sales people have no orders between
-- 10/03/1996 and 10/05/1996?
select s.sname
from salespeople s 
where not exists(
    select 1 
    from orders o
    where o.snum =s.snum 
    and odate between date '2096-10-03' and date '2096-10-05'
);

-- 106.Howmanysalespersons have succeeded in getting
-- orders?
select distinct  s.snum,s.sname
from salespeople s inner join orders o
on o.snum = s.snum;


-- 107.How many customers have placed orders?
select distinct  s.cnum,s.cname
from customers s inner join orders o
on o.cnum = s.cnum;

-- 108. On which date has each salesperson booked an order
-- of maximum value?
select s.snum,s.sname,o.odate,o.amt 
from orders o inner join salespeople s
on o.snum = s.snum
where o.amt =(
    select max(o2.amt)
    from orders o2
    where o2.snum = s.snum
);

-- 109. Who is the most successful sales person?
select * from
(
select s.snum,s.sname,sum(o.amt) total_sales, rank() over(order by sum(o.amt) desc) ran
from salespeople s inner join orders o
on s.snum = o.snum  
group by s.snum,s.sname
)
where ran =1;


-- 110.Who is the worst customer with respect to the
-- company?
select * from
(
select c.cnum,c.cname,sum(o.amt) total_sales, rank() over(order by sum(o.amt) ) ran
from customers c inner join orders o
on c.cnum = o.cnum  
group by c.cnum,c.cname
)
where ran =1;


-- 111.Are all customers not having placed orders greater
-- than 2000 totally been serviced by salesperson Peel or
-- Serres?
select c.cnum,c.cname, s.sname,o.amt
from customers c inner join salespeople s
on c.snum = s.snum
left join orders o
on c.cnum = o.cnum AND o.amt > 2000
where o.cnum is null AND lower(s.sname) not in ('peel','serres');


-- 112.Which customers have the same rating?
select c1.cname,c2.cname,c1.rating
from customers c1 inner join customers c2
on c1.rating = c2.rating 
where c1.cnum <c2.cnum ;

-- 113. Findall orders greater than the average for October 4th.
select *
from orders
where trunc(odate) = date '2096-10-04'
and amt <(
    select avg(amt)
    from orders
    where trunc(odate) = date'2096-10-04'
);

-- 114. Which customers have above average orders
select c.cnum,c.cname,AVG(o.amt) as avg_order_amount
from customers c inner join orders o
on c.cnum = o.cnum
group by c.cnum, c.cname
having AVG(o.amt) > (
    select AVG(amt)
    from orders
);

-- 115. List all customers with ratings above San Jose’s
-- average.
select c1.cnum,c1.cname,c1.rating
from customers c1
where rating > (
    select avg(rating)
    from customers  
    where lower(city) = 'san jose'
);


-- 116.Select the total amount in orders for each
-- salesperson for which the total is greater than the amount
-- of the largest order in the table.
select snum, sum(amt) as total
from orders
group by snum
having sum(amt) >(
    select max(amt)
    from orders
);

-- 117. Give names and numbers of all salesperson that have
-- more than one customer
select s.snum,s.sname
from salespeople s inner join customers c
on s.snum = c.snum
group by s.snum,s.sname
having count(c.cnum) >1;

-- 118. Select all salesperson by name and numbers who
-- have customers in their city whom they don’s the service
select s.snum,s.sname
from salespeople s 
where exists(
    select 1 
    from customers c
    where c.city = s.city AND c.snum <> s.snum
);

--  119. Which customers’ rating should be lowered (criteria : to lower the customer rating)

-- 120.Is there a case for assigning a salesperson to Berlin?

-- 121. Is there any evidence linking the performance of a
-- salesperson to commission that he or she is being paid?


-- 122. Dose the total amount in orders by customer in Rome
-- and London exceeds the commission paid to salesperson
-- in London and New York by more than 5 times?

-- 123. Which is the date, order number, amt and city for
-- each salesperson (byname) for the maximum order he
-- has obtained?

-- 124. Which sales person(s) should be fired?

-- 125. What is the total income for the company?