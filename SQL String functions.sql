-- distinct , count

select distinct(first_name) from actor;

select count(first_name) from actor;

-- functions are use to make code reusable

select first_name, lower(first_name), upper(lower(first_name)), length(first_name) from actor;

select first_name, substr( first_name, 1)  from  actor;

select first_name, substr( first_name, 2)  from  actor;

select first_name, substr( first_name, 3)  from  actor;

select first_name, substr( first_name, 2,3), substr( first_name, 2,4) , substr( first_name, -3), substr( first_name, -5,4) from  actor;

select first_name, instr( first_name, "I") from actor;

select first_name, instr( first_name, 'E') from actor;
-- show first appearance

select first_name, last_name, concat( first_name, '_', last_name, '$') from actor;

select first_name, last_name, concat_ws( ' _ ', first_name, last_name, '$') from actor;

-- trim () => white, character 
select first_name, trim('    hey    ') from actor;

select first_name, trim('    h     ey    ') from actor;


-- lpad(), rpad()

select first_name, rpad(first_name,6,'$') from actor;

select first_name, lpad(first_name,6,'$') from actor;
