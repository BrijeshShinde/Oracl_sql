-- ---------------------------- 02.garage system  solutions ----------------------------------

-----------tables------
select * from customer_table;
select * from vendors_table;
select * from employee_table;
select * from SPAREPART_TABLE;
select * from purchase_TABLE;
select * from ser_det;



----------creation ------------

create table customer_table(
    CID number PRIMARY KEY,
    cname varchar2(20),
    cadd varchar2(20),
    c_contact number(12),
    c_creditdays number,
    cj_date date,
    sex varchar(6) check(sex in('male','female'))
);
select * from CUSTOMER_TABLE;
drop table CUSTOMER_TABLE;

insert ALL
    into CUSTOMER_TABLE values(1001,'Cyona blake','New York',1235684,20,TO_DATE('20-JAN-2011','DD-MON-YYYY'),'female')
    into CUSTOMER_TABLE values(1002,'JOHN SMITH','New JERSI',1341684,20,TO_DATE('21-FEB-2011','DD-MON-YYYY'),'male')
    into CUSTOMER_TABLE values(1003,'JORDAN WOOD','PRAG',1805184,20,TO_DATE('22-MAR-2011','DD-MON-YYYY'),'male')
    into CUSTOMER_TABLE values(1004,'christna','manhatton',115684,31,TO_DATE('23-APR-2013','DD-MON-YYYY'),'female')
    into CUSTOMER_TABLE values(1005,'TOM HILL','london',1239284,10,TO_DATE('25-jun-2015','DD-MON-YYYY'),'male')
    into CUSTOMER_TABLE values(1006,'KAMILA JOSEF','Parise',124568,9,TO_DATE('28-jul-2011','DD-MON-YYYY'),'female')
    into CUSTOMER_TABLE values(1007,'ANDRU AYMON','TAXES',125654,15,TO_DATE('01-APR-2016','DD-MON-YYYY'),'male')
    into CUSTOMER_TABLE values(1008,'SANJU SAMSUNG','NEW YORK',12346341,4,TO_DATE('20-JAN-2016','DD-MON-YYYY'),'male')
SELECT * FROM DUAL;


---------------------------------------------------vendor_table -------------------------------
CREATE TABLE vendors_table(
    vid number PRIMARY KEY,
    vname varchar2(20),
    vadd varchar2(20),
    vcontact number(12),
    vcreditdays number,
    vj_date date
);

select * from VENDORS_TABLE;

insert all 
    into VENDORS_TABLE values(2001,'KIRAN Patil','PUNE',20535535,20,TO_DATE('20-JAN-2010','DD-MON-YYYY'))
    into VENDORS_TABLE values(2002,'prakash jain','MUMBAI',2063564,10,TO_DATE('05-NOV-2011','DD-MON-YYYY'))
    into VENDORS_TABLE values(2003,'swapnil thete','NASHIK',25355352,15,TO_DATE('18-MAR-2010','DD-MON-YYYY'))
    into VENDORS_TABLE values(2004,'amol shende','satara',23674776,18,TO_DATE('07-apr-2015','DD-MON-YYYY'))
    into VENDORS_TABLE values(2005,'Karan sintre','buldhana',256756,30,TO_DATE('22-APR-2009','DD-MON-YYYY'))
    into VENDORS_TABLE values(2006,'RAM KULKARNI','OSMANABAD',20367454,21,TO_DATE('09-JUL-2010','DD-MON-YYYY'))
    select * from dual;


 --------------------------------employee_table -------------------------------------------------------------
create table employee_table(
    eid number primary key,
    ename varchar(20),
    ejob varchar(20),
    eadd VARCHAR(20),
    econtact number(12),
    esal number,
    edoj date,
    edol date
);

