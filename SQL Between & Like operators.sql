show databases;

use sakila;

show tables;

select * from actor;

select actor_id, last_name from actor;

select actor_id, actor_id*10, last_name from actor;

select * from actor;

select * from actor where actor_id=2;

select * from actor where actor_id=7;

select * from actor where first_name='ED';

select * from actor where first_name='ED' and actor_id>100;

select * from actor where first_name='ED' or actor_id>100;

select * from actor where actor_id>10 and actor_id<25;

-- comment between operator between lower and higher

select * from actor where actor_id between 10 and 25;

select * from actor where actor_id between 11 and 24;

select actor_id, first_name from actor where actor_id=5;

select first_name from actor where actor_id=6;

select * from actor where actor_id= 2 or actor_id=5;

select * from actor where actor_id in (2,5);

select * from actor where actor_id in (2,5,40000);

-- like operator=> patter par kaam karega

select * from actor where first_name="NICK";
    
select * from actor where first_name like "NICK";
    
select * from actor where first_name like "N%";
-- for first character should be N and no matter how many character are behind or not
     
select * from actor where first_name like "%S"
-- last character should be S and no matter how many characters are ahead or not

select * from actor where first_name like "S%T";

select * from actor where first_name like "ED%";

select * from actor where first_name like "JOE%";

select * from actor where first_name like "_A%";

select * from actor where actor_id=3 or actor_id=5 or actor_id=7;

select * from actor where actor_id in (3,5,7);

select * from actor where actor_id not between 3 and 100;

select * from actor where first_name like "_E%R";

select first_name from actor where first_name like "%NN%";

select * from actor where first_name like "_____";

select * from actor where first_name like "_A%T%H__";

select * from actor where first_name like '%S__';

select * from actor where actor_id between 3 and 7;

select * from actor where actor_id>=3 and actor_id<=7;