-- order by, alias, multi-row functions

use sakila;

select * from actor order by first_name, actor_id desc;

select actor_id, actor_id+10 as "newactor" from actor;

-- sum, count, max, min, avg

select * from payment;

select distinct(customer_id) from payment;

select count(customer_id), count(distinct(customer_id)) from payment;

select count(customer_id) as totalcustomer, count(distinct(customer_id)) as uniquecustomer, count(customer_id)-count(distinct(customer_id)) as "repeatativecustomer" from payment;

select count(amount), sum(amount), avg(amount), max(amount), min(amount) from payment;

select sum(amount), amount from payment;

-- group by
select customer_id from payment group by customer_id;

select customer_id, count(amount), sum(amount) from payment group by customer_id;

select amount, count(amount) from payment group by amount;

select staff_id, count(rental_id), sum(amount), max(rental_id), from payment group by staff_id;

select extract( month from Payment_date), count(customer_id), max(rental_id), min(rental_id), avg(amount) from payment group by extract( month from payment_date);

select staff_id, count(rental_id), sum(amount), max(rental_id), from payment group by staff_id;

use sakila;

select * from actor order by first_name;

select actor_id from actor order by first_name;

select * from actor order by first_name, actor_id desc;

select actor_id, actor_id+10 from actor;

select actor_id, actor_id+10  as "newactor" from actor;

select * from payment;

select distinct( customer_id) from payment;

select count( customer_id) from payment;

select count(distinct( customer_id) ) from payment;

select count( customer_id), count(distinct( customer_id) ) from payment;

select count( customer_id), count(distinct( customer_id)), count( customer_id)-count(distinct( customer_id)) as repeatativecust from payment;

select count( customer_id ) as totalcustomer, count(distinct( customer_id)) as uniquecustomer, count(customer_id)-count( distinct( customer_id ) ) as  repeatativecust from payment;

select count(amount), sum(amount), avg(amount), max(amount), min(amount) from payment; 

select sum(amount), amount from payment;

select sum(amount) from payment where customer_id=1;

select customer_id from payment group by customer_id;

select customer_id, count(amount), sum(amount) from payment group by customer_id;

select amount, count(amount) from payment group by amount order by amount; 

select staff_id, count(rental_id), sum(amount), max(rental_id) from payment group by staff_id order by staff_id;

select month(payment_date), count( customer_id), max(rental_id), min(rental_id), avg(amount) from payment group by month(payment_date) order by month(payment_date);

select extract( month from payment_date), count( customer_id), max(rental_id), min(rental_id), avg(amount) from payment group by extract(month from payment_date) order by extract(month from payment_date);