insert all
     into EMPLOYEE_TABLE(EID,ENAME,EJOB,EADD,ECONTACT,ESAL,EDOJ) values(3001,'STEVEN KING','PAINTER','NEW YORK',10367454,1200,TO_DATE('09-JUL-2010','DD-MON-YYYY'))
     into EMPLOYEE_TABLE(EID,ENAME,EJOB,EADD,ECONTACT,ESAL,EDOJ) values(3002,'DAVID AUSTIN','FITTER','MANHATON',10367434,1100,TO_DATE('19-AUG-2010','DD-MON-YYYY'))
     into EMPLOYEE_TABLE(EID,ENAME,EJOB,EADD,ECONTACT,ESAL,EDOJ) values(3003,'BRUCE ERNST','MECHANIC','NEW JERCY',10367264,2200,TO_DATE('08-SEP-2010','DD-MON-YYYY'))
     into EMPLOYEE_TABLE(EID,ENAME,EJOB,EADD,ECONTACT,ESAL,EDOJ,EDOL) values(3004,'LUIS POPP','MECHANIC','NEW JERCY',10367264,1700,TO_DATE('19-OCT-2009','DD-MON-YYYY'),TO_DATE('06-OCT-2010','DD-MON-YYYY'))
     into EMPLOYEE_TABLE(EID,ENAME,EJOB,EADD,ECONTACT,ESAL,EDOJ,EDOL) values(3005,'SHERI GOMES','FITTER','PARIS',10327264,1000,TO_DATE('19-OCT-2009','DD-MON-YYYY'),TO_DATE('01-AUG-2010','DD-MON-YYYY'))
     into EMPLOYEE_TABLE(EID,ENAME,EJOB,EADD,ECONTACT,EDOJ) values(3000,'JAMES PHILLIP','FITTER','PARIS',10322264,TO_DATE('01-JAN-2008','DD-MON-YYYY'))
SELECT * FROM DUAL;

SELECT * FROM EMPLOYEE_TABLE;


---------------------------------------sparepart tabel---------------------------------------------------

CREATE TABLE SPAREPART_TABLE(
    SPID NUMBER PRIMARY KEY,
    SPNAME VARCHAR(100),
    SPRATE NUMBER,
    SPUNIT VARCHAR(10)
);

DROP TABLE SPAREPART_TABLE;


INSERT ALL
    INTO SPAREPART_TABLE VALUES(4001,'TWO WHEELER TUBE',250,'NOS')
    INTO SPAREPART_TABLE VALUES(4002,'TWO WHEELER ENGINE OIL',400,'LTRS')
    INTO SPAREPART_TABLE VALUES(4003,'FOUR WHEELER ENGIN OIL',5000,'LTRS')
    INTO SPAREPART_TABLE VALUES(4004,'TWO WHEELER CARBORATOR',680,'NOS')
    INTO SPAREPART_TABLE VALUES(4005,'TWO WHEELER CLUTCH WIRE',129,'MTRS')
    INTO SPAREPART_TABLE VALUES(4006,'TWO WHEELER TAIL LIGHT',100,'NOS')
    INTO SPAREPART_TABLE VALUES(4007,'TWO WHEELER INDICATORS',150,'NOS')
    INTO SPAREPART_TABLE VALUES(4008,'FOUR WHEELER GASKIT',1340,'NOS')
    INTO SPAREPART_TABLE VALUES(4009,'WHITE COLOUR',340,'LTRS')
    INTO SPAREPART_TABLE VALUES(4010,'BLACK COLOUR',240,'LTRS')
    INTO SPAREPART_TABLE VALUES(4011,'TWO WHEELER SIDE MIRROR',250,'NOS')
    INTO SPAREPART_TABLE VALUES(4012,'TWO WHEELER SIDE MIRROR',450,'NOS')
    INTO SPAREPART_TABLE VALUES(4013,'FOUR WHEELER BUMPER',1320,'PAIR')
    INTO SPAREPART_TABLE VALUES(4014,'FOUR WHEELER BUMPER',6000,'NOS')
    INTO SPAREPART_TABLE VALUES(4015,'FOUR WHEELER FRONT GLASS',7000,'PCS')
SELECT * FROM DUAL;


SELECT * FROM SPAREPART_TABLE;


-----------------------------------purches table ------------------------------------------------------

