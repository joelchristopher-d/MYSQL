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

SELECT CONCAT(S.FNAME,S.LNAME) AS FULLNAME,C.CLG_NAME FROM STAFF S
JOIN COLLEGE C ON C.CLG_ID = S.CLG_ID;


--2 joins


use SYS;

create table candidate( 
name varchar(15),
city varchar(15),
designation varchar(15),
salary int);
select * from candidate;
alter table candidate  add column cand_id int;
alter table candidate  add constraint pkid primary key (cand_id);
insert into candidate values
("cand1","chennai","data scientist",100000,1),
("cand2","tenkasi","sde1",410000,2),
("cand3","mumbai","sde2",160000,3),
("cand4","cmbt","hr",210000,4),
("cand5","madurai","automation",660000,5),
("cand6","malaysia","ba",230000,6),
("cand7","austria","nwe",300000,7),
("cand8","pakistan","tester",200000,8);

create table requirement(
req_id int,
reqname varchar(10),
city varchar(15),
designation varchar(10)
);
alter table requirement  add constraint pkid primary key (req_id);
alter table requirement  add column company varchar(15);

insert into requirement values 
(101,"req1","bangalore","sde2","infosys"),
(102,"req2","hyderabad","hr","tcs"),
(103,"req3","vizag","ba","nvidia"),
(104,"req4","chennai","accnts","amazon"),
(105,"req5","cochi","nwe","google"),
(106,"req6","kolkata","ds","zoho"),
(107,"req7","pune","sde","flipkart");

create table submission (
sub_id int,
req_id int,
cand_id int,
date datetime);
ALTER TABLE submission ADD PRIMARY KEY (sub_id);

insert into submission values
("1001","101","1","2024-06-15");
insert into submission values
("1002","107","1","2024-07-28"),
("1003","106","1","2023-01-30"),
("1004","103","1","2024-12-15"),
("1005","105","1","2024-09-01"),
("1006","102","1","2024-11-22"),
("1007","104","1","2024-10-13");

update submission set cand_id = 3 where sub_id = 1003;
UPDATE submission 
SET cand_id = 2 
WHERE sub_id = 1007;
select * from candidate;
select * from requirement;
select * from submission;

select s.sub_id,c.cand_id,c.name,r.reqname from submission s
join candidate c on c.cand_id = s.cand_id
join requirement r on r.req_id = s.req_id;


