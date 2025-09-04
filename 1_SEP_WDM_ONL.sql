show databases;
create database employee_db;
show databases;

use employee_db;

-- this is comment statements
-- create employee table with 6 attributes
create table employee_data
(emp_id int,
emp_name varchar(25),
emp_age int,
emp_salary int,
join_date date,
emp_job varchar(30));

-- To Check how many tables are there in employee_db
show tables;

-- how to see the structure of table
desc employee_data;

-- insert values into the table
insert into employee_data values
(1,"ananya",20,25000,"2025-12-1","HR");

--  insert multiple rows
insert into employee_data values
(2,"bhavya",22,22000,"2025-11-1","admin"),
(3,"chetan",21,10000,"2025-1-1","intern");

-- how to view the  table 
select * from employee_data;


-- how to delete the table
drop table employee_data;

drop database employee_db;

-- completed with create-db,tables and drop db,tables
-- Example 2: Create a new db and create table with constraints

create database wipro_db;

-- how to view the databases
show databases;
use wipro_db;

-- create a table with constraints
create table emp_info
(emp_id varchar(10) primary key,
emp_name varchar(120) not null,
emp_salary int default 20000 ,
emp_job varchar(30) not null,
emp_doj date,
emp_age int check(emp_age>20));

desc emp_info;

insert into emp_info values
("ES001","AKASH",25000,"MANGER","2025-12-02",22),
("ES002","BHANU",21000,"HR","2025-11-02",23),
("ES003","CHARAN",30000,"SALES","2024-02-02",29),
("ES004","DIYA",45000,"MANGER","2025-12-22",30);

select * from emp_info;

-- 3-SEP-2025
use wipro_db;
select * from emp_info;

-- checking error for duplicate values in the emp_id
insert into emp_info values
("ES001","ASIF",10000,"HR","2025-12-02",22);

-- check for null value in emp_name--error:doesn't have default value
insert into emp_info (emp_id,emp_salary,emp_job,emp_doj,emp_age) values
("ES005",25000,"MANGER","2025-12-02",22);

-- check for salary constraint. no error
insert into emp_info (emp_id,emp_name,emp_job,emp_doj,emp_age) values
("ES005","charan","MANGER","2025-12-02",22);

select * from emp_info;

-- check for emp_doj
insert into emp_info (emp_id,emp_name,emp_job,emp_age) values
("ES006","saif","developer",22);


select * from emp_info;

-- check for emp_age<20:error---> constraint error
insert into emp_info (emp_id,emp_name,emp_job,emp_age) values
("ES007","pradeep","sales",16);

-- ==============================================================
--  				update the table
-- ==============================================================

set SQL_SAFE_UPDATES=0;

select * from emp_info;

update emp_info set emp_doj="2024-9-8" where emp_name="saif";

select * from emp_info;

-- UPDATE the age of an employee who's id is ES001
update emp_info set emp_age=30 where emp_id="ES001";

select * from emp_info;


update emp_info set emp_job= "sales" where emp_name="BHANU";
select * from emp_info;

update emp_info set emp_salary= "50000" where emp_job="MANGER";
select * from emp_info;

delete from emp_info where emp_id="ES005";
select * from emp_info;

update emp_info set emp_age=40 where emp_name="BHANU" or emp_name="DIYA";
select * from emp_info;

delete from emp_info where emp_name="saif";
select * from emp_info;


-- ============================================================
desc emp_info;

-- change the data type of salary to numeric
alter table emp_info modify emp_salary numeric;
desc emp_info;

-- add new column
alter table emp_info add emp_gender varchar(10);
desc emp_info;

-- add multiple columns
alter table emp_info add emp_dept varchar(10),add emp_status varchar(10);
desc emp_info;

update emp_info set emp_dept="pharmacy",emp_status="FULL TIME";
select * from emp_info;


alter table emp_info drop column emp_gender;
select * from emp_info;

alter table emp_info drop column emp_dept ,drop emp_status ;
select * from emp_info;


-- rename the table:change the table name to emp_details
alter table emp_info  rename to emp_details;
select * from emp_details;
-- error for old table name
select * from emp_info;


-- ===================================================
--           joins the table
-- ===================================================


-- Create database joins

create database joins_db;

