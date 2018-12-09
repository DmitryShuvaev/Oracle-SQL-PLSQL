/*1.	Напишите запрос для вывода фамилии, номера отдела и названия отдела дл всех служащих. */

select LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES JOIN DEPARTMENTS
using (DEPARTMENT_ID)

select*from DEPARTMENTS

select LAST_NAME, EMPLOYEES.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.DEPARTMENT_ID= DEPARTMENTS.DEPARTMENT_ID

/*2.	Выведите список всех должностей в отдел 80 (должности в списке не должны повторяться) и местоположение отдела. */
select DISTINCT JOB_ID,LOCATION_ID
from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.DEPARTMENT_ID= DEPARTMENTS.DEPARTMENT_ID AND EMPLOYEES.DEPARTMENT_ID=80

/*3.	Напишите запрос для вывода фамилий, названия отдела, идентификатора местоположения отдела и 
города, в котором он находится, для всех служащих, зарабатывающих комиссионные. */

select A.LAST_NAME,  B.DEPARTMENT_NAME, C.LOCATION_ID, C.CITY
from EMPLOYEES A
inner join DEPARTMENTS B
on A.DEPARTMENT_ID=B.DEPARTMENT_ID
inner join LOCATIONS C
on B.LOCATION_ID=C.LOCATION_ID
where A.COMMISSION_PCT is not null

/*4.	Выведите фамилии всех служащих, содержащтих букву «а» (в строчном регистре), с названиями отделов. 
Сохраните свою команду SQL в файле lab4_4.sql. */

select LAST_NAME, DEPARTMENT_NAME
from EMPLOYEES, DEPARTMENTS
where EMPLOYEES.DEPARTMENT_ID= DEPARTMENTS.DEPARTMENT_ID
AND EMPLOYEES.LAST_NAME LIKE '%a%' 

/*5.	Напишите запрос для вывода
 фамилии, должности, номера отдела и названия отдела всех служащих, работающих в городе Toronto. */
 
 select A.LAST_NAME, A.JOB_ID, A.DEPARTMENT_ID,
B.DEPARTMENT_NAME
from EMPLOYEES A
inner join DEPARTMENTS B
on A.DEPARTMENT_ID=B.DEPARTMENT_ID
inner join LOCATIONS C
on B.LOCATION_ID=C.LOCATION_ID
where c.city='Toronto'

/*6.	Выведите фамилии и номера всех служащих вместе с фамилиями и номерами их менеджеров. 
Назовите столбцы EMPLOYEE, Emp#, Manager и Mgr#. Сохраните свою команду SQL в файле lab4_6.sql. */
select A.LAST_NAME EMPLOYEE,A.EMPLOYEE_ID Emp#,B.LAST_NAME Manager,A.MANAGER_ID Mgr#
from EMPLOYEES A
 join EMPLOYEES B
on A.MANAGER_ID=B.EMPLOYEE_ID

select*from employees
select*from departments
select*from JOBS
SELECT * FROM JOB_GRADES
/*7.	Измените файл lab4_6.sql так, чтобы получить фамилии всех служащих, 
включая Кинга, который не имеет менеджера.
Упорядочьте результат по возрастанию номера служащего. 
Сохраните изменённый запрос в текстовом файле lab4_7.sql. Выполните запрос. */

select A.LAST_NAME EMPLOYEE,A.EMPLOYEE_ID Emp#,NVL(B.LAST_NAME,' ') Manager, NVL(CAST (A.MANAGER_ID AS VARCHAR(100)),' ') Mgr#
from EMPLOYEES A
left JOIN EMPLOYEES B
on A.MANAGER_ID=B.EMPLOYEE_ID
ORDER BY A.EMPLOYEE_ID


select A.LAST_NAME EMPLOYEE,A.EMPLOYEE_ID Emp#,A.MANAGER_ID Mgr#
from EMPLOYEES A 

/*8.	Создайте запрос для вывода номера отдела, фамилии служащего и фамилий всех служащих, 
работающих в одном отделе с данным служащим. Дайте столбцам соответствующие имена. */
/*
select A.department_id department, B.LAST_NAME employee, A.LAST_NAME colleague
from EMPLOYEES A
JOIN  EMPLOYEES B
on A.department_id=B.department_id and A.LAST_NAME!=B.LAST_NAME
ORDER BY A.department_id
*/
select A.department_id DEPARTMENT, A.last_name EMPLOYEE, B.last_name COLLEAGUE 
from employees A 
join employees B 
on(A.department_id=B.department_id) 
where A.employee_id!=B.employee_id 
order by A.department_id;
/*9.	Покажите структуру таблицы JOB_GRADES. 
Создайте запрос для вывода фамилии, должности, названия отдела, оклада и категории (GRADE_LEVEL) всех служащих. */
desc JOB_GRADES
select A.LAST_NAME,A.job_id,B.DEPARTMENT_NAME,A.SALARY,C.GRADE_LEVEL GRA
from EMPLOYEES A
JOIN DEPARTMENTS B
on A.department_id=B.department_id
CROSS JOIN JOB_GRADES C
WHERE A.SALARY<=C.HIGHEST_SAL and  A.SALARY>=C.LOWEST_SAL

