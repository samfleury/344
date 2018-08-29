set serveroutput on
CREATE OR REPLACE
PROCEDURE listHours (aa IN NUMBER)
AS
	CURSOR ec IS
	    	SELECT * FROM works_on WHERE pno=aa;
	works ec%ROWTYPE;
	insuff_hours EXCEPTION;
BEGIN
	FOR works IN ec LOOP
		DBMS_OUTPUT.PUT_LINE(works.essn || '  ' || works.hours);
		IF works.hours<8 THEN
			RAISE insuff_hours;
		END IF;
	END LOOP;
EXCEPTION
	WHEN insuff_hours THEN
		DBMS_OUTPUT.PUT_LINE('Someone doesnt work enough');
END;
/
