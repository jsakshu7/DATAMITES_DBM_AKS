show databases;
create database akshatha_db;

drop database akshatha_db;

-- this syntax is comment line

-- create database of an employee
create database Accenture_db;

-- show the available databases
show databases;

-- select the database Accenture_db
use  Accenture_db;

create table employee_info
(emp_id int,
emp_name varchar(120),
emp_age int,
emp_doj date);

-- how to see the structure of the table
desc employee_info;

-- insert the values in the database
insert into employee_info values
(1,"amit",32,"2025-9-2");

-- how to see the complete table,* indicates to retrieve all columns
select * from employee_info;

-- insert multiple rows
insert into employee_info values
(2,"bhavya",30,"2023-12-2"),
(3,"charan",18,"2022-10-5"),
(4,"diya",20,"2023-5-25");

-- how to give constraints to the columns

create table employee_details 
(emp_id varchar(10) primary key,
emp_name varchar(120) not null,
emp_salary int default 15000,
emp_doj date,
emp_age int check(emp_age>20));

desc employee_details;

-- insert valid datas
insert into employee_details values
("ES001","ANKIT",25000,"2025-2-9",22),
("ES002","BHUMANSHI",45000,"2022-2-22",30),
("ES003","CHARVI",15000,"2022-12-2",32);

select * from employee_details;

-- insert invalid datas

-- insert duplicate values for emp_id "ES001"
insert into employee_details values
("ES001","SAHANA",25000,"2025-2-22",25);

-- insert the values without emp_name
insert into employee_details (emp_id,emp_salary,emp_doj,emp_age) values
("ES006",25000,"2025-2-22",25);

-- insert the values without emp_salary
insert into employee_details (emp_id,emp_name,emp_doj,emp_age) values
("ES006","jancy","2025-2-22",25);

select * from employee_details;

-- insert the values without emp_doj
insert into employee_details (emp_id,emp_name,emp_age) values
("ES007","naveen",35);

select * from employee_details;

-- insert emp_age is 12
insert into employee_details (emp_id,emp_name,emp_age) values
("ES008","pravas",15);

-- ============================================================
-- 								update table
-- =============================================================

set SQL_SAFE_UPDATES=0;

select * from employee_details;

update employee_details set emp_age=30 where emp_id="ES001";

select * from employee_details;




select * from employee_info;


-- 3-9-2025

use  Accenture_db;
show tables;
select * from employee_details;

-- update emp_doj for the emp_id=ES007
update  employee_details set emp_doj="2025-05-12" where emp_id="ES007";
select * from employee_details;

set sql_safe_updates=0;
-- update emp_age=40 where emp_salary=15000
update employee_details set emp_age=40 where emp_salary=15000;
select * from employee_details;

-- update salary of the employee naveen and jancy
update employee_details set emp_salary=30000 where emp_name="jancy" or emp_name="naveen";
select * from employee_details;

delete from employee_details where emp_name="ANKIT";
select * from employee_details;

delete from employee_details where emp_name in ("jancy","naveen");

select * from employee_details;

-- ================================================================
-- 					alter the table
-- ==================================================================

-- adding new column to the existing table
alter  table employee_details add emp_gender varchar(10);
select * from employee_details;
desc employee_details;

update employee_details set emp_gender="female";
select * from employee_details;

-- adding multiple columns
alter  table employee_details add emp_dept varchar(10),add emp_status varchar(10);
select * from employee_details;
update employee_details set emp_dept="HR" , emp_status="full time";
select * from employee_details;

-- Deleting column
alter table employee_details drop emp_gender;
select * from employee_details;

alter table employee_details drop emp_dept,drop emp_status;
select * from employee_details;

-- rename the table name
alter table employee_details rename to employee_data;
select * from employee_data;

-- rename column name
alter table employee_data change column emp_name name_of_employee varchar(100);
select * from employee_data;

-- ===============================================================================

-- ===================================================
--           joins the table
-- ===================================================


-- Create database joins

create database joins;

use joins;
create table employee
(empid varchar(10) primary key , empname varchar(20) , salary int , deptid varchar(10) );
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


