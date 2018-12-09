1.	Для каждого служащего выведите фамилию и вычислите количество месяцев со дня найма до настоящего времени, 
округлённое до ближайшего целого. Назовите столбец MONTH_WORKED. 
Результаты отсортируйте по количеству отработанных месяцев. Округлите число до ближайшего целого.
/*
select LAST_NAME, HIRE_DATE
from EMPLOYEES

select trunc(sysdate) - to_date('2009-10-01', 'yyyy-mm-dd') from dual
SELECT  LAST_NAME,
((FLOOR(ABS(MONTHS_BETWEEN(HIRE_DATE, SYSDATE))) / 12) * 12)  AS MONTH_WORKED
FROM EMPLOYEES order by MONTH_WORKED
*/

select last_name, round(months_between(sysdate, hire_date),0) AS MONTH_WORKED 
from employees 
order by MONTH_WORKED;

2.	Получите по каждому служащему отчёт в следующем виде:
<фамилия> зарабатывает <оклад> в месяц, но желает <утроенный оклад>. 
Назовите столбец Dream Salaries
/*
SELECT  LAST_NAME || ' earns $' || SALARY || ' monthly but wants $' || SALARY*3 as "Dream Salaries"
FROM EMPLOYEES
*/
select last_name||' earns '||to_char(salary,'fm$999,999.00')||' monthly but wants ' ||to_char(salary*3,'fm$999,999.00') "Dream Salaries" 
from employees 
order by employee_id;

3.	Напишите запрос для вывода фамилий и окладов всех служащих. 
Назовите выходной столбец SALARY. 
Длина столбца SALARY – 15 символов с заполнением символом $.
/*
SELECT LAST_NAME,SUBSTR('$$$$$$$$$$$$$$$',1,15-LENGTH(SALARY))||SALARY as SALARY
FROM EMPLOYEES
*/
select last_name, lpad(salary,15,'$') salary from employees order by employee_id;

4.	Для каждого служащего выведите фамилию, дату найма и дату пересмотра зарплаты, 
которая приходится на первый понедельник после 6 месяцев работы. 
Назовите столбец REVIEW. 
Формат даты при выводе имеет вид: “Monday, the Thirty-First of MM, YYYY”.

/*
SELECT LAST_NAME,HIRE_DATE,TO_CHAR(REVIEW,'fmDay')
             ||', the '||
             TO_CHAR(REVIEW,'DDSPTH')
             || ' of ' ||TO_CHAR(REVIEW,'Month')
             || ', ' || TO_CHAR(REVIEW,'YYYY')
             REVIEW
 from(
select LAST_NAME,HIRE_DATE, 
trunc(trunc(ADD_MONTHS( HIRE_DATE, 6 ),'mm') + 6,'iw')REVIEW
FROM EMPLOYEES
);

SELECT LAST_NAME,HIRE_DATE,TO_CHAR(REVIEW,'fmDay')
||', the '||
            decode(to_char(REVIEW,'DD'),
              '01', 'First',
              '02', 'Second',
              '03', 'Third',
              '04', 'Fourth',
              '05', 'Fifth',
             '06', 'Sixth',
             '07', 'Seventh',
             '08', 'Eighth',
             '09', 'Ninth',
             '10', 'Tenth',
             '11', 'Eleventh',
             '12', 'Twelfth',
             '13', 'Thirteenth',
             '14', 'Fourteenth',
             '15', 'Fifteenth',
             '16', 'Sixteenth',
             '17', 'Seventeenth',
             '18', 'Eighteenth',
             '19', 'Nineteenth',
             '20', 'Twentieth',
             '21', 'Twenty-First',
             '22', 'Twenty-Second',
             '23', 'Twenty-Third',
             '24', 'Twenty-Fourth',
             '25', 'Twenty-Fifth',
             '26', 'Twenty-Sixth',
             '27', 'Twenty-Seventh',
             '28', 'Twenty-Eighth',
             '29', 'Twenty-Ninth',
             '30', 'Thirtieth',
             '31', 'Thirty-First')
              || ' of ' ||TO_CHAR(REVIEW,'Month')
             || ', ' || TO_CHAR(REVIEW,'YYYY')
             REVIEW
 from(
select LAST_NAME,HIRE_DATE, 
trunc(trunc(ADD_MONTHS( HIRE_DATE, 6 ),'mm') + 6,'iw')REVIEW

FROM EMPLOYEES
);
SELECT TO_CHAR (TO_DATE ('123', 'J'),
                    'Jsp') as dt1
      FROM DUAL,EMPLOYEES
    ;)
select  sysdate current_date,
        trunc(trunc(sysdate,'mm') + 6,'iw') first_monday_the_month
  from  dual
*/
/*original query
select last_name, to_char(hire_date,'dd-MON-yy','NLS_DATE_LANGUAGE = AMERICAN') HIRE_DATE,

to_char(next_day(add_months(hire_date,6), 'ПОНЕДЕЛЬНИК'),'fmDay, "the" Ddspth "of" Month, YYYY','NLS_DATE_LANGUAGE = AMERICAN') "REVIEW"

from employees order by employee_id;
*/
select last_name, to_char(hire_date,'dd-MON-yy') HIRE_DATE,
to_char(next_day(add_months(hire_date,6), 'Monday'),'fmDay, "the" Ddspth "of" Month, YYYY') "REVIEW"
from employees 
order by employee_id;

