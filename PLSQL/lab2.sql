set serveroutput on
--1)	����� �� ��������� ������ PL/SQL ���������� �������?
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

/*2)	�������� � ��������� ������� ��������� ����, 
������� ������� ����� �Hello World�. 
��������� � ��������� ������ ��� lab_01_02_soln.sql. */

DECLARE 
   number1to7 varchar2(20):= 'Message Hello World!'; 
  by_when 	DATE := CURRENT_DATE+1;
BEGIN 
   dbms_output.put_line(number1to7); 
END; 
/ 

3) ����������� ��������� ����, � ����� �������� �� �����������, ������� �������� �������:

DECLARE
v_fname VARCHAR2(20);
v_lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
DBMS_OUTPUT.PUT_LINE(v_fname ||' ' || v_lname);
END;

 �������� ������������ ��������� ���� � ��������� ��� ��� ����� ������.
a) �������� ������ lab_01_02_soln.sql, ������� ������� � �������� 1.

DECLARE 
   number1to7 varchar2(20):= 'Message Hello World!'; 
  v_today 	DATE := SYSDATE;
  v_tommorow v_today%TYPE:=v_today;
  b_basic_percent number;
  b_pf_percent number;
BEGIN 
   dbms_output.put_line(v_tommorow); 
   v_tommorow:=v_today+1;
   b_basic_percent:=45;
   b_pf_percent:=12;
   dbms_output.put_line('Today is :'||TO_CHAR (v_today,'DD-MON-YY')); 
   dbms_output.put_line('TOMORROW IS :'||TO_CHAR (v_tommorow,'DD-MON-YY')); 
   dbms_output.put_line('b_basic_percent '||b_basic_percent);
   dbms_output.put_line('b_pf_percent '||b_pf_percent);
END; 



