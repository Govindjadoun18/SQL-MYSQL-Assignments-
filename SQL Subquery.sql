-- # Single row subquery

use sakila;

select * from payment;

select amount from payment where payment_id=6;

select * from payment where amount=(select amount from payment where payment_id=6);

select actor_id from actor where first_name="ED" and last_name="CHASE";

select * from actor;

select * from actor where actor_id>(select actor_id from actor where first_name="ED" and last_name="CHASE");

select * from payment;

select month(payment_date) from payment where payment_id=5;

select * from payment where month(payment_date)=(select month(payment_date) from payment where payment_id=5);

select * from payment;

select rental_id from payment where payment_id=7 and amount<5;

select customer_id, payment_id, amount from payment where rental_id<(select rental_id from payment where payment_id=7 and amount<5);

select count(Payment_id) from payment where amount=5.99;

select amount, count(payment_id) from payment group by amount  having count(payment_id)>(select count(Payment_id) from payment where amount=5.99);

-- # Multi row subquery

select amount from payment where payment_id in (3,1);

select * from payment where amount=(select amount from payment where payment_id in (3,1) );

select * from payment where amount in (select amount from payment where payment_id in (3,1) );

select * from payment where amount=any(select amount from payment where payment_id in (3,1) );

select * from payment where amount>any(select amount from payment where payment_id in (3,1) );

select * from payment where amount<any(select amount from payment where payment_id in (3,1) );

select * from payment where amount>all(select amount from payment where payment_id in (3,1) );

select * from payment where amount>=all(select amount from payment where payment_id in (3,1) );

select * from payment where amount<all(select amount from payment where payment_id in (3,1) );