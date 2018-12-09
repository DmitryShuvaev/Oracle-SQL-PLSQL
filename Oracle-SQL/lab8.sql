/*1.	�?спользуя оператор SET, выведите номера отделов (department_id), 
в которых нет служащих с идентификатором должности (job_id) ST_CLERK. */

select department_id 
from employees
minus
select department_id 
from employees 
where job_id='ST_CLERK';


/*2.	�?спользуя оператор SET, выведите идентификаторы и наименования стран, в которых не располагаются отделы компании. */

select country_id, country_name 
from countries
minus
select E.country_id, E.country_name 
from departments B 
join locations C 
on (B.location_id=C.location_id) 
join countries E 
on (E.country_id=C.country_id);

/*3.	�?спользуя оператор SET, выведите список должностей отделов 10, 50 и 20 в 
таком же порядке отделов. Выведите столбцы job_id и department_id. */
Select department_id, job_id
from(
Select  department_id, job_id
From
employees
Where department_id=10
) 
Union all
Select distinct department_id, job_id
From employees
Where department_id=50
Union all
Select distinct department_id, job_id
From employees
Where department_id=20
order by n

with t as (
select distinct job_id, department_id ,(SELECT 1 FROM DUAL)n
from employees 
where department_id=10
union all
select distinct job_id, department_id ,(SELECT 2 FROM DUAL)n
from employees 
where department_id=50
union all
select distinct job_id, department_id ,(SELECT 3 FROM DUAL)n
from employees 
where department_id=20
)
SELECT * FROM t
order by t.n
/*
select distinct job_id, department_id 
from employees 
where department_id=10
union all
select distinct job_id, department_id 
from employees 
where department_id=50
union all
select distinct job_id, department_id 
from employees 
where department_id=20;
*/
/*4.	Выведите номер сотрудника и идентификатор его должности, 
если его текущая должность совпадает с той, которую он уже занимал, работая в компании. */

select employee_id, job_id 
from employees
intersect
select employee_id, job_id 
from job_history;

/*5.	Напишите составной запрос, который выводит следующее:
•	Номера и отделы всех сотрудников из таблицы EMPLOYEES, независимо от того, 
относятся ли они к какому-то отделу или нет;
•	Номера и наименования всех отделов из таблицы DEPARTMENTS, 
независимо от того, есть ли в них сотрудники или нет.
*/

select to_char(employee_id), department_id, to_char(null)
from employees
union
select to_char(null), department_id, department_name
from departments;
