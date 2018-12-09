set serveroutput on

DECLARE
    v_deptno NUMBER:=20;
    CURSOR c_emp_cursor IS
    SELECT last_name, salary, manager_id FROM employees
    WHERE department_id=v_deptno;
BEGIN
    FOR emp_record IN c_emp_cursor
    LOOP
    IF emp_record.salary<5000 AND 
    (emp_record.manager_id=101 OR emp_record.manager_id=124) THEN
    	DBMS_OUTPUT.PUT_LINE(emp_record.last_name||' Due for a raise');
    ELSE
    	DBMS_OUTPUT.PUT_LINE(emp_record.last_name||' Not Due for a raise');
    END IF;
    END LOOP;
END;

DECLARE
    CURSOR c_dept_cursor IS
    SELECT department_id, department_name
    FROM departments
    WHERE department_id<100
    ORDER BY department_id;
    --coursor n2
    CURSOR c_emp_cursor (deptno NUMBER) IS
    SELECT last_name, job_id, hire_date, salary
    FROM employees
    WHERE department_id=deptno
    AND employee_id<120;
    v_deptno departments.department_id%TYPE;
    v_deptname departments.department_name%TYPE;
    v_lname employees.last_name%TYPE;
    v_job employees.job_id%TYPE;
    v_hire employees.hire_date%TYPE;
    v_sal employees.salary%TYPE;
BEGIN
    OPEN c_dept_cursor;
    LOOP
        FETCH c_dept_cursor INTO v_deptno, v_deptname;
        EXIT WHEN c_dept_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE
('Department ID: '||v_deptno||' Department Name: '||v_deptname);
        IF NOT c_emp_cursor%ISOPEN THEN
          OPEN c_emp_cursor(v_deptno);
        END IF;
        LOOP
          FETCH c_emp_cursor INTO v_lname, v_job, v_hire, v_sal;
          EXIT WHEN c_emp_cursor%NOTFOUND;
          DBMS_OUTPUT.PUT_LINE(v_lname||'   '||v_job||'   '||v_hire||'   '||v_sal);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(LPAD(' ',60,'-'));
        CLOSE c_emp_cursor;
    END LOOP;
    CLOSE c_dept_cursor;
END;
