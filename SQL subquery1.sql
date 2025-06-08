
use employees;

select * from employees;

select year(hire_date) from employees where emp_no=10002;

select * from employees where year(hire_date)=(select year(hire_date) from employees where emp_no=10002);

select birth_date from employees where emp_no in (10003,10004,10005,10006);

select emp_no, birth_date, first_name from employees where birth_date>all(select birth_date from employees where emp_no in (10003,10004,10005,10006) );

select * from titles;

select tit.emp_no, emp.first_name, tit.title  from titles as tit 
join employees as emp on tit.emp_no=emp.emp_no and tit.title="Senior Engineer";

select emp.emp_no, emp.birth_date, tit.from_date from employees as emp
join titles as tit on emp.emp_no=tit.emp_no and year(from_date)=1986;

use employees;
select * from employees; 

select * from departments;

select * from dept_emp;

select demp.emp_no, dp.dept_name, dp.dept_no from departments as dp
join dept_emp as demp on dp.dept_no=demp.dept_no;

select * from salaries;

select * from salaries as s1 where salary>(select avg(salary) from salaries as s2 where s2.emp_no=s1.emp_no);

create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;

select deptId, avg(salary) from employees group by deptID;


select * from employees as em where salary>(select avg(salary) from employees as emp where emp.DeptID=em.DeptID);

select max(salary) from employees group by deptid;

select * from employees as e where salary=(select max(salary) from employees as em where em.deptid=e.deptid );


use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Enrollments;

select StudentName, StudentId, CourseName from student as st 
join courses as cs on st.department=c.department;


CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Enrollments;

select * from Enrollments as e 
where  grade= (select max(grade) from Enrollments en where en.CourseId=e.CourseId);

use employees;

select * from employees;

select * from dept_emp;

select emp.emp_no, emp.first_name, demp.dept_no from employees as emp 
join dept_emp as demp on emp.emp_no=demp.emp_no;

select * from salaries;

select salary from salaries where emp_no=10001;

select emp_no from salaries where salary>all(select salary from salaries where emp_no=10001);

select * from salaries as s1  where salary> (select avg(salary) from salaries as s2 where s2.emp_no=s1.emp_no);

create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;

select DeptID, avg(salary) from employees group by DeptID;

select emp.EmpID from employees as emp join departments as dp where emp.DeptID=dp.DeptID and salary>(select  avg(salary) from employees group by DeptID);

select * from employees as emp where salary> (select avg(salary) from employees as emp4 where emp.DeptId=emp4.DeptID);

select DeptName from departments as dp join employees as emp
where dp.DeptID=emp.DeptID and salary> (select salary from employees where salary>60000); 