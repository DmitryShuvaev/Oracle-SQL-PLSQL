SELECT employee_id, last_name,
salary*12 "ANNUAL SALARY"
FROM employees;
select*from employees;
select first_name ||', '|| JOB_ID as "Employee and Title" from employees;

select employee_id ||','||first_name ||','||last_name||','||email||','||
phone_number||','||hire_date||','||job_id||','||
salary||','||commission_pct||','||manager_id||','||department_id
as "THE_OUTPUT" from employees;


set echo on
REM Querying table
select * from dual;
--first need to run this set serveroutput on to anable see result on console 
set serveroutput on

DECLARE 
   message  varchar2(20):= 'Hello1111, World!'; 
BEGIN 
   dbms_output.put_line(message); 
END; 
/ 

declare
      v_line varchar2(40);
    begin
      v_line := 'this is just new line';
      dbms_output.put_line (v_line);
    end;
    /
  
DECLARE
v_amount INTEGER(10);
BEGIN
  v_amount:=153223;
  dbms_output.put_line(v_amount); 
END;
/

declare
  v_str1    varchar2(80);
  v_str2    varchar2(30) := 'Hello World';
  d_today   date;
  n_sales   number;
  n_order   number(8);
begin
n_order:=105;
  dbms_output.put_line(v_str2); 
  dbms_output.put_line(n_order); 
end;
/--this need to print result on consul

SELECT TRUNC(15.796,1) "Truncate" FROM DUAL;
SELECT TO_CHAR(
     ADD_MONTHS(sysdate,2),
     'DD-MON-YYYY') "Next month" from dual;

--1) First day of current month
select trunc(sysdate, 'MM') from dual;
--2) last day of current month.
select trunc(add_months(sysdate, 1), 'MM') - 1 from dual;
--3) first day of previious month
select trunc(add_months(sysdate, -1), 'MM') from dual;
--4) last day of previous month
select trunc(sysdate, 'MM') - 1 from dual;
--5) first day of a month that is 3 months from now.
select trunc(add_months(sysdate, 3), 'MM') from dual;
--6) last day of a month that is 3 months from now.
select trunc(add_months(sysdate, 4), 'MM') - 1 from dual;

select last_day(trunc(add_months(sysdate,1)))from dual;
--fourth saturday of month
select NEXT_DAY(TRUNC(TO_DATE('1999-02-03','yyyy-mm-dd'), 'MM')-1, 'Saturday')+3*7 from dual;

select NEXT_DAY(TRUNC(TO_DATE('2018-11-28','yyyy-mm-dd'), 'MM')-1, 'Saturday')+7 from dual;
select NEXT_DAY(TRUNC(TO_DATE('2018-11-28','yyyy-mm-dd'), 'MM')-1, 'Monday') from dual;
select NEXT_DAY(TRUNC(TO_DATE('2018-11-28','yyyy-mm-dd'), 'MM')-1, '�����������') from dual;
DECLARE 
   SUBTYPE name IS char(20); 
   SUBTYPE message IS varchar2(100); 
   salutation name; 
   greetings message; 
BEGIN 
   salutation := 'Reader '; 
   greetings := 'Welcome to the World of PL/SQL'; 
   dbms_output.put_line('Hello ' || salutation || greetings); 
END; 
/
select*from employees;
SELECT first_name, last_name 
FROM employees 
WHERE REGEXP_LIKE (first_name, '^Ste(v|ph)en$')

SELECT  department_id, employee_id,last_name, job_id, salary,manager_id
FROM    employees 
WHERE   last_name  != 'Higgins' 
START   WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

COLUMN org_chart FORMAT A12 
SELECT LPAD(last_name, LENGTH(last_name)+(LEVEL*2)-2,'_') AS org_chart 
FROM   employees 
START WITH first_name='Steven' AND last_name='King' 
CONNECT BY PRIOR employee_id=manager_id

declare 
 Number_of_days_in_February_thi integer :=23;
 l integer :=LENGTH(Number_of_days_in_February_thi);
begin
  dbms_output.put_line('Value of c: ' || Number_of_days_in_February_thi); 
  dbms_output.put_line('Value of c: ' || l); 
end;

declare
v_weight number(3) :=600;
v_message varchar2(255) :='Product 10012';
 --v_new_locn varchar2(50) :='Europe';
