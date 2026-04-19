select * from hr.employees;

create table test(
    id number PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    age number CHECK( age > 18),
    salary number CHECK( salary > 0) NOT NULL
);

select * from test;

insert into test values(1,'john',24,5000);

INSERT into  test 