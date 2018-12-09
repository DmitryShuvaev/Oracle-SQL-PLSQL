set serveroutput on

CREATE TABLE top_salaries( 
salary NUMBER(8,2)
);

DECLARE
	v_num NUMBER:=&n;
	v_sal employees.salary%TYPE;
	CURSOR c_emp_cursor IS
	SELECT DISTINCT salary
	FROM employees
	ORDER BY salary DESC;
BEGIN
	OPEN  c_emp_cursor;
	LOOP
	FETCH c_emp_cursor INTO v_sal;
    DBMS_OUTPUT.PUT_LINE(c_emp_cursor%ROWCOUNT);
	EXIT WHEN c_emp_cursor%ROWCOUNT>v_num
	OR c_emp_cursor%NOTFOUND;
	INSERT INTO top_salaries (salary)
	VALUES(v_sal);		
	END LOOP;
	CLOSE c_emp_cursor;
END;
/
SELECT salary
FROM top_salaries;

TRUNCATE TABLE top_salaries;