set serveroutput on

declare 
v_max_depno number(5,2);
begin 
    select max(department_id)  into v_max_depno from departments;
    DBMS_OUTPUT.PUT_LINE('the maximum departments id is :' || v_max_depno);
end;

DECLARE 
v_dept_name DEPARTMENTS.DEPARTMENT_NAME%TYPE:='Education';
v_dept_id NUMBER(5,2);
v_max_depno NUMBER(5,2);
BEGIN
SELECT MAX(department_id) INTO v_max_depno
FROM departments;
DBMS_OUTPUT.PUT_LINE('The maximum department_id is:  '||v_max_depno);
v_dept_id:=v_max_depno+10;
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (v_dept_id,v_dept_name,NULL);
DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT gives '||SQL%ROWCOUNT);
END;
/
SELECT *
FROM departments
WHERE department_id= (SELECT MAX(department_id) FROM departments);

DECLARE 
v_dept_id NUMBER:=280;
BEGIN
UPDATE departments
SET location_id=3000
WHERE department_id=v_dept_id;
END;
/

INSERT INTO departments (department_id,department_name,manager_id,location_id) 
VALUES (280, 'Education', null, null );
SELECT *
FROM departments
WHERE department_id=280;
DELETE
FROM departments
WHERE department_id=280;



