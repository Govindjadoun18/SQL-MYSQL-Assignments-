use sakila;

select * from payment;

select payment_id, customer_id, amount, sum(amount) over( partition by customer_id), rank() over(partition by customer_id order by amount desc)
as  rank1
 dense_rank()
 over(partition by customer_id order by amount desc) as drank1 from sakila.payment;
 
 select * from 
 ( select payment_id, customer_id, amount,
 dense_rank()
	over(order by amount desc) as drank1
    from sakila.payment ) as tab where drank1=3;
    
    -- how to insert and update
    
    use sakila;
    
    create table mydata( id int, fname varchar(20) );
    insert into mydata values(10, 'govind');
    insert into mydata values(11, 'rakesh');
    insert into mydata values(11);
    insert into mydata(id) values(12);
    select  * from mydata;
    
    update mydata set fname="ramesh";
     update mydata set fname="rahul" where id=11;
    select * from mydata;
    
    delete from mydata where id=11;
    select * from mydata;
    
    -- DML  => insert, update, delete 
    
    -- drop => DDl
    drop table mydata;
    
    -- drop vs delete vs truncate assignment 
    
    use sakila;
    
    create table mydata1( id int not null, fname varchar(20)) 
    
 create table mydata5( id int primary key); 
 
 create table addmission( addmission_id int, college_name varchar(50), student_id int);
 insert into addmission values(1, 'AIET', 5);
 insert into addmission values(2, 'MNIT', 6);
 insert into addmission values(3, 'AIETM', 7);
  select * from addmission;
  
  create table students( student_name varchar(20), student_id int primary key);
  insert into students values( 'govind', 5);
  insert into students values( 'rakesh', 6);
  insert into students values( 'ramesh', 7);
  
  select * from students;
  
  foreign key student_id references students(student_id);
  
  
  create table Students( StudentID int, Name varchar(20), age int
  
  
  
    