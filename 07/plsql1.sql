set serveroutput on
DECLARE
	CURSOR ec IS
		SELECT * FROM dependent;
	dep ec%ROWTYPE;
BEGIN
	FOR dep IN ec
	LOOP
		DBMS_OUTPUT.PUT_LINE(dep.dependent_name);
		DBMS_OUTPUT.PUT_LINE(dep.relationship);
	END LOOP;
END;
/
/* This looks right to me but it's not printing anything */
