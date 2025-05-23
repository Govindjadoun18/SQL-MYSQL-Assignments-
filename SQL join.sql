use sakila;

drop database regex;

select * from actor;

select * from film_actor;

select f.film_id, f.actor_id from film_actor as f
join actor as a;

create database regex;
use regex;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);
select * from product;
select * from orders1;

select o.oid, o.city, o.pid, p.pname from orders1 as o
join product as p where o.pid=p.pid;

select o.oid, o.city, o.pid, p.pname from orders1 as o
INNER join product as p where o.pid=p.pid;

select o.oid, o.city, o.pid, p.pname from orders1 as o
left join product as p on o.pid=p.pid;

select o.oid, o.city, o.pid, p.pname from product as o
INNER join orders1 as p where o.pid=p.pid;

use sakila;

select * from actor;
select * from film_actor;
select * from film;

select fa.actor_id, fa.film_id, f.film, f.title  from film_actor as fa
join film as f on fa.film_id= f.film_id;

select actor_id, length(title) from film where  length(title)>100;
use sakila;
select * from film;
select film_id, title, rating from film where rating="NC-17"
order by film_id desc;

select a.actor_id, count(fa.film_id) from film_actor as fa group by actor_id
join actor as a on fa.actor_id=a.actor_id;

use sakila;

select * from actor;
select * from film_actor;

select fa.actor_id, fa.film_id from film_actor as fa
join actor as a where fa.actor_id=a.actor_id;
