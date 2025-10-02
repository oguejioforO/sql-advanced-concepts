-- constraints are like rules we give to our code.
-- primary key is a kind of constraint

create database Firms;
use Firms;

-- Example one
create table constraint_table(
student_id int primary key,
student_name varchar(30),
age int,
course_name varchar(30));

-- or use this method for primary key constraint
create table constraint_table(
student_id int primary key,
student_name varchar(30),
age int,
course_name varchar(30),
constraint checkstudent_id primary key (student_id));

insert into constraint_table values(
234, 'Thomas Edision', 22, 'English'),
(234,'Isaac Newton', 23, 'electical');

-- repeating the same number in the first colunmn will give you an error because of the primary key constraint
insert into constraint_table values(235,'Isaac Newton', 23, 'electical');
insert into constraint_table values(234, 'Thomas Edision', 22, 'English');

select * from constraint_table;

-- Example two
-- check constraint
create table constraint_table2(
student_id int,
student_name varchar(30),
age int,
course_name varchar(30),
constraint check_age check(age > 18));

insert into constraint_table2 values
(34,'anderson ted',18,'web dev'),
(235,'Isaac Newton', 23, 'electical'),
(234, 'Thomas Edision',16, 'English');
-- error becos it has violated the check contraint age was less than 18

insert into constraint_table2 values
(34,'anderson ted',19 ,'web dev'),
(235,'Isaac Newton', 23, 'electical'),
(234, 'Thomas Edision',22, 'English');

-- Unique constriant
-- Makes sure there is no duplicate as regards the column
create table constraint_table3(
student_id int,
student_name varchar(30),
age int,
course_name varchar(30),
constraint unique_course unique (course_name));

