--SQL HomeWork 3 Joins
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees.employee_name, salary.monthly_salary 
from salary 
	join employee_salary on salary.id = employee_salary.salary_id
	join employees on employees.id = employee_salary.employee_id
;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employees.employee_name, salary.monthly_salary 
from salary 
	join employee_salary on salary.id = employee_salary.salary_id
	join employees on employees.id = employee_salary.employee_id
where monthly_salary < 2000
;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary--,employee_name
from employees full join 
	employee_salary on employee_salary.employee_id = employees.id join 
	salary on salary.id = employee_salary.salary_id
where employee_name is null
;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select monthly_salary --,employee_name 
from employees full join 
	employee_salary on employee_salary.employee_id=employees.id join 
	salary on salary.id = employee_salary.salary_id
where employees.id is null and monthly_salary < 2000
;

--5. Найти всех работников кому не начислена ЗП

select employee_name, monthly_salary
from employees full join 
	employee_salary on employee_salary.employee_id=employees.id join 
	salary on salary.id = employee_salary.salary_id
where employees.id is null
;

--6. Вывести всех работников с названиями их должности.

select employees.employee_name, roles.role_name 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
;

--7. Вывести имена и должность только Java разработчиков.

select employees.employee_name, roles.role_name 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Java%'
;

--8. Вывести имена и должность только Python разработчиков.

select employees.employee_name, roles.role_name 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Python%'
;

--9. Вывести имена и должность всех QA инженеров.

select employees.employee_name, roles.role_name 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
where roles.role_name like '%QA%'
;

--10. Вывести имена и должность ручных QA инженеров.

select employees.employee_name, roles.role_name 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Manual%QA%'
;

--11. Вывести имена и должность автоматизаторов QA

select employees.employee_name, roles.role_name 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
where roles.role_name like '%Auto%QA%'
;
--12. Вывести имена и зарплаты Junior специалистов

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%'
;

--13. Вывести имена и зарплаты Middle специалистов

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Middle%'
;

--14. Вывести имена и зарплаты Senior специалистов

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Senior%'
;

--15. Вывести зарплаты Java разработчиков

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Java%developer' 
;

--16. Вывести зарплаты Python разработчиков

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Python%developer' 
;

--17. Вывести имена и зарплаты Junior Python разработчиков

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%Python%developer' 
;

--18. Вывести имена и зарплаты Middle JS разработчиков

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%Python%developer' 
;

--19. Вывести имена и зарплаты Senior Java разработчиков

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Senior%Java%developer' 
;

--20. Вывести зарплаты Junior QA инженеров

select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%QA%' 
;

--21. Вывести среднюю зарплату всех Junior специалистов

select AVG (salary.monthly_salary) 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%' 
;

--22. Вывести сумму зарплат JS разработчиков

select SUM (salary.monthly_salary) 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%JavaScript%developer'
;

--23. Вывести минимальную ЗП QA инженеров

select MIN (salary.monthly_salary) 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%QA%engineer'
;

--24. Вывести максимальную ЗП QA инженеров

select MAX (salary.monthly_salary) 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%QA%engineer'
;

--25. Вывести количество QA инженеров

select count(role_name)
from roles r join roles_employee re on r.id = re.role_id
where role_name like '%QA%'
;

--26. Вывести количество Middle специалистов.

select  count(role_name)
from roles r join roles_employee re on r.id = re.role_id
where role_name like '%Middle%'
;

--27. Вывести количество разработчиков

select  count(role_name)
from roles r join roles_employee re on r.id = re.role_id
where role_name like '%developer%'
;

--28. Вывести фонд (сумму) зарплаты разработчиков.

select SUM (salary.monthly_salary) 
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%developer%'
;

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
order by 1,2,3
;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where salary.monthly_salary between 1700 and 2300
order by 1,2,3
;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where salary.monthly_salary < 2300
order by 1,2,3
;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees 
	join roles_employee on employees.id = roles_employee.employee_id
	join roles on roles.id = roles_employee.role_id
	join employee_salary on employees.id = employee_salary.employee_id 
	join salary on employee_salary.salary_id = salary.id
where salary.monthly_salary in (1100, 1500, 2000)
order by 1,2,3
;

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