begin
     declare
     v_weight number(3) :=1;
     v_message varchar2(255) :='Product 11001';
     v_new_locn varchar2(50) :='Europe';
     begin    
     v_weight:=v_weight+1;
     v_new_locn:='Western '|| v_new_locn;
     dbms_output.put_line('Value of v_weigth: ' || v_weight);
     dbms_output.put_line('Value of v_weigth: ' || v_message); 
end;
 v_weight:=v_weight+1;
 v_message:=v_message|| 'is in stock';
 v_new_locn:='Western '|| v_new_locn;
 dbms_output.put_line('Value of v_weigth: ' || v_weight); 
 end;
 /
 
DECLARE
     v_weight number(3) :=20;
     begin    

     dbms_output.put_line('Value of v_weigth: ' || v_weight); 

end;
SELECT last_name, REGEXP_REPLACE(phone_number, '\.','-') 
AS phone 
FROM employees
DECLARE 
   a integer := 10; 
   b integer := 20; 
   c integer; 
   f real; 
   pi CONSTANT double precision := 3.1415; 
   greetings varchar2(20) DEFAULT 'Have a Good Day';
BEGIN 
   c := a + b; 
   dbms_output.put_line('Value of c: ' || c); 
   f := 70.0/3.0; 
   dbms_output.put_line('Value of f: ' || f); 
   dbms_output.put_line('Value of pi: ' || pi);
     dbms_output.put_line('Value of greetings: ' || greetings);
END; 
/ 
DECLARE 
   -- Global variables  
   num1 number := 95;  
   num2 number := 85;  
BEGIN  
   dbms_output.put_line('Outer Variable num1: ' || num1); 
   dbms_output.put_line('Outer Variable num2: ' || num2); 
   DECLARE  
      -- Local variables 
      num1 number := 195;  
      num2 number := 185;  
   BEGIN  
      dbms_output.put_line('Inner Variable num1: ' || num1); 
      dbms_output.put_line('Inner Variable num2: ' || num2); 
   END;  
END; 
/

CREATE TABLE CUSTOMERS( 
   ID   INT NOT NULL, 
   NAME VARCHAR (20) NOT NULL, 
   AGE INT NOT NULL, 
   ADDRESS CHAR (25), 
   SALARY   DECIMAL (18, 2),        
   PRIMARY KEY (ID) 
);

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
  
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (6, 'Komal', 22, 'MP', 4500.00 );
select*from customers;

DECLARE 
   c_id customers.id%type := 1; 
   c_name  customers.name%type; 
   c_addr customers.address%type; 
   c_sal  customers.salary%type; 
BEGIN 
   SELECT name, address, salary INTO c_name, c_addr, c_sal 
   FROM customers 
   WHERE id = c_id;  
   dbms_output.put_line 
   ('Customer ' ||c_name || ' from ' || c_addr || ' earns ' || c_sal); 
END; 
/ 

PI CONSTANT NUMBER := 3.141592654; 
DECLARE 
   -- constant declaration 
   pi constant number := 3.141592654; 
   -- other declarations 
   radius number(5,2);  
   dia number(5,2);  
   circumference number(7, 2); 
   area number (10, 2); 
BEGIN  
   -- processing 
   radius := 9.5;  
   dia := radius * 2;  
   circumference := 2.0 * pi * radius; 
   area := pi * radius * radius; 
   -- output 
   dbms_output.put_line('Radius: ' || radius); 
   dbms_output.put_line('Diameter: ' || dia); 
   dbms_output.put_line('Circumference: ' || circumference); 
   dbms_output.put_line('Area: ' || area); 
END; 
/ 

DECLARE 
   message  varchar2(30):= 'That''s tutorialspoint.com!'; 
BEGIN 
   dbms_output.put_line(message); 
END; 
/ 

DECLARE 
   a number(2) := 20; 
   b number(2) := 10; 
   c number(2) := 15; 
   d number(2) := 5; 
   e number(2) ; 
