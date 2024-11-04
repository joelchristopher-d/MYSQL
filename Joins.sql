use SYS;

CREATE TABLE COLLEGE
(
CLG_ID INT,
CLG_NAME VARCHAR(50),
CONSTRAINT PKCLG_ID PRIMARY KEY (CLG_ID)
);
SELECT * FROM COLLEGE;
SELECT CLG_ID FROM COLLEGE ORDER BY CLG_ID DESC;
INSERT INTO COLLEGE VALUES
(1,"MEDICAL"),(2,"ENGG");

CREATE TABLE STAFF
(
STAFF_ID VARCHAR(10),
CLG_ID INT,
FNAME VARCHAR(20) NOT NULL,
LNAME VARCHAR(20),
DEPARTMENT VARCHAR(20),
CONSTRAINT PKSTF PRIMARY KEY (STAFF_ID),
CONSTRAINT FKCLG_ID FOREIGN KEY (CLG_ID) REFERENCES COLLEGE(CLG_ID)
);
SELECT * FROM STAFF;

INSERT INTO STAFF VALUES
("ST_1",2,"Joe","Chris","sc");
INSERT INTO STAFF VALUES
("ST_2",1,"BOE","ING","medi");
INSERT INTO STAFF VALUES
("ST_3",1,"Sachin","Tendulkar","medi",100);

UPDATE STAFF
SET DEPARTMENT = "ENGG" , LNAME = "Christopher"
WHERE STAFF_ID = "ST_1";

DELETE FROM COLLEGE WHERE CLG_ID = 1;

ALTER TABLE STAFF ADD COLUMN SALARY INT;

UPDATE STAFF
SET SALARY = 500
WHERE STAFF_ID = "ST_2";

SELECT * FROM STAFF S
JOIN COLLEGE C ON S.CLG_ID = C.CLG_ID;




