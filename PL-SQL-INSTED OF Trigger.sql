CREATE OR REPLACE VIEW NEW_VIEW AS
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e JOIN dept d ON e.deptno = d.deptno;

CREATE OR REPLACE TRIGGER V_TR
INSTEAD OF UPDATE ON NEW_VIEW
FOR EACH ROW
BEGIN
  UPDATE emp
  SET sal = :new.sal
  WHERE empno = :old.empno;
  DBMS_OUTPUT.PUT_LINE('Data Updated');
END;