BEGIN 
   e := (a + b) * c / d;      -- ( 30 * 15 ) / 5 
   dbms_output.put_line('Value of (a + b) * c / d is : '|| e );  
   e := ((a + b) * c) / d;   -- (30 * 15 ) / 5 
   dbms_output.put_line('Value of ((a + b) * c) / d is  : ' ||  e );  
   e := (a + b) * (c / d);   -- (30) * (15/5) 
   dbms_output.put_line('Value of (a + b) * (c / d) is  : '||  e );  
   e := a + (b * c) / d;     --  20 + (150/5) 
   dbms_output.put_line('Value of a + (b * c) / d is  : ' ||  e ); 
END; 
/

DECLARE 
   a number (2) := 21; 
   b number (2) := 10; 
BEGIN 
   IF (a = b) then 
      dbms_output.put_line('Line 1 - a is equal to b'); 
   ELSE 
      dbms_output.put_line('Line 1 - a is not equal to b'); 
   END IF;  
   IF (a < b) then 
      dbms_output.put_line('Line 2 - a is less than b'); 
   ELSE 
      dbms_output.put_line('Line 2 - a is not less than b'); 
   END IF; 
    
   IF ( a > b ) THEN 
      dbms_output.put_line('Line 3 - a is greater than b'); 
   ELSE 
      dbms_output.put_line('Line 3 - a is not greater than b'); 
   END IF;  
   -- Lets change value of a and b 
   a := 5; 
   b := 20; 
   IF ( a <= b ) THEN 
      dbms_output.put_line('Line 4 - a is either equal or less than b'); 
   END IF; 
   IF ( b >= a ) THEN 
      dbms_output.put_line('Line 5 - b is either equal or greater than a'); 
   END IF;
   IF ( a <> b ) THEN 
      dbms_output.put_line('Line 6 - a is not equal to b'); 
   ELSE 
      dbms_output.put_line('Line 6 - a is equal to b'); 
   END IF;  
END; 
/

DECLARE 
PROCEDURE compare (value  varchar2,  pattern varchar2 ) is 
BEGIN 
   IF value LIKE pattern THEN 
      dbms_output.put_line ('True'); 
   ELSE 
      dbms_output.put_line ('False'); 
   END IF; 
END;  
BEGIN 
   compare('Zara Ali', 'Z%A_i'); 
   compare('Nuha Ali', 'Z%A_i'); 
END; 
/

DECLARE 
   x number(2) := 10; 
BEGIN 
   IF (x between 5 and 20) THEN 
      dbms_output.put_line('True'); 
   ELSE 
      dbms_output.put_line('False'); 
   END IF; 
    
   IF (x BETWEEN 5 AND 10) THEN 
      dbms_output.put_line('True'); 
   ELSE 
      dbms_output.put_line('False'); 
   END IF; 
    
   IF (x BETWEEN 11 AND 20) THEN 
      dbms_output.put_line('True'); 
   ELSE 
      dbms_output.put_line('False'); 
   END IF; 
END; 
/

DECLARE 
   letter varchar2(1) := 'm'; 
BEGIN 
   IF (letter in ('a', 'b', 'c')) THEN 
      dbms_output.put_line('True'); 
   ELSE 
      dbms_output.put_line('False'); 
   END IF; 
  
   IF (letter in ('m', 'n', 'o')) THEN 
       dbms_output.put_line('True'); 
   ELSE 
      dbms_output.put_line('False'); 
   END IF; 
    
   IF (letter is null) THEN 
    dbms_output.put_line('True'); 
   ELSE 
      dbms_output.put_line('False'); 
   END IF; 
END; 
/

DECLARE 
   a number(2) := 10; 
BEGIN 
   a:= 10; 
  -- check the boolean condition using if statement  
   IF( a < 20 ) THEN 
      -- if condition is true then print the following   
      dbms_output.put_line('a is less than 20 ' ); 
   END IF; 
   dbms_output.put_line('value of a is : ' || a); 
END; 
/

DECLARE 
   a number(3) := 100; 
BEGIN 
   IF ( a = 10 ) THEN 
      dbms_output.put_line('Value of a is 10' ); 
   ELSIF ( a = 20 ) THEN 
      dbms_output.put_line('Value of a is 20' ); 
   ELSIF ( a = 30 ) THEN 
      dbms_output.put_line('Value of a is 30' ); 
   ELSE 
       dbms_output.put_line('None of the values is matching'); 
   END IF; 
   dbms_output.put_line('Exact value of a is: '|| a );  