use joins_db;
create table employee
(empid varchar(10) primary key , empname varchar(20) , salary int , deptid varchar(10)  );
insert into employee values
('E1' ,'John' , 450000 , 'D1') ,
('E2' ,'Mary',73000,'D2'),
('E3' ,'Steve',86000,'D3'),
('E4' ,'Helen',60000,'D4'),
('E5','Joe',35000,'D7');


select * from employee;

-- Create department table
create table department 
(deptid varchar(10) primary key , deptname varchar(10),dept_head varchar(50) );
insert into department values
('D1','HR',"joyal"),
('D2','Admin',"jayant"),
('D3','Sales',"radha"),
('D4','IT',"roshan"),
('D5','HR',"samule");
select * from department;
select * from employee;



-- inner join
-- returns all the record which is mayching in both the table
select e.empid,e.empname,e.salary,e.deptid,d.deptid,d.deptname
from employee as e
inner join department as d
on e.deptid=d.deptid;


-- right join
select e.empid,e.empname,e.salary,e.deptid,d.deptid,d.deptname
from employee as e
right join department as d
on e.deptid=d.deptid;

-- left join
select e.empid,e.empname,e.salary,e.deptid,d.deptid,d.deptname
from employee as e
left join department as d
on e.deptid=d.deptid;
-- outer join
select e.empid,e.empname,e.salary,e.deptid,d.deptid,d.deptname
from employee as e
right join department as d
on e.deptid=d.deptid
union
select e.empid,e.empname,e.salary,e.deptid,d.deptid,d.deptname
from employee as e
left join department as d
on e.deptid=d.deptid;

-- =============================================================================================
-- 								queries and sub queries
-- ===========================================================================================
create database employee_query;
use employee_query;

create table employee 
(emp_id int primary key ,emp_name varchar(30) , dept_name varchar(20) , emp_salary int );
insert into employee values
(101 , 'John', 'HR' , 10000),
(201,'Mary','Finance',20000),
(301,'Zara','IT',30000),
(401,'Rida','Sales',50000),
(501, 'Ram','HR',40000),
(601,'Varun','IT',70000),
(701,'Araav','HR',60000),
(801,'Joy','IT',90000),
(302,'Arun','Sales',40000),
(403,'Joe','Finance',35000),
(704,"Dia","Finance",26000);

select * from employee;

-- find the unique names in the dept col
select distinct(dept_name)
from employee;

-- find max,min,avg,sum,count--(agreegatefun) in emp_salary
select max(emp_salary) from employee;
select min(emp_salary) from employee;
select avg(emp_salary) from employee;
select sum(emp_salary) from employee;

select min(emp_salary), max(emp_salary), avg(emp_salary), sum(emp_salary) from employee;

-- find number of employee
select count(emp_name) from employee;

-- find the details of the employees belongs to sales dept
select emp_id,emp_name ,dept_name 
from employee 
where dept_name ="sales";

select * 
from employee 
where dept_name ="sales";

-- find the name of the employee belongs to sales dept whos's salary is 40000

select emp_name
from employee 
where dept_name='sales' and emp_salary=40000;

-- find the details of the employess who's salary is less than 40000 
select * from employee where emp_salary<40000;

-- find the salary of the employee who's name is Dia
select salary,emp_name from employee where emp_name="Dia";

-- find the employee name who is getting max salary
select max(emp_salary) from employee;

select emp_name
from employee
where emp_salary=90000;

-- sub query
select emp_name
from employee
where emp_salary=(select max(emp_salary) from employee);

-- find the employee name who is getting min salary
select emp_name
from employee
where emp_salary=(select min(emp_salary) from employee);

-- find the employee name who is getting more than avg salary
select emp_name
from employee
where emp_salary>(select avg(emp_salary) from employee);

-- find the employee details who's taking salary greater than employee with an id 701
select * 
from employee 
where emp_salary > (select emp_Salary from employee where emp_id=701);

-- find number of employees in each dept
select dept_name,count(emp_name)
from employee
group by dept_name;

-- find the highest salary in each dept
select max(emp_salary)
from employee
group by dept_name;


-- find the details of the employee who's getting highest salary in each dept
select * 
from employee
where emp_salary in (select max(emp_salary)
					from employee
					group by dept_name);
                    
                    
-- find the second highest salary
select max(emp_salary)
from employee
where emp_salary <(select max(emp_salary)from employee);


select emp_salary
from employee
where emp_salary <(select max(emp_salary)from employee)
order by emp_salary
desc limit 1;
