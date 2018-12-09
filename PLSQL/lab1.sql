set serveroutput on
--1)	Какой из следующих блоков PL/SQL выполнится успешно?
BEGIN
END;
/

DECLARE
BEGIN
END;


DECLARE
v_amount INTEGER(10);
BEGIN
DBMS_OUTPUT.PUT_LINE(v_amount);
END;
/ 

/*2)	Создайте и выполните простой анонимный блок, 
который выводит фразу «Hello World». 
Выполните и сохраните скрипт как lab_01_02_soln.sql. */

DECLARE 
   message  varchar2(20):= 'Message Hello World!'; 
BEGIN 
   dbms_output.put_line(message); 
END; 
/ 