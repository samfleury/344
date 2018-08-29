CREATE TABLE emp_dep AS (SELECT outer.fname, outer.lname, inner.dependent_name, inner.sex, inner.bdate FROM employee outer, dependent inner WHERE inner.essn = outer.ssn);
