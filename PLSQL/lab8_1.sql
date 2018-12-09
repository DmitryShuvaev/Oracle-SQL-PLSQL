set serveroutput on
CREATE TABLE MESSAGES2( 
results varchar2(1000)
);
select*from MESSAGES2;

TRUNCATE TABLE MESSAGES2;
select*from employees
order by salary;

DECLARE
v_ename employees.last_name%TYPE;
v_emp_sal employees.salary%TYPE:=2000;
er varchar2(1000):=' ';
BEGIN
select last_name INTO v_ename from employees
where salary=v_emp_sal;
dbms_output.put_line('name: ' || v_ename||' salary '||v_emp_sal);
	INSERT INTO MESSAGES2 (results)
	VALUES(v_ename);
EXCEPTION 
   WHEN no_data_found THEN 
      er:='No employee with a salary of '||CAST (v_emp_sal AS VARCHAR2);
      dbms_output.put_line(er);
	INSERT INTO MESSAGES2 (results)
	VALUES(er);
   WHEN others THEN
   er:='More than one employee with a salary of '||CAST (v_emp_sal AS VARCHAR2);
      dbms_output.put_line(er);
    INSERT INTO MESSAGES2 (results)
	VALUES(er);
END;

select*from messages2;

TRUNCATE TABLE messages2;

DECLARE
       v_ename employees.last_name%TYPE:='King';
       v_emp_sal employees.salary%TYPE:=24000;
       c varchar2(1000);
    BEGIN
      select last_name INTO v_ename from employees
      where salary=v_emp_sal;
       c := CAST (v_emp_sal AS VARCHAR2)||v_ename;
      
  
      DBMS_OUTPUT.PUT_LINE(v_ename);
      DBMS_OUTPUT.PUT_LINE(v_emp_sal);
    DBMS_OUTPUT.PUT_LINE(c);
   END;
   /