CREATE TABLE EVALUATIONS_LOG ( 
 log_date DATE,
 action VARCHAR2(50)
 );
 
 CREATE OR REPLACE TRIGGER EVAL_CHANGE_TRIGGER
  AFTER INSERT OR UPDATE OR DELETE
  ON Taken
DECLARE
  log_action  EVALUATIONS_LOG.action%TYPE;
BEGIN
  IF INSERTING THEN
    log_action := 'Insert';
  ELSIF UPDATING THEN
    log_action := 'Update';
  ELSIF DELETING THEN
    log_action := 'Delete';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;

  INSERT INTO EVALUATIONS_LOG (log_date, action)
    VALUES (SYSDATE, log_action);
END;

select*from taken;
truncate table taken;
select*from evaluations_log;
INSERT INTO Taken (ID,Student,Course) 
VALUES (1, 'Robert', 'Databases'); 
INSERT INTO Taken (ID,Student,Course) 
VALUES (2, 'Robert', 'Programming Languages'); 

UPDATE taken 
SET Student = 'Jon' 
WHERE id = 2; 
