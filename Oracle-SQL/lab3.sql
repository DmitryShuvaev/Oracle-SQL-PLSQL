/*1.	Напишите запрос для вывода текущей даты. Назовите столбец Date.*/
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') "DATE" FROM dual;
COLUMN SYSDATE NEW_VALUE report_date
SELECT report_date;

2.	Выведите номер служащего, его фамилию, 
оклад и новый оклад, повышенный на 15% и округлённый до целого. 
Назовите столбец New Salary. Сохраните команду SQL в текстовом файле lab3_2sql.

SELECT EMPLOYEE_ID, LAST_NAME,SALARY, ROUND((SALARY*0.15)+SALARY) AS "New Salary" from EMPLOYEES

4.	Измените lab3_2.sql. 
добавьте ещё один столбец, который будет содержать результат вычитания старого оклада из нового. 
Назовите столбец Increase. Сохраните изменённый запрос в lab3_4.sql. Выполните запрос ещё раз.

SELECT EMPLOYEE_ID, LAST_NAME,SALARY, "New Salary","New Salary"-SALARY AS "Increase"
from(
select EMPLOYEE_ID, LAST_NAME,SALARY,(SALARY*0.15)+SALARY AS "New Salary" 
from EMPLOYEES
);

select LAST_NAME "Name","Lenght" from(
select LAST_NAME, (case 
when LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'M%'
then LENGTH(LAST_NAME) 
else null
end) "Lenght"
from EMPLOYEES
);

select "Name", "Lenght" from(
select LAST_NAME as "Name",LENGTH(LAST_NAME) as "Lenght"
from EMPLOYEES
where
 LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'M%'
)