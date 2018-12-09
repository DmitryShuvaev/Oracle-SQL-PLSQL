set serveroutput on

CREATE TABLE MESSAGES( 
results NUMBER(6)
);

DECLARE 
   a number(2) := 1; 
BEGIN 
   -- while loop execution  
   WHILE a <= 10 LOOP 
      dbms_output.put_line ('value of a: ' || a); 
         INSERT INTO MESSAGES
          VALUES(a);
      a := a + 1; 
      IF a = 6 OR a=8 THEN 
         -- skip the loop using the CONTINUE statement 
         a := a + 1; 
         CONTINUE; 
      END IF; 
   END LOOP; 
END; 
/ 
select*from MESSAGES;
delete from MESSAGES;

CREATE TABLE EMP
  AS (SELECT * FROM employees);
  
  ALTER TABLE EMP
  ADD  stars  VARCHAR2(50);
/*  
CREATE TABLE EMP
    ( employee_id    NUMBER(6)
    , first_name     VARCHAR2(20)
    , last_name      VARCHAR2(25)	 
    , email          VARCHAR2(25)	
    , phone_number   VARCHAR2(20)
    , hire_date      DATE	
    , job_id         VARCHAR2(10)	
    , salary         NUMBER(8,2)
    , commission_pct NUMBER(2,2)
    , manager_id     NUMBER(6)
    , department_id  NUMBER(4),
    stars  VARCHAR2(50)
    ) ;
    */
select*from emp;

drop table emp;
/*
INSERT INTO EMP VALUES 
        ( 174 , 'Steven' , 'King', 'SKING', '515.123.4567', 
        TO_DATE('17-JUN-1987', 'dd-MON-yyyy'), 'AD_PRES', 12500, NULL, NULL, 90,null
        );
*/
DECLARE
    v_empno EMP.employee_id%TYPE:=174;
    v_asterisk EMP.stars%TYPE:=NULL;
    v_sal EMP.salary%TYPE;
BEGIN
    SELECT salary INTO v_sal
    FROM EMP
    WHERE employee_id=v_empno;
    LOOP
    EXIT WHEN v_sal < 500;
      v_asterisk:=v_asterisk||'*';
      dbms_output.put_line ('value of v_sal: ' || v_sal); 
      v_sal:=v_sal-1000;
     
      
    END LOOP;
    UPDATE EMP
    SET stars=v_asterisk
    WHERE employee_id=v_empno;
    COMMIT;
END;
/
SELECT employee_id, salary, stars
FROM EMP
where stars is not null;

delete from EMP;