CREATE TABLE PURCHASE_TABLE(
    PID NUMBER PRIMARY KEY,
    VID NUMBER ,
    SPID NUMBER,
    PQTY NUMBER,
    SPRATE NUMBER,
    SPGST NUMBER(10,2),
    PDATE DATE,
    TRANCOST NUMBER,
    TOTAL NUMBER(10,2),
    RCV_EID NUMBER,
    FOREIGN KEY(VID) REFERENCES VENDORS_TABLE(vid),
    FOREIGN KEY(SPID) REFERENCES Sparepart_Table(SPID),
    FOREIGN KEY(RCV_EID) REFERENCES EMPLOYEE_TABLE(EID)
) ;  


INSERT ALL
    INTO PURCHASE_TABLE VALUES(5001,2001,4001,10,250,350,TO_DATE('01-JAN-2011','DD-MON-YYYY'),1300,4150.00,3001)
    INTO PURCHASE_TABLE VALUES(5002,2002,4002,4,400,288,TO_DATE('02-MAR-2011','DD-MON-YYYY'),100,1988.00,3001)
    INTO PURCHASE_TABLE VALUES(5003,2003,4004,8,680,761.6,TO_DATE('12-JUN-2011','DD-MON-YYYY'),50,6251.6,3003)
    INTO PURCHASE_TABLE VALUES(5004,2004,4005,10,129,154.8,TO_DATE('22-AUG-2011','DD-MON-YYYY'),125,1569.8,3004)
    INTO PURCHASE_TABLE VALUES(5005,2005,4006,20,100,300,TO_DATE('07-SEP-2011','DD-MON-YYYY'),20,2320,3003)
    INTO PURCHASE_TABLE VALUES(5006,2006,4007,30,150,630,TO_DATE('11-OCT-2011','DD-MON-YYYY'),60,5190.00,3000)
    INTO PURCHASE_TABLE VALUES(5007,2001,4003,20,5000,14000,TO_DATE('07-SEP-2011','DD-MON-YYYY'),1000,115000,3000)
    INTO PURCHASE_TABLE VALUES(5008,2006,4005,1,129,15.48,TO_DATE('12-OCT-2011','DD-MON-YYYY'),50,194.48,3005)
    INTO PURCHASE_TABLE VALUES(5009,2006,4005,1,129,15.48,TO_DATE('15-OCT-2011','DD-MON-YYYY'),50,194.48,3005)
    INTO PURCHASE_TABLE VALUES(5010,2006,4009,5,340,238,TO_DATE('20-OCT-2011','DD-MON-YYYY'),0,2938,3005)
SELECT * FROM DUAL;

SELECT * FROM PURCHASE_TABLE;


------------------------------------------------ ser_det table -------------------------------------

CREATE TABLE SER_DET(
    SID NUMBER PRIMARY KEY,
    CID NUMBER,
    EID NUMBER,
    SPID NUMBER ,
    TYP_VEH VARCHAR(20),
    VEH_NO VARCHAR(20),
    TYPE_SER VARCHAR(20),
    SER_DATE DATE,
    QTY NUMBER,
    SP_RATE NUMBER(10,2),
    SP_AMT NUMBER(10,2),
    SP_GST NUMBER(10,2),
    SER_AMT NUMBER(10,2),
    COMM NUMBER,
    TOTAL NUMBER(10,2),
    FOREIGN KEY(CID) REFERENCES CUSTOMER_TABLE(cid),
    FOREIGN KEY(EID) REFERENCES EMPLOYEE_TABLE(EID),
    FOREIGN KEY(SPID) REFERENCES SPAREPART_TABLE(SPID)
);


