-- datatype in SQL
-- Datatype 
-- Numbers( int, float, double)
-- character (char, varchar, string)
-- date, timestamp
-- create statement 

use sakila;

create table test(id int);
insert into test values(12);
select * from test;

create table test2( id tinyint);
insert into test2 values(127);
select * from test2;

-- unsigned
create table test3( id tinyint unsigned);
insert into test3 values(255);
select * from test3;

create table test4( id decimal(5,2) );
insert into test4 values(456);
insert into test4 values(675.7889);
insert into test4 values(4560.788);
insert into test4 values(456);
select * from test4;

create table test5( fname char(5) ); -- fixed length character
insert into test5 values('hi');
insert into test5 values('yothbjj');
select  * from test5;

create table test6( fname varchar(5) ); -- varchar-variable character
insert into test6 values('hihhk    ');
insert into test6 values('yot  ');
select  fname, char_length(fname) from test6;

-- date and timestamp
create table test7( dob date);
insert into test7 values('2025-04-21'); -- correct format
insert into test7 values('01-02-2022'); -- incorrect format
select * from test7;

create table test8( dob timestamp );
insert into test8 values( '2024-06-07 11:23:56');
insert into test8 values( now() );
select * from test8;

-- BLOB?

-- subquery 
-- query within a query

select payment_id, amount from payment;
select amount from payment where payment_id=15;

select * from payment where amount=(select amount from payment where payment_id=15);

select staff_id from payment where rental_id=1422;

select payment_id, customer_id, rental_id, amount, staff_id from  payment where staff_id=(select staff_id from payment where rental_id=1422);