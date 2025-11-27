show databases;
use datamites_sql;
show tables;

select * from emp;
select * from orders;

-- where condition

select * from emp where job="salesman";

select ename,job from emp where job="salesman";

-- unique value
select distinct job from emp;

-- ORDER BY
select * from emp order by sal;
select * from emp order by sal desc;

-- check the null values
select * from emp where comm is null;

select max(sal) from emp where comm is not null;

-- between operator 
select * from emp where sal between 750.0 and 2000.0;

select * from products;

select * 
from products
where category="Furniture" and sub_category="Chairs";

select * 
from products
where category="Furniture" or sub_category="Chairs";






