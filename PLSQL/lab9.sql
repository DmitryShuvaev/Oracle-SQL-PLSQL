set serveroutput on
CREATE OR REPLACE PROCEDURE greetings 
AS 
BEGIN 
   dbms_output.put_line('Hello World!'); 
END; 
/
EXECUTE greetings;

CREATE OR REPLACE Procedure greet
AS
BEGIN
    DECLARE
      V_today DATE := SYSDATE;
      V_tommorow v_today%TYPE;
    BEGIN
      V_tommorow := v_today +1;
      DBMS_OUTPUT.PUT_LINE('TODAY IS:'|| v_today);
      DBMS_OUTPUT.PUT_LINE('TOMMOROW IS:'|| v_tommorow);
    END;
END greet;
/

EXECUTE greet;

DROP PROCEDURE greet;

CREATE OR REPLACE PROCEDURE greet( name IN VARCHAR2)IS 
BEGIN 
       DECLARE
      V_today DATE := SYSDATE;
      V_tommorow v_today%TYPE;
    BEGIN
      V_tommorow := v_today +1;
      dbms_output.put_line('Hello '||name);
      DBMS_OUTPUT.PUT_LINE('TODAY IS:'|| v_today);
      DBMS_OUTPUT.PUT_LINE('TOMMOROW IS:'|| v_tommorow);
    END;
END greet; 
/

EXECUTE greet('Nancy');