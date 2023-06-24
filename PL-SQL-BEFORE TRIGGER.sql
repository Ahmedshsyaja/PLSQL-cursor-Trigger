CREATE TABLE NEWEMP(
  EMPNO NUMBER,
  ENAME VARCHAR2(50),
  JOB VARCHAR2(50),
  MGR NUMBER,
  HIREDATE DATE,
  SAL NUMBER,
  COMM NUMBER,
  DEPTNO NUMBER
);

CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON EMP
FOR EACH ROW
WHEN (NEW.EMPNO > 0)
DECLARE
  sal_diff NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('ALERT CHANGE IN EMP_TABLE');
  INSERT INTO NEWEMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
  VALUES (:OLD.EMPNO,:OLD.ENAME,:OLD.JOB,:OLD.MGR,:OLD.HIREDATE,:OLD.SAL,:OLD.COMM,:OLD.DEPTNO);
END;

INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (1, 'John Smith', 'Manager', NULL, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 5000, NULL, 10);