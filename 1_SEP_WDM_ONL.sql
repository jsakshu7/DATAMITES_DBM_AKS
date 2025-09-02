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