INSERT all
    INTO SER_DET VALUES(6001,1001,3001,4001,'TWO WHEELER','MH15CA3228','TUBE DAMAGED',TO_DATE('02-JAN-2011','DD-MON-YYYY'),1,250,250,35,50,0,335)
    INTO SER_DET VALUES(6002,1002,3002,4002,'TWO WHEELER','MH-16U5713','FULL SERVICING',TO_DATE('04-MAR-2011','DD-MON-YYYY'),1,400,400,52,300,50,752)
    INTO SER_DET VALUES(6003,1003,3004,4005,'TWO WHEELER','MH12PQ1313','CLUCH WIRE',TO_DATE('22-AUG-2011','DD-MON-YYYY'),1,129,129,0,10,0,139)
    INTO SER_DET VALUES(6004,1002,3002,4002,'TWO WHEELER','MH-16U5713','FULL SERVICING',TO_DATE('05-MAY-2011','DD-MON-YYYY'),1,400,400,52,300,50,752)
    INTO SER_DET VALUES(6005,1004,3001,4009,'TWO WHEELER','MH-14PA335','COLOR',TO_DATE('21-OCT-2011','DD-MON-YYYY'),2.5,340,850,119,500,150,1469)
    INTO SER_DET VALUES(6006,1006,3001,4009,'TWO WHEELER','MH-12WE334','COLOR',TO_DATE('01-DEC-2011','DD-MON-YYYY'),2.5,340,850,119,500,150,1469)
    INTO SER_DET VALUES(6007,1007,3001,4001,'FOUR WHEELER','MH-17BB1345','TUBE DAMAGED',TO_DATE('01-JAN-2012','DD-MON-YYYY'),1,250,250,35,150,0,435)
SELECT * FROM DUAL;


SELECT * FROM SER_DET;


COMMIT;




-- -----------------------------------------------QUESTIONS ANSWERS -------------------------------------
-- .1 List all the customers serviced.
select distinct c.*
from CUSTOMER_TABLE c inner join SER_DET s
on c.cid = s.CID
order by c.cid;

-- .2 Customers who are not serviced.
select c.*
from CUSTOMER_TABLE c
where c.cid not in(
    select s.cid
    from ser_det s
);

-- .3 Employees who have not received the commission


-- .4 Name the employee who have maximum Commission.
select ct.eid,ct.ename,max(s.COMM)
from employee_table ct inner join SER_DET s
on ct.eID = s.eid
group by ct.eid, ct.ename
having max(s.comm) = 
        (
            select max(comm)
            from ser_det
);

-- Q.5 Show employee name and minimum commission amount received  by an employee.
select e.eid,e.ename,min(s.comm)
from EMPLOYEE_TABLE e inner join ser_det s
on e.eid= s.EID
group by e.eid,e.Ename;

-- .6 Display the Middle record from any table.
 select * from(
    select e.*, ROW_number() over(order by eid)  rn, count(*) over() cnt
    from EMPLOYEE_TABLE e
 )
 where rn = CEIL((cnt+1)/2);

--  .7 Display last 4 records of any table.
SELECT * FROM EMPLOYEE_TABLE;

SELECT * FROM
(
    SELECT * 
    FROM EMPLOYEE_TABLE
    ORDER BY EID DESC
)
WHERE ROWNUM <=4
ORDER BY EID ASC;

-- .8 Count the number of records without count function from any table.

-- .9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).

-- .10 Show the name of Customer who have paid maximum amount
select c.cid,c.cname,s.total
from customer_table c inner join SER_DET s
on c.cid = s.cid
where s.total = (
    select max(total)
    from SER_DET
);

-- 11 Display Employees who are not currently working.
select eid,ename
from EMPLOYEE_TABLE
where edol is not null; 

-- Q.12 How many customers serviced their two wheelers.
select count(distinct c.cid) two_wheeler_count
from CUSTOMER_TABLE c inner join ser_det s
on c.cid = s.cid
where lower(s.TYP_VEH) = 'two wheeler';

-- Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
select distinct s.spid ,s.spname,s.SPUNIT
from SPAREPART_TABLE s inner join PURCHASE_TABLE p
on s.spid= p.spid
inner join ser_det s2
on s2.spid = p.spid; 

-- Q.14 Customers who have Colored their vehicles.
select c.cid,c.Cname
from CUSTOMER_TABLE c inner join ser_det s
on c.cid = s.CID
where lower(s.TYPE_SER) = 'color';

