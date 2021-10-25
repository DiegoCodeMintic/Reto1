--creacion de tabla DOCTOR
CREATE TABLE DOCTOR (
	ID NUMBER,
	SPECIALITY VARCHAR2(20),
	GRADUATE_YEAR NUMBER,
	DEPARTMENT_ID NUMBER,
    NAME VARCHAR2(4000),
	PRIMARY KEY (ID));

--creacion de consecutivos
--drop SEQUENCE increment_id; --para reset la secuencia
CREATE SEQUENCE increment_id START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER SECUENCIA_DOCTOR
BEFORE INSERT ON DOCTOR FOR EACH ROW
WHEN (NEW.ID IS NULL)
BEGIN
SELECT increment_id.NEXTVAL INTO :NEW.ID FROM DUAL;
END;



--info GET:
SELECT*FROM DOCTOR;

--info POST:
BEGIN
insert into DOCTOR
(SPECIALITY,GRADUATE_YEAR,DEPARTMENT_ID,NAME) VALUES
(:specialty,:graduate_year,:department_id,:name);
:status_code:=201;
END;

--info PUT:
BEGIN
update DOCTOR
set 
SPECIALITY=:specialty,
GRADUATE_YEAR=:graduate_year,
DEPARTMENT_ID=:department_id,
NAME=:name
where ID=:id;
:status_code:=201;
END;

--info DELETE:
BEGIN
delete DOCTOR where ID=:id;
:status_code:=204;
END;


