use sakila;

with cte as
(select * from actor where actor_id<6
order by actor_id desc
)

select * from cte;

-- order of execution
-- offset

select * from actor order by actor_id limit 2,5;

-- order of execution
-- 1) FROM/JOIN, 2) WHERE, 3) GROUP BY, 4) HAVING, 5) SELECT, 6) DISTINCT, 7) ORDER BY, and 8) LIMIT/OFFSET. 

-- multi rom subquery
select * from film_actor where film_id=140;

select actor_id from film_actor where film_id=140;

select * from film_actor where actor_id in (select actor_id from film_actor where film_id=140);

-- windows function
-- case 
-- case when condition then ?
-- 	when condition then 
-- end

select *, 
case when actor_id=1 then "flop"
	when actor_id=2 then "hit"
end
from film_actor;

select *, 
case when actor_id=1 then "flop"
	when actor_id=2 then "hit"
end as status
from film_actor;

select *, 
case when actor_id=1 then "flop"
	when actor_id=2 then "hit"
	else "average"
    end as status
from film_actor;

select actor_id, count(film_id),
case when count(film_id)=1 then "actor has worked in a movie"
	when count(film_id)>10 then "actor has woerked in more the 10 movies"
end
from film_actor group by actor_id;

create database jadoun;

use jadoun;

CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

select *,
sum(saleamount) over() from employeesales;

select *,
sum(saleamount) over(),
(saleamount/sum(saleamount) over() )*100 from employeesales;

select *,
sum(saleamount) over(partition by department) from employeesales;

select *,
sum(saleamount) over(partition by employeename ) from employeesales;

select *,
sum(saleamount) over(partition by employeename order by employeeid) from employeesales;

select *,
sum(saleamount) over(partition by employeename order by department ) from employeesales;


select *,
sum(saleamount) over(partition by employeename order by saledate ) from employeesales;

select *,
sum(saleamount) over(partition by employeename order by saleamount ) from employeesales;

select *,
sum(saleamount) over(partition by department order by employeename) from employeesales;

select *,
sum(saleamount) over(partition by department order by saleamount) from employeesales;

update employeesales set saleamount=2100 where employeeid=8 and saledate='2025-06-04';

select *,
sum(saleamount) over(partition by department order by saleamount) from employeesales;

select *, 
rank() over(partition by department) from employeesales;

select *, 
rank() over(partition by department order by employeeid) from employeesales;

select *, 
rank() over(partition by department order by saleamount desc)
from employeesales;

select *, 
rank() over(partition by department order by saleamount desc),
dense_rank() over(partition by department order by saleamount desc) 
from employeesales;

-- lead(), lag()

select *, 
lead(saledate) over()
from employeesales;

select *, 
lead(saledate,1) over()
from employeesales;

select *,
lead(saledate,1) over() as nextday, 
lead(saledate,2) over()
from employeesales;

with cte as
(
select *,
lead(saledate,1) over() as nextday, 
lead(saledate,2) over()
from employeesales)


select * from cte where datediff(nextday, saledate)=1;