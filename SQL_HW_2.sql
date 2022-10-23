--SQL_DDL Первая часть

--1) Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

--2) Наполнить таблицу employee 70 строками.

insert into employees (employee_name)
values  ('Anna_1'),
		('Eliana_1'),
		('Jaid_1'),
		('Besir_1'),
		('Marcos_1'),
		('Oscar_1'),
		...
		...
		('Charles_2');
		
--3) Создать таблицу salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null
	
	create table salary (
	id serial primary key,
	monthly_salary int not null
);

--4) Наполнить таблицу salary 15 строками:

insert into salary (monthly_salary)
values  (1000),	
		(1100),	
		...
		...
		(2300),
		(2400);

--5) Создать таблицу employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null

	create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--6) Наполнить таблицу employee_salary 40 строками:
--в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values  (3,7),
		(1,4),
		(5,9),
		(40,13),
		...
		...
		(79,9),
		(80,10);

--7) Создать таблицу roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique
	
create table roles (
	id serial primary key,
	role_name int not null unique
);

-- 8) Поменять тип столба role_name с int на varchar(30)

alter table roles
alter role_name type varchar(30);

-- 9) Наполнить таблицу roles 20 строками
	
insert into roles (role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		...
		...
		('Senior Automation QA engineer');
	
--10) Создать таблицу roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- - role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee (
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key (employee_id)
		references employees (id),
	foreign key (role_id)
		references roles (id)
);

--11) Наполнить таблицу roles_employee 40 строками

insert into roles_employee
values  (7,2),
		(20,4),
		(3,9)
		...
		... 
		(29,12);


select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

