1.	Напишите запрос для вывода самого высокого, 
самого низкого и среднего оклада по всем служащим, а также суммы всех окладов. 
Назовите столбцы Maximum, Minimum, Average и Sum. 
Округлите суммы до ближайшего целого значения. Сохраните свой запрос в файле lab5_6.sql.

select max(salary) Maximum, min(salary)Minimum, sum(salary) sum, round(avg(salary)) Average
from EMPLOYEES

2.	Измените запрос в lab5_6.sql. так, чтобы получить самый низкий, 
самый высокий и средний оклады, а также сумму окладов по каждой должности. 
Сохраните изменённый запрос в файле lab5_5.sql. Выполните запрос из lab5_5.sql.

select JOB_ID, max(salary) Maximum, min(salary)Minimum, sum(salary) sum, round(avg(salary)) Average
from EMPLOYEES
group by JOB_ID

3.	Напишите запрос для вывода должности и количества служащих, занимающих каждую должность.

select JOB_ID, count(*)
from EMPLOYEES
group by JOB_ID

4.	Получите количество служащих, имеющих подчинённых, без их перечисления. 
Назовите столбец Number of Managers. 
Используйте столбец MANAGER_ID для определения числа менеджеров.
/*
select count(manager_id)"Number of Managers"
from EMPLOYEES
group by manager_id

select *from employees
order by manager_id
*/
select count(distinct(manager_id)) "Number of Managers"
from employees;

5.	Напишите запрос для вывода разности между самым высоким и самым низким окладами. 
Назовите столбец DIFFERENCE


select
     max(salary) - min(salary) as difference
from
   EMPLOYEES

6.	Напишите запрос для вывода номера каждого менеджера, имеющего подчинённых, 
и заработную плату самого низкооплачиваемого из его подчинённых. 
Исключите менеджеров для которых неизвестны их менеджеры. 
Исключите все группы, где минимальный оклад составляет менее $6000. 
Отсортируйте выходные строки в порядке убывания оклада.

select manager_id,min(salary)
from EMPLOYEES
where salary>6000 and manager_id is not null
group by manager_id
order by min(salary) desc

7.	Напишите запрос для вывода названия отдела, местоположения отдела, количества служащих и среднего оклада по этому отделу. 
Назовите столбцы Name, Location, Number of People и Salary. Округлите средний оклад до ближайшего целого значения.
/*
select d.department_name,d.location_id --,count(d.department_name)

from DEPARTMENTS d
join EMPLOYEES e
on d.department_id=e.department_id
group by e.department_id,d.department_id
*/
select pl.department_name,pl.location_id,  count(*)"Number of People",round(avg(p.salary))Salary
from EMPLOYEES p join
     DEPARTMENTS pl
     on p.department_id = pl.department_id
group by pl.department_id, pl.department_name,pl.location_id

