-- string fuctions 
-- numbers, date

-- dual

select 8*1456 from dual;

-- now()

select sysdate(), curdate(), curtime(), current_timestamp(), now() from dual;

select now(), adddate( now(), 2) from dual;

select now(), adddate( now(), interval 2 month) from dual;

select now(), adddate( '2025-05-16 17:21:05', '2025-05-30 17:21:05') from dual;

select datediff( select now(), adddate( now(), 2) from dual;

select last_day(now()) from dual;

select extract( year from now() ) from dual;

select extract( minute from now() ) from dual;

select extract( month from now() ) from dual;

select now(), date_format(now(), 'this year is %Y') from dual;

-- %Y => access modifier

-- round(), truncate(), pow, floor(), ceil

select 24.234, round(24.234), round(26.671, 1) from dual;

select round( 24.56, -1) from dual;

select round( 24.56, -2) from dual;

select round( 324.56, -2) from dual;

select round( 324.56, 1), truncate( 364.37, 1) from dual;

select mod(11,2), pow(2,3), floor(10.9999), ceil(9.00001) from dual;

-- if(conditon, True, False)
-- if(conditon, True, if( condition,True, False)

use sakila;

select * from actor;

select if(first_name="NICK", "YES", if(first_name="ED", "hello", "NO")) from actor;

select actor_id, if(actor_id%2=0, concat(first_name, last_name), if(actor_id%2!=0, concat(first_name, '&' , last_name, "NO") from actor;

select actor_id, first_name,
case
	when mod(actor_id,2)=0 then "YES"
    when actor_id=5 then "####YES####"
    else "NO"
end
from actor;

select sysdate(), curdate(), curtime(), current_timestamp(), now() from dual;

select now(), adddate(now(), 2) from dual;

select now(), adddate(now(),interval 2  month ) from dual;

select now(), adddate(now(),interval 3 year) from dual;

select now(), adddate(now(), interval 2 week ) from dual;

select datediff( now(),  '2025-05-31 12:35:21' ) from dual;

select datediff( '2025-05-17 12:36:29',  '2025-05-31 12:35:21' ) from dual ;

select month( now() ), year( now() ) from dual;

select extract( year from now() ) from dual;

select extract( minute from now() ) from dual;

select extract( second from now() ) from dual;

select now(), date_format( now(), 'This day is %W') from dual;

select now(), date_format( now(), 'This year is %Y') from dual;

select now(), date_format( now(), 'This month is %M') from dual;

select 24.324, round(24.243), round(24.346, 1) from dual;

select 24.324, round(24.243), round(24.346, 2) from dual;

select 24.324, round(24.243), round(24.34, 2) from dual;

select round(24.235,-1) from dual;

select round(26.235,-1) from dual;

select round(24.235,-2) from dual;

select round(64.235,-2) from dual;

select round(424.235,-3) from dual;

select round(624.235,-3) from dual;

select round(24.235,-3) from dual;

select round(363.27, 1),  truncate( 363.27, 1) from dual;

select mod(11,2), pow(2,3), floor(10.9999), ceil(9.000001) from dual;

use sakila;

select first_name, actor_id, if( first_name="NICK", actor_id*10, 'No Value') from actor;

select first_name, if(first_name="NICK", 'yes', if(first_name="ED", 'hello', 'No') ) from actor;

select actor_id, first_name, last_name, if(mod(actor_id,2)=0, concat(first_name, '_', last_name), if(mod(actor_id,2)!=0, concat(first_name, '$',  last_name), "No") ) from actor;

select actor_id, first_name, last_name,
case
	when mod(actor_id,2)=0 then concat(first_name, '_', last_name)
    when mod(actor_id,2)!=0 then concat(first_name, '$', last_name)
    else "No"
end
from actor;