-- Q.15 Find the annual income of each employee inclusive of Commission
select e.eid,e.ename, (esal*12) + nvl(sum(s.comm),0) as total_sal
from EMPLOYEE_TABLE e left join ser_det s
on e.eid = s.EID
group by e.eid,e.ename,e.esal;

-- .16 Vendor Names who provides the engine oil.
select v.vid,v.vname
from VENDORS_TABLE v inner join PURCHASE_TABLE p
on v.vid =p.vid
inner join SPAREPART_TABLE s
on p.spid = s.spid
where lower(s.spname) like '%engine oil';

-- Q.17 Total Cost to purchase the Color and name the color purchased
select s.spid,s.spname,p.TOTAL
from SPAREPART_TABLE s inner join PURCHASE_TABLE p
on s.spid = p.spid
where lower(s.spname) like '%colour%';

-- Q.18 Purchased Items which are not used in "Ser_det".
select s.spid,s.spname
from SPAREPART_TABLE s inner join PURCHASE_TABLE p 
on s.SPID = p.SPID
where not exists(
    select 1 
    from SER_DET s2
    where s.SPID = s2.spid
);

-- .19 Spare Parts Not Purchased but existing in Sparepart
select distinct spid,spname
from SPAREPART_TABLE s 
where not exists(
    select 1 
    from PURCHASE_TABLE p
    where s.spid = p.spid
);

-- .20 Calculate the Profit/Loss of the Firm. consider one month salary of
-- each employee for Calculation.
select nvl(sum(s.total),0) - nvl(sum(e.esal),0) as P_and_L
from ser_det s right join EMPLOYEE_TABLE e
on s.eid = e.eid;

-- Q.21 Specify the names of customers who have serviced their vehicles 
-- more than one time.
select c.cid,c.Cname
from CUSTOMER_TABLE c inner join ser_det s
on c.cid = s.cid 
group by c.cid,c.cname
having count(s.cid) > 1;

-- .22 List the Items purchased from vendors locationwise
select distinct s.spid,s.spname,v.vadd 
from PURCHASE_TABLE p inner join VENDORS_TABLE V
on p.vid = v.vid
inner join SPAREPART_TABLE s
on s.SPID = p.spid;

-- .23 Display count of two wheeler and four wheeler from ser_details
select lower(typ_veh) type_of_veh, count(typ_veh) as count
from ser_det
group by lower(TYP_veh)
having lower(Typ_veh) = 'two wheeler' or lower(typ_veh) = 'four wheeler';

-- 24. Display name of customers who paid highest SPGST and for which item
select c.cid,c.cname,st.spid,st.spname,s.sp_gst
from customer_table c inner join SER_DET s
on c.cid = s.cid
inner join SPAREPART_TABLE st
on st.spid = s.SPID
where s.sp_gst  =(
    select max(sp_gst)
    from ser_det
);


--  25.Display vendors name who have charged highest SPGST rate  for which item
    -- vendors_table  
    -- purchase
    -- spare parts

select v.vid,v.vname,sp.spname,max(p.SPGST)
from VENDORS_TABLE v inner join PURCHASE_TABLE p 
on v.vid = p.vid
inner join SPAREPART_TABLE sp
on sp.SPID = p.spid
group by v.vid,v.vname,sp.spname
having max(p.spgst) in(
    select max(p.spgst)
    from PURCHASE_TABLE
);

-- Q26   list name of item and employee name who have received item
-- sparepart  | purchase | emp
select sp.spid,sp.spname,e.ename
from employee_table e inner join PURCHASE_TABLE pt
on e.eid = pt.rcv_eid
inner join SPAREPART_TABLE sp
on sp.spid = pt.spid
order by sp.spid;

-- 27 Display the Name and Vehicle Number of Customer who serviced 
-- his vehicle, 
-- And Name the Item used for Service, 
-- And specify the purchase date of that Item 
-- with his vendor and Item_Unit and Location, 
-- And employee Name who serviced the vehicle. 
-- for Vehicle NUMBER "MH-14PA335".'


