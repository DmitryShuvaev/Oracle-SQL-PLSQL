set serveroutput on

DECLARE
    v_country_record countries%ROWTYPE;
    v_countryid countries.country_id%TYPE:=UPPER('&country_id');
BEGIN
    SELECT * INTO v_country_record
    FROM countries
    WHERE country_id=v_countryid;
    DBMS_OUTPUT.PUT_LINE('Country ID: '||v_country_record.country_id||
' Country Name: '||v_country_record.country_name||' Region: '||v_country_record.region_id);
END;


select*from countries;
DECLARE
    v_country_record countries%ROWTYPE;
    v_countryid countries.country_id%TYPE:=UPPER('DE');
BEGIN
    SELECT * INTO v_country_record
    FROM countries
    WHERE country_id=v_countryid;
    DBMS_OUTPUT.PUT_LINE('Country ID: '||v_country_record.country_id||
' Country Name: '||v_country_record.country_name||' Region: '||v_country_record.region_id);
END;

DECLARE
    TYPE dept_table_type IS TABLE OF
       departments.department_name%TYPE
       INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    f_loop_count departments.department_id%TYPE:=10;
    v_deptno departments.department_id%TYPE:=0;
BEGIN
    LOOP
        v_deptno:=v_deptno+f_loop_count;
        SELECT department_name INTO my_dept_table(v_deptno) 
        FROM departments WHERE department_id=v_deptno;
        EXIT WHEN v_deptno>100;
    END LOOP;
    FOR i IN 1..10
    LOOP
        DBMS_OUTPUT.PUT_LINE(my_dept_table(i*10));        
    END LOOP;
END;

DECLARE
    TYPE dept_table_type IS TABLE OF
       departments%ROWTYPE
       INDEX BY PLS_INTEGER;
    my_dept_table dept_table_type;
    i number;
BEGIN
    SELECT *bulk collect INTO my_dept_table
    FROM departments
    WHERE manager_id IS NOT NULL;
    i:=1;
    LOOP
        DBMS_OUTPUT.PUT_LINE
('Department Number:  '||my_dept_table(i).department_id
                        ||'; Department Name: '||my_dept_table(i).department_name
                        ||'; Manager ID: '||my_dept_table(i).manager_id
                        ||'; Location ID: '||my_dept_table(i).location_id);
        i:=my_dept_table.next(i);
        exit when i is null;
    END LOOP;
END;

select department_id,department_name,MANAGER_ID from departments;