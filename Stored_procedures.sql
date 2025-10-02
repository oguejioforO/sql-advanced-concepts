-- =========================================
-- 1.stored procedures
-- =========================================
create database company;
use company;

Delimiter $$
create procedure all_data()
begin
select * from staff_details;
end $$

call all_data();

create table student_info(
serial_number int auto_increment primary key,
student_name varchar(40),
course_name varchar(40));

insert into student_info(serial_number,student_name,course_name)
values (1,'isaac newton', 'robotics');

insert into student_info(student_name,course_name)
values ('john newton', 'data science');

select * from student_info;
#primary constriant

create table prim_key(
student_id int primary key,
student_name varchar (40));

insert into prim_key (student_id,student_name)
values(10,'nkiola tesla');

select * from prim_key;

-- Unique constriant
create table unique_key(
student_id int primary key,
student_name varchar (40),
course_name varchar(40),
constraint check_name unique(student_name),
course_id int);

insert into unique_key(student_id,student_name,course_name,course_id)
values(30,'anderson ted','machine learning',456);

insert into unique_key(student_name)
values('anderson ted');
-- brought out error because its a unique key 

select * from unique_key;

-- CHECK CONSTRAINT
create table check_key(
student_id int primary key,
student_name varchar (40),
course_name varchar(40),
constraint check_name check(course_id > 18),
course_id int);

insert into check_key(student_id,student_name,course_name,course_id)
values(34,'anderson ted','web dev',20);

select * from check_key;




-- =========================================
-- 2. user-defined stored function (UDF)
-- =========================================

Delimiter $$
create function addition()
returns int
Deterministic

begin 
    declare var1 int;
    declare var2 int;
	set var1 = 5;
    set var2 = var1 * 6;
	return var2;
end $$

select addition() as result;

# Example 2
Delimiter $$
create function addition2(var1 int, var2 int)
returns int
Deterministic

begin 
    declare result int;
    set result= var1 * var2;
	return result;
end $$

select addition2(4,6) as result;