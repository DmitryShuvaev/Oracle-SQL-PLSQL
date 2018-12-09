1.	Создайте запрос для вывода фамилии, номера отдела и оклада всех служащих, 
чей номер отдела и оклад совпадают с номером отдела и окладом любого служащего, зарабатывающего комиссионные.


SELECT last_name, department_id, salary
FROM employees
WHERE (salary, department_id) IN
(SELECT salary, department_id
FROM employees
WHERE commission_pct IS NOT NULL)

2.	Выведите фамилию, название отдела и оклад всех служащих, 
чей оклад и комиссионные совпадают с окладом и комиссионными 
любого служащего, работающего в отделе, идентификатор местоположения которого Location_ID = 1700.

SELECT e.last_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND (salary, NVL(commission_pct,0)) IN
(SELECT salary, NVL(commission_pct,0)
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND d.location_id=1700
)

3.	Создайте запрос для вывода фамилии, даты найма и оклада всех служащих, 
которые получают такой же оклад и такие же комиссионные, как Kochhar. 
Не выводите данные о сотруднике Kochhar. 

SELECT last_name, hire_date, salary
FROM employees
WHERE (salary, NVL(commission_pct,0)) IN
(SELECT salary, NVL(commission_pct,0)
FROM employees
WHERE last_name='Kochhar')
AND last_name!= 'Kochhar'

4.	Выведите фамилию, должность и оклад всех служащих, 
оклад которых превышает оклад каждого клерка торгового менеджера (JOB_ID = ‘SA_MAN’).
Отсортируйте результаты по убыванию окладов.

SELECT last_name, job_id, salary
FROM employees
WHERE salary>ALL
(SELECT salary
FROM employees
WHERE job_id = 'SA_MAN')
ORDER BY salary DESC

5.	Выведите номера, фамилии и отделы служащих, 
живущих в городах, названия которых начинаются с буквы Т.

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN
(SELECT department_id
FROM departments
WHERE location_id IN
(SELECT location_id
FROM locations
WHERE city LIKE 'T%'))

6.	Напишите запрос для нахождения всех сотрудников, которые зарабатывают больше среднего оклада по их отделу. 
Выведите фамилию, оклад, номер отдела и средний оклад по отделу. 
Отсортируйте результаты по средней зарплате. Используйте псевдонимы для выбираемых столбцов.


SELECT  ename, salary, deptno, dept_avg
FROM (
SELECT e.last_name ename, e.salary salary, e.department_id deptno, round(AVG(a.salary)) dept_avg
FROM
employees e, employees a
WHERE e.department_id=a.department_id
AND e.salary > (SELECT AVG(salary)
FROM employees
WHERE department_id=e.department_id)
GROUP BY e.last_name, e.salary, e.department_id
)ORDER BY dept_avg


7.	Найдите всех сотрудников, не являющихся руководителями. 
Выполните это с помощью оператора NOT EXIST.
SELECT *
FROM employees
ORDER BY manager_id

SELECT A.last_name,A.employee_id,A.manager_id
FROM employees A
WHERE NOT EXISTS
(SELECT *
FROM employees B
WHERE B.manager_id=A.employee_id)

8.	Может ли это же быть сделано с помощью оператора NOT IN?

SELECT A.last_name,A.employee_id,A.manager_id
FROM employees A
WHERE A.employee_id NOT IN
(SELECT B.manager_id
FROM employees B
WHERE B.manager_id=A.employee_id)

9.	Выведите фамилии сотрудников, зарабатывающих меньше среднего оклада по их отделу. 

SELECT last_name
FROM employees A
WHERE A.salary < (SELECT AVG(B.salary)
FROM employees B
WHERE B.department_id=A.department_id)

10.	Выведите фамилии сотрудников, у которых есть коллеги по отделу, 
которые были приняты на работу позже, но имеют более высокий оклад.

SELECT last_name
FROM employees A
WHERE EXISTS (SELECT *
FROM employees B
WHERE B.department_id=A.department_id
AND B.hire_date > A.hire_date
AND B.salary > A.salary)
/*
SELECT last_name
FROM employees outer
WHERE EXISTS (SELECT 'X'
FROM employees inner
WHERE inner.department_id=outer.department_id
AND inner.hire_date > outer.hire_date
AND inner.salary > outer.salary)
*/

11.	Выведите номера, фамилии и наименования отделов всех сотрудников. 
Используйте скалярный подзапрос в команде SELECT для вывода наименований отделов.

SELECT A.employee_id, A.last_name,
(SELECT B.department_name
FROM departments B
WHERE A.department_id=B.department_id) department
FROM employees A
ORDER BY department

