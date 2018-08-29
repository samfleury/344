DROP TABLE e1 cascade constraints;
DROP TABLE d1 cascade constraints;

CREATE TABLE d1
  (dname        VARCHAR2(15)  NOT NULL UNIQUE,
   dnumber      NUMBER(2)     PRIMARY KEY,
   tot_sal      NUMBER(12) DEFAULT 0);

INSERT INTO d1 VALUES
   ('Research', 5, 0);
INSERT INTO d1 VALUES
   ('Administration', 4, 0);
INSERT INTO d1 VALUES
   ('Headquarters', 1, 0);


CREATE TABLE e1
  (fname    VARCHAR2(15) NOT NULL,
   ssn      CHAR(9)      PRIMARY KEY,
   salary   NUMBER(6),
   dno      INT          NOT NULL 
      REFERENCES d1(dnumber));

/* Triggers go here
 * Cases for updating tot_sal:
 * -Adding an employee to a department
 * -Removing an employee from a department
 * -Changing an employee's department
 * -Changing an employee salary */

CREATE OR REPLACE TRIGGER modify_salary
AFTER INSERT OR UPDATE OR DELETE OF salary ON e1
FOR EACH ROW
BEGIN
	IF INSERTING THEN
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary
		WHERE dnumber = :NEW.dno;
	ELSIF UPDATING THEN
		UPDATE d1
		SET tot_sal = tot_sal + :NEW.salary - :OLD.salary
		WHERE dnumber = :OLD.dno;
	ELSE -- deleting
		UPDATE d1
		SET tot_sal = tot_sal - :OLD.salary
		WHERE dnumber = :OLD.dno;
	END IF;
END;
/

/* STILL NEED DEPARTMENT CHANGE TRIGGER */
CREATE OR REPLACE TRIGGER modify_dept
AFTER UPDATE OF dno ON e1
FOR EACH ROW
BEGIN
	UPDATE d1
		SET tot_sal = tot_sal - :OLD.salary --update old dept tot_sal
		WHERE d1.dnumber=:OLD.dno;
	update d1
		SET tot_sal = tot_sal + :NEW.salary --update new dept tot_sal
		WHERE d1.dnumber = :NEW.dno; --how to point to the right depts
END;
/

SELECT * FROM d1; --print

INSERT INTO e1 VALUES
  ('John','123456789',30000,5);
INSERT INTO e1 VALUES
  ('Franklin','333445555',40000,5);

SELECT * FROM d1; --print

INSERT INTO e1 VALUES
  ('Alicia','999887777',25000,4);
INSERT INTO e1 VALUES
  ('Jennifer','987654321',43000,4);
INSERT INTO e1 VALUES
  ('Ramesh','666884444',38000,5);
INSERT INTO e1 VALUES
  ('Joyce','453453453',25000,5);
INSERT INTO e1 VALUES
  ('Ahmad','987987987',25000,4);
INSERT INTO e1 VALUES
  ('James','888665555',55000,1);


SELECT * FROM d1;

SELECT * FROM e1;

COMMIT;


UPDATE e1 SET salary=1;

SELECT * FROM d1;

INSERT INTO e1 VALUES
  ('Jimz','888665544',55002,1);

SELECT * FROM d1;

UPDATE e1 SET dno = 2 WHERE dno = 1;

SELECT * FROM d1;

DELETE * FROM e1;

SELECT * FROM d1;





