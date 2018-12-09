1.	Создайте запрос для вывода фамилии и даты найма каждого служащего, 
работающего в одном отделе с Zlotkey. Исключите Zlotkey из выходных данных.

select last_name,hire_date,department_id
from EMPLOYEES
where department_id in(select department_id
from EMPLOYEES
where last_name='Zlotkey')
AND last_name!='Zlotkey'

2.	Создайте запрос для вывода номеров и фамилий всех служащих, 
оклад которых выше среднего.
Отсортируйте данные в порядке увеличения окладов. 
/*
select employee_id,last_name,salary
from EMPLOYEES
where salary in(select salary
from EMPLOYEES
where salary>avg(salary))
*/
SELECT employee_id,last_name,salary
FROM EMPLOYEES 
WHERE salary > (select avg(salary) from EMPLOYEES)
order by salary

3.	Создайте запрос для вывода номеров и фамилий всех служащих, 
работающих в одном отделе с любым служащим, фамилия которого содержит букву «u». 
Сохраните свой запрос в тестовом файле lab6_3.sql. Выполните запрос.

select employee_id,last_name FROM EMPLOYEES
where department_id in(
select department_id
FROM EMPLOYEES 
where last_name like '%u%'
)

Создайте запрос для вывода фамилии, номера отдела и должности каждого служащего, 
идентификатор местоположения отдела которого равен 1700. 

SELECT last_name,department_id,job_id
FROM EMPLOYEES
where department_id in(
select department_id
FROM DEPARTMENTS
where location_id=1700
)

5.	Получите список фамилий и окладов всех служащих, подчинённых Кингу. 

SELECT last_name,salary,manager_id
FROM EMPLOYEES
where manager_id in(
select employee_id
from employees
where last_name='King'
) and last_name!='King'

6.	Получите номер отдела, фамилию и должность для каждого служащего, 
работающего в администрации (department_name = ‘Executive’). 

SELECT department_id,last_name,job_id
FROM EMPLOYEES
where department_id in(
select department_id
from departments
where department_name='Executive'
)

7.	Измените lab6_3.sql для вывода номеров, 
фамилий и окладов всех служащих, которые работают в одном отделе с любым служащим 
с буквой «u» в фамилии и оклады которых превышают средний. 
Сохраните новый запрос в файле lab6_7.sql. Выполните его.
/*
select employee_id,last_name FROM EMPLOYEES
where department_id in(
select department_id
FROM EMPLOYEES 
where last_name like '%u%'
)
select*
FROM EMPLOYEES 
where salary>(
select avgs
from (select department_id,round(avg(salary))avgs
from EMPLOYEES
where department_id is not null
group by department_id
))
*/
select employee_id,last_name, salary 
from employees  
where department_id in
(select department_id from employees where last_name like '%u%') 
and salary > (select avg(salary) from employees);
/*
select e.employee_id,e.last_name, e.salary,e.department_id ,avg(b.salary)
from employees  e
join employees b
on e.employee_id=b.employee_id
where b.department_id is not null

group by b.department_id,b.employee_id,e.employee_id,e.last_name, e.salary,e.department_id 
*/

8.	Покажите номер отдела с 
наивысшей средней заработной платой и наименьший оклад работающего в нём сотрудника.


select department_id,minsalary
from
(select department_id,avg(salary)sal, min(salary)minsalary  
from employees 
group by department_id)
where sal=(select max(avg(salary)) 
from employees 
group by department_id)

/*9. Выведите номера , наименования и местоположения отделов, 
в которых не работают торговые представители (job_id = ‘SA_REP’). */

select A.department_id, A.department_name, A.manager_id,A.location_id 
from departments A
where A.department_id not in (
select nvl(department_id,0) 
from employees 
where job_id='SA_REP');