-- 28 who belong this vehicle  MH-14PA335" Display the customer name
select c.cid,c.cname
from CUSTOMER_TABLE c inner join ser_det st
on c.cid =st.cid
where lower(veh_no) = 'mh-14pa335';


-- Q29 Display the name of customer who belongs to New York and when 
-- he /she service their  vehicle on which date
select c.cid,c.cname,c.cadd,to_char(sd.ser_date,'DD-MON-YYYY') ser_date
from CUSTOMER_TABLE c inner join ser_det sd
on c.cid = sd.cid
where lower(c.cadd) = 'new york';

--  30 from whom we have purchased items having maximum cost?
-- vendor | purchase
select v.vid,v.vname,pt.total
from vendors_table v inner join PURCHASE_TABLE pt
on v.vid = pt.vid
where pt.total =(
    select max(total)
    from PURCHASE_TABLE
);

-- 31 Display the names of employees who are not working as Mechanic 
-- and that employee done services   .
select distinct e.eid,e.ename,e.ejob
from employee_table e inner join SER_DET sd
on e.eid = sd.eid
where lower(ejob) <> 'mechanic';

-- 32 Display the various jobs along with total number of employees in 
-- each job. The output should
-- contain only those jobs with more than two employees.

select ejob,count(ename)
from employee_table
group by ejob 
having count(ename) > 2;

-- Q33 Display the details of employees who done service and give them 
-- rank according to their no. of services .
select e.eid,e.ename,count(sd.eid) no_of_services, dense_rank() over(order by count(sd.eid) desc) as rank
from EMPLOYEE_TABLE e inner join ser_det sd
on e.eid = sd.EID
group by e.eid ,e.ename;

-- Q 34 Display those employees who are working as Painter and fitter and
-- who provide service 
-- and total count of service done by fitter and painter
select e.eid,e.ename,e.ejob,count(sd.sid) no_of_ser
from employee_table e inner join ser_det sd
on e.eid =sd.eid
group by e.eid,e.ename,e.ejob
having lower(e.ejob) in ('fitter','painter');

-- 35.Display employee salary and as per highest salary provide Grade 
-- to employee 


-- 36.display the 4th record of emp table without using group by and rowid
select * from(
select ename, dense_rank() over(order by(eid)) as ra
from employee_table
)
where ra = 4;


-- 37 Provide a commission 100 to employees who are not earning any 
-- commission.
select e.eid,e.ename,
case
    when nvl(sum(sd.comm),0) = 0 then 100
    else sum(sd.comm)
end as New_COMM
from employee_table e left join ser_det sd
on e.eid=sd.eid
group by e.eid,e.ename;


-- 38 write a query that totals no. of services  for each day and place the 
-- results
-- in descending order
select ser_date,count(*) total_ser
from ser_det
group by ser_date
order by total_ser desc;

-- Q39 Display the service details of those customer who belong from same city 
select s.*
from ser_det s join CUSTOMERs_TABLE c 
on s.cid = c.cid
where c.cadd in(
    select cadd
    from customers_table
    group by cadd
    having count(*) >1
);

-- Q40 write a query join customers table to itself to find all pairs of
-- customers service by a single employee
select c1.cname customer_01,c2.cname customer_02 
from CUSTOMER_TABLE c1 inner join customer_table c2
on c1.cid = c2.cid
where c1.cid <> c2.cid;

-- Q41 List each service number follow by name of the customer who
-- made  that service
select sd.sid service_number, c.cname customer_number
from ser_det sd inner join customer_table c
on sd.cid = c.cid;

-- Q42.42 Write a query to get details of employee and provide rating on 
-- basis of  maximum services provide by employee  .Note (rating should 
-- be like A,B,C,D)
SELECT e.eid,e.ename,e.EJOB,count(sd.sid) as total_service,
    case 
    when count(sd.sid) >= 4 then 'A'
    when count(sd.sid) = 3 then 'B'
    when count(sd.sid) = 1 then 'c'
    else 'D'
    end as rating
