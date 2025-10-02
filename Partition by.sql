
create database cieos_partition;
use cieos_partition;


create table cieos_course(
course_name varchar(50) ,
course_id int, 
course_title varchar(60),
corse_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_lauch_year int);



insert into cieos_course values
('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019) ,
('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'james',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019);

select * from cieos_course where course_lauch_year = 2020;


-- Below is how to create partition by, it is done along the table creation
drop table cieos_courses;

create table cieos_courses(
course_name varchar(50),
course_id int,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022),
partition p4 values less than (2023));

insert into cieos_courses values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019) ,

('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'james',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019);

select * from cieos_courses1 where course_launch_year = 2020;
select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'cieos_courses';


-- Create Table partition by harsh
create table cieos_courses_2(
course_name varchar(50),
course_id int,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5;


insert into cieos_courses_2 values('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019) ,

('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'james',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'james',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'james',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'james',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'james',2019);

select * from cieos_courses_2;
select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'cieos_courses_2';