END; 
/

DECLARE 
   grade char(1) := 'A'; 
BEGIN 
   CASE grade 
      when 'A' then dbms_output.put_line('Excellent'); 
      when 'B' then dbms_output.put_line('Very good'); 
      when 'C' then dbms_output.put_line('Well done'); 
      when 'D' then dbms_output.put_line('You passed'); 
      when 'F' then dbms_output.put_line('Better try again'); 
      else dbms_output.put_line('No such grade'); 
   END CASE; 
END; 
/

DECLARE 
   grade char(1) := 'B'; 
BEGIN 
   case  
      when grade = 'A' then dbms_output.put_line('Excellent'); 
      when grade = 'B' then dbms_output.put_line('Very good'); 
      when grade = 'C' then dbms_output.put_line('Well done'); 
      when grade = 'D' then dbms_output.put_line('You passed'); 
      when grade = 'F' then dbms_output.put_line('Better try again'); 
      else dbms_output.put_line('No such grade'); 
   end case; 
END; 
/

DECLARE 
   a number(3) := 100; 
   b number(3) := 200; 
BEGIN 
   -- check the boolean condition  
   IF( a = 100 ) THEN 
   -- if condition is true then check the following  
      IF( b = 200 ) THEN 
      -- if condition is true then print the following  
      dbms_output.put_line('Value of a is 100 and b is 200' ); 
      END IF; 
   END IF; 
   dbms_output.put_line('Exact value of a is : ' || a ); 
   dbms_output.put_line('Exact value of b is : ' || b ); 
END; 
/

DECLARE 
   x number := 10; 
BEGIN 
   LOOP 
      dbms_output.put_line(x); 
      x := x + 10; 
      IF x > 50 THEN 
         exit; 
      END IF; 
   END LOOP; 
   -- after exit, control resumes here  
   dbms_output.put_line('After Exit x is: ' || x); 
END; 
/

DECLARE 
   x number := 10; 
BEGIN 
   LOOP 
      dbms_output.put_line(x); 
      x := x + 10; 
      exit WHEN x > 50; 
   END LOOP; 
   -- after exit, control resumes here 
   dbms_output.put_line('After Exit x is: ' || x); 
END; 
/

DECLARE 
   a number(2) := 10; 
BEGIN 
   WHILE a < 20 LOOP 
      dbms_output.put_line('value of a: ' || a); 
      a := a + 1; 
   END LOOP; 
END; 
/ 

DECLARE 
   a number(2); 
BEGIN 
   FOR a in 10 .. 20 LOOP 
      dbms_output.put_line('value of a: ' || a); 
  END LOOP; 
END; 
/

DECLARE 
   a number(2) ; 
BEGIN 
   FOR a IN REVERSE 10 .. 20 LOOP 
      dbms_output.put_line('value of a: ' || a); 
   END LOOP; 
END; 
/

DECLARE 
   i number(3); 
   j number(3); 
BEGIN 
   i := 2; 
   LOOP 
      j:= 2; 
      LOOP 
         exit WHEN ((mod(i, j) = 0) or (j = i)); 
         j := j +1; 
      END LOOP; 
   IF (j = i ) THEN 
      dbms_output.put_line(i || ' is prime'); 
   END IF; 
   i := i + 1; 
   exit WHEN i = 50; 
   END LOOP; 
END; 
/

SELECT MOD(11,4) "Modulus" FROM DUAL;

DECLARE 
   a number(2) := 10; 
BEGIN 
   -- while loop execution  
   WHILE a < 20 LOOP 
      dbms_output.put_line ('value of a: ' || a); 
      a := a + 1; 
      IF a > 15 THEN 
         -- terminate the loop using the exit statement 
         EXIT; 
      END IF; 
   END LOOP; 
END; 
/

DECLARE 
   a number(2) := 1; 
BEGIN 
   -- while loop execution  
   WHILE a <= 10 LOOP 
      dbms_output.put_line ('value of a: ' || a); 
      a := a + 1; 
      IF a = 6 OR a=8 THEN 
         -- skip the loop using the CONTINUE statement 
         a := a + 1; 
         CONTINUE; 
      END IF; 
   END LOOP; 
END; 
/ 
QUERY_REWRITE_ENABLED