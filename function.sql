-- topic Functions 

-- two types of function 
-- aggregrate function and window function
-- aggregrate function includes the following
-- count()
-- min()
-- sum()
-- max()
-- avg()
-- std() etc
-- diffrence between group by and partition by *


create database win_func;
use win_func;

create table cieos_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50));


insert into cieos_students values(100 ,'fsda' , 'joy','cs',80,'joy@gmail.com'),
(102 ,'fsda' , 'james','cs',81,'james@gmail.com'),
(103 ,'fsda' , 'john','cs',80,'john@gmail.com'),
(104 ,'fsda' , 'james','cs',82,'james@gmail.com'),
(105 ,'fsda' , 'john','ME',67,'john@gmail.com'),
(106 ,'fsds' , 'kenneth','ME',45,'kenneth@gmail.com'),
(106 ,'fsds' , 'kenneth','ME',78,'kenneth@gmail.com'),
(108 ,'fsds' , 'vivian','CI',89,'vivian@gmail.com'),
(109 ,'fsds' , 'king','CI',34,'king@gmail.com'),
(110 ,'fsds' , 'leo','CI',45,'leo@gmail.com'),
(111 ,'fsde' , 'mary','CI',43,'mary@gmail.com'),
(112 ,'fsde' , 'chioma','EE',67,'chioma@gmail.com'),
(113 ,'fsde' , 'mike','EE',23,'mike@gmail.com'),
(114 ,'fsde' , 'christian','EE',45,'christian@gmail.com'),
(115 ,'fsde' , 'grace','EE',89,'grace@gmail.com'),
(116 ,'fsde' , 'faith','ECE',23,'faith@gmail.com'),
(117 ,'fsbc' , 'precious','ECE',23,'precious@gmail.com'),
(118 ,'fsbc' , 'mathew','ECE',45,'mathew@gmail.com'),
(119 ,'fsbc' , 'gloria','ECE',65,'gloria@gmail.com');

select * from cieos_students;
select student_stream , student_batch, sum(students_marks) from cieos_students group by 1,2;

select student_batch, count(*) from cieos_students group by student_batch;
select distinct student_batch from cieos_students;
select count(distinct student_batch) from cieos_students;

-- write a query to output student name with the highest mark in fsda;
select max(students_marks) from cieos_students where student_batch = 'fsda';

-- method 2
select student_name, max(students_marks) as marks from cieos_students 
where student_batch ='fsda'
group by student_name order by marks desc limit 1;

-- method 3
select student_name, students_marks, student_batch from cieos_students
where student_batch = 'fsda' and students_marks in ( select max(students_marks) 
from cieos_students where student_batch = 'fsda');

-- write a query to output top three overall students with there name, batch, and marks
select student_name, student_batch, max(students_marks) as marks from cieos_students 
group by student_name, student_batch order by marks desc limit 3;

-- task output top 5
select student_name, student_batch, max(students_marks) as marks from cieos_students 
group by student_name, student_batch order by marks desc limit 5;

-- task output buttom 3
select student_name, student_batch, max(students_marks) as marks from cieos_students 
group by student_name, student_batch order by marks asc limit 3;


select student_name, student_batch, students_marks from cieos_students order by students_marks desc limit 4,10;


-- WINDOW FUNCTION
-- window function syntax
-- window_function(expression[optional]) over(partition by[optional] column_name  order by[optional] column_name)

-- list of window function
-- row_number()
-- rank()
-- denserank()

select student_id , student_batch , student_stream,students_marks,
row_number() over( order by students_marks desc) as 'row_number' from cieos_students;

select student_id , student_batch , student_stream, students_marks ,
row_number() over(partition by student_batch order by students_marks desc ) as 'row_number' from cieos_students;

select student_id , student_batch , student_stream,students_marks,
row_number() over( order by students_marks desc )as 'row_number' ,
rank() over( order by students_marks desc  )as 'rank_number' ,
dense_rank() over( order by students_marks desc  ) as 'dense_rank_number' 
from cieos_students;

select * from (select student_id , student_batch , student_stream,students_marks ,
dense_rank() over( order by students_marks desc  ) as 'dense_rank_number' 
from cieos_students) as result where students_marks = (select max(students_marks) from cieos_students);




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