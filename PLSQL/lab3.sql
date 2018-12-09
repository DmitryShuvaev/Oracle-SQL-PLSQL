set serveroutput on

DECLARE 
v_weight NUMBER(3) :=600;
v_message VARCHAR2(255):='Product 10012';
--v_new_locn VARCHAR2(50);
BEGIN
 DECLARE
  v_weight NUMBER(3) :=1;
  v_message VARCHAR2(255):='Product 11001';
  v_new_locn VARCHAR2(50):='Europe';
  BEGIN
   v_weight:=v_weight+1;
   v_new_locn:='Western '|| v_new_locn;
    dbms_output.put_line('v_weight Pos1 '||v_weight);
    dbms_output.put_line('v_new_locn Pos1 '||v_new_locn);
   END;
    v_weight:=v_weight+1;
    v_message:=v_message||' is in stock';
    --v_new_locn:='Western '|| v_new_locn;
    dbms_output.put_line('v_weight Pos2 '||v_weight);
    dbms_output.put_line('v_new_locn Pos2 '||v_new_locn);
    dbms_output.put_line('v_message Pos2 '||v_message);
END;
/

� ��������� PL/SQL ����� ���������� �������� � 
���� ������ ��� ������� �� ��������� �������:

DECLARE
 v_customer VARCHAR2(50):='Womansport';
 v_credit_rating VARCHAR2(50):='EXCELLENT';
 BEGIN
  DECLARE
  v_customer NUMBER(7):=201;
  v_name VARCHAR2(25):='Unisports';
  BEGIN
   v_credit_rating:='GOOD';
    dbms_output.put_line(v_customer);
    dbms_output.put_line(v_name);
    dbms_output.put_line(v_credit_rating);
   END;
END;

DECLARE
    v_fname VARCHAR2(15);
    v_emp_sal NUMBER(10);
BEGIN
    SELECT first_name, salary INTO v_fname, v_emp_sal
    FROM employees WHERE employee_id=110;
    DECLARE
    reserve_fond number(5,2);
    BEGIN
    reserve_fond:=0.12*0.45*v_emp_sal;
    DBMS_OUTPUT.PUT_LINE('Hello '||v_fname);
    DBMS_OUTPUT.PUT_LINE('Your salary is '||v_emp_sal);
    DBMS_OUTPUT.PUT_LINE('Your contribution towards PF: '||reserve_fond);
    END;
END;