5.	По каждому служащему выведите фамилию, дату  найма и день недели, когда он был нанят на работу. 
Назовите последний столбец DAY. Отсортируйте результаты по датам.
/*
SELECT LAST_NAME,HIRE_DATE,
TO_CHAR(HIRE_DATE,'fmDay')DAY
FROM EMPLOYEES
*/
/*original query
select last_name, to_char(hire_date,'dd-MON-YY','NLS_DATE_LANGUAGE = AMERICAN') "hire_date "

, to_char(hire_date,'DAY', 'NLS_DATE_LANGUAGE = AMERICAN') day from employees order by TO_CHAR(hire_date,'D');
*/
select last_name, "hire_date ", day 
from(
select last_name, hire_date,to_char(hire_date,'dd-MON-YY') "hire_date "
, to_char(hire_date,'DAY') day 
from 
employees ) 
order by TO_CHAR(hire_date,'D');

6.	Напишите запрос для вывода фамилии и суммы комиссионных каждого служащего. 
Если служащий не зарабатывает комиссионных, укажите в столбце «No Commission». Назовите столбец COMM.
/*
SELECT LAST_NAME,
(case 
when COMMISSION_PCT is not null
then CAST(COMMISSION_PCT AS VARCHAR(100))
else 'No Commission'
end) "COMM"
FROM EMPLOYEES
*/
select last_name, NVL(to_char(commission_pct,'fm.99'),'No Commission')COMM 
from employees 
order by employee_id;

7.	Используя функцию DECODE, 
напишите запрос для отображения должности сотрудника и её разряда (grade). 
Разряд каждого типа должности JOB_ID приведён в таблице.

SELECT JOB_ID "Должность",
decode(JOB_ID,
 'AD_PRES','A',
 'ST_MAN','B',
 'IT_PROG','C',
 'SA_REP','D',
 'ST_CLERK','E',
 '0'
 )G
FROM EMPLOYEES

8.	Перепешите команду из предыдущего задания, используя синтаксис выражения CASE.

SELECT JOB_ID "Должность",
(case JOB_ID when 'AD_PRES' THEN 'A'
when  'ST_MAN' THEN 'B'
when 'IT_PROG' THEN 'C'
when 'SA_REP' THEN 'D'
when 'ST_CLERK' THEN 'E'
ELSE '0'
END)G
FROM EMPLOYEES
