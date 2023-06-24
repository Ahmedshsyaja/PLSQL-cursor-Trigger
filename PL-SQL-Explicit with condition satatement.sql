DECLARE
  CURSOR c_emp IS
    SELECT * FROM emp WHERE sal > (SELECT AVG(SAL) FROM EMP);
BEGIN
  FOR v_c IN c_emp LOOP
    DBMS_OUTPUT.PUT_LINE(v_c.ename || ' ' || v_c.EMPNO || ' ' || v_c.JOB || ' ' || v_c.MGR || ' ' || v_c.HIREDATE || ' ' || v_c.SAL || ' ' || v_c.COMM || ' ' || v_c.DEPTNO);
  END LOOP;
END;