/*10.	Создайте запрос для вывода фамилий и дат найма всех служащих, нанятых после Davies. */


/*
select last_name, HIRE_DATE
from EMPLOYEES
where HIRE_DATE>(select HIRE_DATE
from EMPLOYEES
 where last_name='Davies')
 order by hire_date;
*/
select A.last_name, A.hire_date 
from employees A 
join employees B 
on (A.hire_date>B.hire_date)
where B.last_name='Davies' 
order by hire_date;

/*11.	По всем служащим нанятым раньше своих менеджеров,
выведите фамилии и даты найма самих служащих, а также фамилии и даты найма их менеджеров. 
Назовите столбцы Employee, Emp, Manager и Manager Hired.*/

select A.LAST_NAME EMPLOYEE,A.HIRE_DATE "Emp Hired",B.LAST_NAME Manager,B.HIRE_DATE "Mgr Hired"
from EMPLOYEES A
 join EMPLOYEES B
on A.MANAGER_ID=B.EMPLOYEE_ID and A.HIRE_DATE<B.HIRE_DATE

12.	Выведите номера, наименования и местоположение всех отделов, а также количество работающих в них сотрудников. 
Обеспечьте вывод отделов в которых нет сотрудников.
/*
select A.DEPARTMENT_ID,A.DEPARTMENT_NAME,A.LOCATION_ID
from DEPARTMENTS A
 join EMPLOYEES E
on A.DEPARTMENT_ID=E.DEPARTMENT_ID

select DEPARTMENT_ID,count(employee_id)
from EMPLOYEES
group by DEPARTMENT_ID;

select A.DEPARTMENT_ID,A.DEPARTMENT_NAME,A.LOCATION_ID
from DEPARTMENTS A,EMPLOYEES E
where A.DEPARTMENT_ID=E.DEPARTMENT_ID
*/
select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, count(e.employee_id) 
from EMPLOYEES e 
right join  DEPARTMENTS d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID 
group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID;
/*
select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID, count(e.employee_id) 
from EMPLOYEES e ,DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID 
group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME, d.LOCATION_ID;

select*from employees
*/
13.	Какие должности имеются в отделах Administration и Executive, а также сколько сотрудников занимают эти должности? 
Выведите первыми наиболее часто встречаемые должности.
/*
select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, e.JOB_ID, count(e.employee_id) 
from EMPLOYEES e ,DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and
d.department_name='Administration' or d.department_name='Executive'
group by d.DEPARTMENT_ID, d.DEPARTMENT_NAME, e.JOB_ID
ORDER BY COUNT(e.JOB_ID) DESC

SELECT JOB_ID FROM
   (SELECT JOB_ID, COUNT(JOB_ID) AS cnt1 FROM employees
      GROUP BY JOB_ID)
   WHERE cnt1 = 
      (SELECT MAX (cnt2) FROM
         (SELECT COUNT(JOB_ID) AS cnt2
         FROM employees GROUP BY JOB_ID));
         
select JOB_ID, COUNT(JOB_ID) AS MOST_FREQUENT
from employees

GROUP BY JOB_ID
ORDER BY COUNT(JOB_ID) DESC
*/
select d.department_name,e.JOB_ID, COUNT(e.JOB_ID) AS FREQUENCY
from EMPLOYEES e ,DEPARTMENTS d 
where e.DEPARTMENT_ID = d.DEPARTMENT_ID and
d.department_name='Administration' or d.department_name='Executive'
GROUP BY d.department_name ,e.JOB_ID
ORDER BY COUNT(e.JOB_ID) DESC

14.	Покажите сотрудников, менеджеры которых имеют оклад выше $15000. 
выведите следующие сведения: фамилию сотрудника, фамилию менеджера, его оклад и уровень оклада
/*
select *
from EMPLOYEES
*/
select A.LAST_NAME,A.EMPLOYEE_ID,A.SALARY, B.LAST_NAME Manager,B.SALARY ,C.GRADE_LEVEL GRA
from EMPLOYEES A
 join EMPLOYEES B
on A.MANAGER_ID=B.EMPLOYEE_ID
and B.SALARY>15000
CROSS JOIN JOB_GRADES C
WHERE B.SALARY<=C.HIGHEST_SAL and  B.SALARY>=C.LOWEST_SAL
/*
select A.LAST_NAME,A.job_id,B.DEPARTMENT_NAME,A.SALARY,C.GRADE_LEVEL GRA
from EMPLOYEES A
JOIN DEPARTMENTS B
on A.department_id=B.department_id
CROSS JOIN JOB_GRADES C
WHERE A.SALARY<=C.HIGHEST_SAL and  A.SALARY>=C.LOWEST_SAL
*/