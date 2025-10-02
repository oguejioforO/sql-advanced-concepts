create database marketers;
use marketers;

create table marketers_reward(
`name` varchar(30),
sales int,
salary int,
new_salary int,
salary_status varchar(30));

insert into marketers_reward(`name`, sales, salary) values 
('John EJiofor', 500450, 450),
('Gabriel Williams', 460233, 350),
('Deboarah Patrick', 590214, 250),
('Christabel george', 90841, 340),
('Daniel Chris', 120772,250);

Delimiter $$
create function salary_increase2(new_salary int, sales int, salary int)
returns int
Deterministic

begin
 declare new_salary int;
 if sales > 500000 then
     set new_salary = salary + (salary * 0.3);
 elseif sales > 450000 and sales < 500000 then
     set new_salary = salary + (salary * 0.2);
 elseif sales > 300000 and sales < 450000 then
     set new_salary = salary + (salary * 0.1);
else
    set new_salary = salary;
end if; 
return new_salary;
end $$

select *,  salary_increase2 (new_salary, sales,salary) from marketers_reward;


# moving the values in column salary_increase2 (new_salary, sales,salary) into new_salary 
SET SQL_SAFE_UPDATES = 0;

alter table marketers_reward;

update marketers_reward
set new_salary = salary_increase2 (new_salary, sales,salary);

select * from marketers_reward;

# update the last column to show those whose salary were increased
update marketers_reward
set salary_status = if (new_salary > salary, 'increased','Not increased');

