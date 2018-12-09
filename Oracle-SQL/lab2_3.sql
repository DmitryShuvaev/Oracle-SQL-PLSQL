/*1.	???????? ?????? ??? ?????? ????? ? ?????????? ????? ????????, 
?????????????? ????? $12000. ????????? ??????? SQL ? ????? lab2_1.sql. ????????? ??????.
*/
select LAST_NAME,SALARY from EMPLOYEES
WHERE SALARY >12000;

/*2.	???????? ?????? ??? ?????? ??????? ? ?????? ?????? ????????? ??? ??????? 176 */
select LAST_NAME,DEPARTMENT_ID from EMPLOYEES
WHERE EMPLOYEE_ID =176;

/*3.	???????? ???? lab2_1.sql ? ???????? ??????? ? ?????? ???? ????????, 
??? ????? ?? ?????? ? ???????? ?? $5000 ?? $12000. ????????? ??????? SQL ? ????? lab2_3.sql. */
select LAST_NAME,SALARY from EMPLOYEES
WHERE SALARY < 5000  or SALARY > 12000;

/*4.	Выведите фамилию, идентификатор должности и дату начала работы всех служащих, 
нанятых в период с 20 февраля 1998 по 1 мая 1998 г. Отсортируйте данные в порядке возрастания даты найма.
*/
select LAST_NAME,JOB_ID,HIRE_DATE from EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE ('1998/02/20', 'yyyy/mm/dd')
AND TO_DATE ('1998/05/01', 'yyyy/mm/dd')
ORDER BY HIRE_DATE;

5.	Выведите фамилию и номер отдела всех служащих из отделов 20 и 50. 
Отсортируйте данные по фамилиям в алфавитном порядке.

select LAST_NAME,DEPARTMENT_ID from EMPLOYEES
WHERE DEPARTMENT_ID=20 OR DEPARTMENT_ID=50
ORDER BY LAST_NAME;

6.	Измените файл lab2_3.sql для вывода фамилий и окладов служащих отделов 20 и 50, 
зарабатывающих от $5000 до $12000. 
Назовите столбцы Employee и Mounthly Salary, соответственно. 
Вновь сохраните команду SQL  в файле lab2_6.sql. Выполните запрос.

select LAST_NAME AS Employee,SALARY "Mounthly Salary" from EMPLOYEES
WHERE (DEPARTMENT_ID=20 OR DEPARTMENT_ID=50) AND SALARY>= 5000 AND SALARY<=12000

7.	Выведите фамилию и дату найма всех служащих, нанятых в 1994 г.

select LAST_NAME, HIRE_DATE from EMPLOYEES
 where HIRE_DATE >= to_date('1.1.' || 1994, 'DD.MM.YYYY') and 
       HIRE_DATE < to_date('1.1.' || 1995, 'DD.MM.YYYY')
       
8.	Выведите фамилии и должности всех служащих, не имеющих менеджера.

select LAST_NAME, JOB_ID from EMPLOYEES
where MANAGER_ID is null

9.	Выведите фамилию, и комиссионные всех служащих, зарабатывающих комиссионные. 
Отсортируйте данные в порядке убывания окладов и комиссионных.

select LAST_NAME, SALARY,COMMISSION_PCT from EMPLOYEES
where COMMISSION_PCT is not null
ORDER BY SALARY DESC, COMMISSION_PCT DESC

10.	Выведите все фамилии служащих, в которых третья буква – а.

select LAST_NAME from EMPLOYEES
WHERE LAST_NAME LIKE '__a%';

11.	Выведите фамилии всех служащих, в которых есть буквы «а» и «е».

select LAST_NAME from EMPLOYEES
WHERE LAST_NAME LIKE '%a%' AND LAST_NAME LIKE '%e%';

12.	запросите фамилии, должности и оклады всех служащих, 
работающих торговыми представителями (SA_REP) 
или клерками на складе (ST_CLERK) и с окладом, не равным  $2500, $3500 и $7000.

select LAST_NAME,JOB_ID,SALARY from EMPLOYEES
WHERE (JOB_ID='SA_REP' OR JOB_ID='ST_CLERK') AND SALARY!=2500 AND SALARY!=3500 AND SALARY!=7000

13.	Измените lab2_6.sql так, чтобы получить фамилии оклады и комиссионные всех служащих, 
у которых сумма комиссионных превышает 20%. 
Выполните запрос ещё раз. Сохраните запрос в файле lab2_13.sql.

select LAST_NAME AS Employee,SALARY "Mounthly Salary",COMMISSION_PCT from EMPLOYEES
WHERE (DEPARTMENT_ID=20 OR DEPARTMENT_ID=50) AND SALARY>= 5000 AND SALARY<=12000 AND COMMISSION_PCT>=0.2