8.	Напишите запрос для вывода общего количества служащих и количества служащих, нанятых в 1995, 1996, 1997 и 1998 годах. 
Дайте соответствующие заголовки столбцам.
/*
select  count(A.HIRE_DATE)"1995",count(B.HIRE_DATE)"1996"
from EMPLOYEES A,EMPLOYEES B
 where A.HIRE_DATE in(select HIRE_DATE 
 from EMPLOYEES
 where
 HIRE_DATE >= to_date('1.1.' || 1995, 'DD.MM.YYYY') and 
       HIRE_DATE < to_date('1.1.' || (1995 + 1), 'DD.MM.YYYY')
)or
  B.HIRE_DATE in(select HIRE_DATE 
 from EMPLOYEES
 where
 HIRE_DATE >= to_date('1.1.' || 1996, 'DD.MM.YYYY') and 
       HIRE_DATE < to_date('1.1.' || (1996 + 1), 'DD.MM.YYYY')
)
group by  to_char( trunc(A.HIRE_DATE, 'YYYY')),to_char( trunc(B.HIRE_DATE, 'YYYY'))
*/
/*
select (
select sum(count(*))
from EMPLOYEES
group by  to_char( trunc(HIRE_DATE, 'YYYY')))total,
(select count(*)
from EMPLOYEES B
 where B.HIRE_DATE >= to_date('1.1.' || 1995, 'DD.MM.YYYY') and 
       B.HIRE_DATE < to_date('1.1.' || (1995 + 1), 'DD.MM.YYYY')
group by  to_char( trunc(B.HIRE_DATE, 'YYYY')))"1995",
(select count(*)
from EMPLOYEES B
 where B.HIRE_DATE >= to_date('1.1.' || 1996, 'DD.MM.YYYY') and 
       B.HIRE_DATE < to_date('1.1.' || (1996 + 1), 'DD.MM.YYYY')
group by  to_char( trunc(B.HIRE_DATE, 'YYYY')))"1996",
(select count(*)
from EMPLOYEES B
 where B.HIRE_DATE >= to_date('1.1.' || 1997, 'DD.MM.YYYY') and 
       B.HIRE_DATE < to_date('1.1.' || (1997 + 1), 'DD.MM.YYYY')
group by  to_char( trunc(B.HIRE_DATE, 'YYYY')))"1997",
(select count(*)
from EMPLOYEES B
 where B.HIRE_DATE >= to_date('1.1.' || 1998, 'DD.MM.YYYY') and 
       B.HIRE_DATE < to_date('1.1.' || (1998 + 1), 'DD.MM.YYYY')
group by  to_char( trunc(B.HIRE_DATE, 'YYYY')))"1998"
FROM    dual
*/
/*
select "1995"
from EMPLOYEES A,EMPLOYEES B
where "1995"(
select HIRE_DATE,count(*) as members 
from EMPLOYEES
 group by HIRE_DATE,
         to_char(trunc(HIRE_DATE), 'YYYY')
         
select
       count(*) as members , 
       to_char(trunc(HIRE_DATE, 'YYYY'))
  from EMPLOYEES
 group by 
         to_char( trunc(HIRE_DATE, 'YYYY'))
*/
/*
select to_char( trunc(HIRE_DATE, 'YYYY')),count(*)
from EMPLOYEES
group by  to_char( trunc(HIRE_DATE, 'YYYY'))
order by to_char( trunc(HIRE_DATE, 'YYYY'))

select sum(count(*))
from EMPLOYEES
group by  to_char( trunc(HIRE_DATE, 'YYYY'))

*/
select
count(employee_id) TOTAL,
count(decode(to_char(hire_date,'YYYY'),'1995',1995)) "1995",
count(decode(to_char(hire_date,'YYYY'),'1996',1996)) "1996",
count(decode(to_char(hire_date,'YYYY'),'1997',1997)) "1997",
count(decode(to_char(hire_date,'YYYY'),'1998',1998)) "1998"
from employees;

9.	Напишите матричный запрос для вывода всех должностей и суммы заработной платы служащих, работающих в этой должности в отделах 20, 50, 80 и 90. 
Последний столбец должен содержать сумму заработной платы служащих этих отделов, занимающих каждую конкретную должность. 
Дайте столбцам соответствующие заголовки.

select  "Job",dept20,dept50,dept80,dept90,"Total"
from(
select JOB_ID "Job",
case when department_id=20 then sum(salary) else 0 end dept20,
case when department_id=50 then sum(salary) else 0 end dept50,
case when department_id=80 then sum(salary) else 0 end dept80,
case when department_id=90 then sum(salary) else 0 end dept90,
nvl(sum(decode(department_id,20,salary)),0)+nvl(sum(decode(department_id,50,salary)),0)+nvl(sum(decode(department_id,80,salary)),0)+
nvl(sum(decode(department_id,90,salary)),0) "Total" 
from EMPLOYEES
GROUP BY JOB_ID,department_id
) 
where "Total"!=0


/*
select JOB_ID "Job",
case when department_id=20 then sum(salary) else 0 end dept20,
case when department_id=50 then sum(salary) else 0 end dept50,
case when department_id=80 then sum(salary) else 0 end dept80,
case when department_id=90 then sum(salary) else 0 end dept90,
sum(salary)total
from EMPLOYEES
GROUP BY JOB_ID,department_id
*/
/*
select job_id "Job",
nvl(sum(decode(department_id,20,salary)),0) "Dept20",
nvl(sum(decode(department_id,50,salary)),0) "Dept50",
nvl(sum(decode(department_id,80,salary)),0) "Dept80",
nvl(sum(decode(department_id,90,salary)),0) "Dept90",
nvl(sum(decode(department_id,20,salary)),0)+nvl(sum(decode(department_id,50,salary)),0)+nvl(sum(decode(department_id,80,salary)),0)+
nvl(sum(decode(department_id,90,salary)),0) "Total"
from employees 
group by job_id;
*/
