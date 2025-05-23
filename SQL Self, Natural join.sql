create database regex;
use regex;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from orders1;

select o.oid, o.city, o.pid, p.pname from orders1 as o
join product as p where o.pid=p.pid;

select o.oid, o.city, o.pid, p.pname from product  as p
 left join orders1 as o on o.pid=p.pid;
 
 use sakila;
 select * from actor;
 select * from film_actor;
 select * from film;
 
 select fa.actor_id, fa.film_id, f.title from film_actor as fa
 join film as f where fa.film_id=f.film_id;
 
 select fa.actor_id, f.title, f.length from film_actor as fa
 join film as f where f.length>100;
 
 select actor_id, count(film_id), title from film_actor group by title;
 
 select title, film_id, rating from film where rating='NC-17' order by film_id;
 
 -- self join
 use sakila;
 
 create table employee1(eid int, ename varchar(20), manager_id int);
 insert into employee1 values(10, "govind", null), (11, "aman", 12), (12, "adi",10),(13, "sakhi",11);
 
 select * from employee1;
 
 select emp.eid, emp.ename, emp.manager_id, manager.eid, manager.ename from employee1 as emp 
 join employee1 as manager where emp.manager_id=manager.eid;
 
 select emp.eid, emp.ename, emp.manager_id,manager.eid, manager.ename from employee1 as emp
 join employee1 as manager where emp.manager_id=manager.eid;
 
 -- Natural join 
 
use sakila;

select * from payment;

select customer_id, count(payment_id) from payment where customer_id>3 group by customer_id;
 
 select customer_id, count(payment_id) from payment group by customer_id having count(payment_id);


 select customer_id, count(payment_id) from payment where customer_id not in (2,3) group by customer_id having count(payment_id)>35; 
 
select  amount, count(payment_id) from payment group by amount;

select count(customer_id), amount from payment where amount not in (2.99, 0.99) group by amount;

select amount, sum(rental_id), sum(amount) from payment where amount in (2.99, 0.99, 5.99) group by amount  having  sum(rental_id)>1000;

select * from actor;
select * from film_actor;


select a.actor_id, a.first_name, fa.film_id from actor as a
join film_actor as fa on a.actor_id=fa.actor_id; 

select a.actor_id, count(film_id) from actor as a
join film_actor as fa on a.actor_id=fa.actor_id group by a.actor_id having count(film_id)>25;  