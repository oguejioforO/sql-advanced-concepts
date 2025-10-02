create database Trig;
use Trig;

create table customer(
cust_id int, 
`name` varchar(30),
 product_name varchar(30));


create table product(
product_name varchar(30),
product_Id int,
order_date datetime not null);


Delimiter //
create trigger capture_time
after insert on customer for each row
begin
    insert into product (product_name, product_Id, order_date) values ('cream', 01, now());
end;

insert into customer values(01, 'Samson', 'cream');
select * from customer;
select * from product;




# Update Trigger
Create table employees(
emp_id int,
emp_name varchar(30),
age int,
immutable_salary int);

insert into employees values
(101,'Jimmy', 35, 70000),
(102,'Shane', 30, 50000),
(103,'Mary', 28, 62000),
(104,'Dwayne', 37, 57000),
(105,'Sara', 32, 80000);

Delimiter //
create trigger upd_trigger
before update
on employees for each row 
begin
if new.immutable_salary > 70000 then 
set new.immutable_salary = 'Updates to immutable_salary are not allowed';
end if;
end; 

SET SQL_SAFE_UPDATES = 0;
update employees
set immutable_salary = 85000;






# Delect Trigger
create table fellows(
id int, no_of_months int, course varchar(30));

insert into fellows values 
(2311, 3,'data analyst'),
(2312, 3,'Cyber Security'),
(2313, 4,'project management'),
(2314, 3,'Software engineer'),
(2315, 3,'develops');

create table graduant(id int, 
no_of_months int, 
course varchar(30), 
delected_at timestamp default now());

Delimiter //
create trigger fellows_delete
before delete on fellows for each row
begin
insert into graduant(id, no_of_months, course) values (old.id, old.no_of_months, old.course);
end;

delete from fellows
where no_of_months = 4;

select * from graduant;




# Audit Trail Trigger
create table salary(
id int, 
emp_name varchar(30),
old_salary int,
new_salary int);


insert into salary values
(101,'Jimmy', 70000,0),
(102,'Shane', 50000,0),
(103,'Mary', 62000,0),
(104,'Dwayne', 57000,0),
(105,'Sara', 80000,0);


create table audit_trial(
old_salary int,
new_salary int, 
added_at datetime);
 
 
Delimiter //
create trigger Cap_uupdate
after update on salary for each row
begin
if old.old_salary <> new.new_salary then
insert into audit_trial(old_salary, new_salary,added_at) values (old.old_salary, new.new_salary, now());
end if;
end;

SET SQL_SAFE_UPDATES = 0;
update salary
set new_salary = 57000;
select * from audit_trial;

select * from salary


# constraint Trigger
create table business_rule(
employee_age int primary key,
employee_name varchar(30),
department varchar(30),
constraint compare_age check (employee_age > 18));

create table business(
employee_age int,
employee_record varchar(50));


delimiter //
create trigger busineess_r5
before insert on business_rule for each row
begin
if business_rule.employee_age < 18 then
insert into business(employee_record) values ('Employee must be at least 18 years old');
end if;
end;

insert into business_rule values(16,'john','ict');