-- DQL:=> window functions

use sakila;

select payment_id, customer_id, amount from payment;

select avg(amount) from payment;

select payment_id, customer_id, amount,  4.20 from payment;

select payment_id, customer_id, amount, (select avg(amount) from payment ) from payment;

select customer_id, avg(amount) from payment group by customer_id;

select payment_id, customer_id, amount, avg(amount) over() from payment;

select payment_id, customer_id, amount, avg(amount) over(), sum(amount) over() from payment;

select payment_id, customer_id, amount, avg(amount) over(), sum(amount) over(), max(amount) over() from payment;

select payment_id, customer_id, amount, avg(amount) over(), avg(amount) over(partition by customer_id) from payment;

-- running sum

select payment_id, customer_id, amount,sum(amount) over(order by customer_id) from payment;

select payment_id, customer_id, amount,sum(amount) over(order by payment_id) from payment;

select payment_id, customer_id, amount,sum(amount) over(order by customer_id), sum(amount) over(partition by customer_id order by payment_id) from payment;

use employees;

select * from salaries;

select emp_no, salary, sum(salary) over(), avg(salary) over() from salaries;

select emp_no, salary, year(from_date), avg(salary) over(partition by emp_no) from salaries;


create table salary1 
as select * from salaries limit 200; 

select * from salary1;

select emp_no, salary, sum(salary) over(partition by emp_no order by from_date) from salary1;


-- rank(), dense_rank(), row_number()