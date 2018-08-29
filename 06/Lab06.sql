INSERT INTO department VALUES ('TempDept', 6, 123456789, TO_DATE('18-Jul-2002', 'DD-MON-YYYY'));
INSERT INTO project VALUES ('TempProject', 50, 'Houston', 6);

SELECT snum, sname FROM salespeople s WHERE 1<(SELECT COUNT(*) FROM customers c WHERE s.snum=c.snum);
SELECT * FROM orders outer WHERE outer.amt > (SELECT AVG(amt) FROM orders inner WHERE outer.cnum=inner.cnum);
SELECT fname, lname FROM employee WHERE NOT EXISTS (SELECT * FROM dependent WHERE ssn=essn);
SELECT pno FROM works_on WHERE essn = (SELECT ssn FROM employee WHERE lname LIKE 'Smith') UNION SELECT pnumber FROM project WHERE dnum = (SELECT dnumber FROM department WHERE mgrssn = (SELECT ssn FROM employee WHERE lname LIKE 'Smith'));
UPDATE employee SET salary = (salary * 1.10) WHERE lname NOT LIKE 'Borg';
select * from employee;

DROP TABLE hou_emp;
DROP TABLE emp_dep;
CREATE TABLE hou_emp AS (SELECT * FROM employee WHERE address LIKE '%Houston%');
CREATE TABLE emp_dep AS (SELECT outer.fname, outer.lname, inner.dependent_name, inner.sex, inner.bdate FROM employee outer, dependent inner WHERE inner.essn = outer.ssn);

select * from hou_emp;
select * from emp_dep;