from employee_table e left join ser_det sd
on e.eid = sd.eid
group by e.eid,e.ename,e.EJOB
order by total_service desc;

-- Q43 Write a query to get maximum service amount of each customer 
-- with their customer details ?
select c.cid,c.cname,max(s.total) maximum_service_amount
from customer_table c inner join ser_det s
on c.cid = s.cid
group by c.cid,c.cname
order by cid;

-- Q44 Get the details of customers with his total no of services ?
select c.cid,c.cname,count(s.sid) total_no_service
from customer_table c inner join ser_det s
on c.cid = s.cid
group by c.cid,c.cname
order by cid;

-- Q45 From which location sparpart purchased  with highest cost ?

-- 46 Get the details of employee with their service details who has salary
-- is null
update EMPLOYEE_TABLE
set esal = null
where eid = 3000;

commit;
rollback;

select e.*,s.*
from employee_table e left join ser_det s
on e.eid = s.eid
where e.esal is null ; 

-- 47 find the sum of purchase location wise 


-- Q48 write a query sum of purchase amount in word location wise ?
-- TO_CHAR(...,'JSP')


-- 49 Has the customer who has spent the largest amount money has
-- been give highest rating


-- Q50 select the total amount in service for each customer for which
-- the total is greater than the amount of the largest service amount in the 
-- table


-- Q51  List the customer name and sparepart name used for their vehicle 
-- and  vehicle type

select c.cname,sp.SPNAME, s.veh_no, s.typ_veh
from CUSTOMER_TABLE c inner join ser_det s
on c.cid = s.cid
inner join SPAREPART_TABLE sp
on s.spid = sp.spid
order by c.cname;

-- 52 Write a query to get spname ,ename,cname quantity ,rate ,service 
-- amount for record exist in service table
select sp.SPNAME,e.ename,c.cname,sd.qty,sd.SP_RATE,sd.SER_AMT
from ser_det sd inner join SPAREPART_TABLE sp
ON sd.SPID = sp.SPID
JOIN EMPLOYEE_TABLE e
ON sd.EID = e.EID
JOIN CUSTOMER_TABLE c
ON sd.CID = c.CID
ORDER BY c.cname,e.ename;

-- Q53 specify the vehicles owners who’s tube damaged.
select c.cName,sd.veh_no,sd.type_ser
from ser_det sd inner join customer_table c
on sd.cid = c.cid
where lower(sd.type_ser) = 'tube damaged';

-- Q.54 Specify the details who have taken full service.
select c.cName,sd.*
from ser_det sd inner join customer_table c
on sd.cid = c.cid
where lower(sd.type_ser) = 'full servicing';

-- Q.55 Select the employees who have not worked yet and left the job.
select e.EID , e.ename, e.edoj, e.edol
from employee_table e 
where e.edol is not null 
AND not exists(
    select 1
    from ser_det S
    where s.eid = e.eid
);

-- .56  Select employee who have worked first ever.
select e.eid, e.ename, e.ejob,s.ser_date
from employee_table e inner join ser_det s
on e.eid = s.eid
where s.ser_date =(
    select min(ser_date)
    from ser_det
);

-- Q.57 Display all records falling in odd date
SELECT *
FROM SER_DET
WHERE MOD(TO_NUMBER(TO_CHAR(SER_DATE, 'DD')), 2) = 1;

-- Q.58 Display all records falling in even date
SELECT *
FROM SER_DET
WHERE MOD(TO_NUMBER(TO_CHAR(SER_DATE, 'DD')), 2) = 0;

-- Q.59 Display the vendors whose material is not yet used.
select v.vid,v.vname,v.vadd
from VENDORS_TABLE v inner join PURCHASE_TABLE p
on v.vid = p.vid
where not exists(
    select 1 from ser_det s
    where s.spid = p.spid
);


-- Q.60 Difference between purchase date and used date of spare part.
select p.pid,p.spid,p.pdate ,s.ser_date, ABS(s.ser_date - p.pdate) as days_diff
from PURCHASE_TABLE p inner join ser_det s
on p.spid = s.spid 
order by days_diff;


