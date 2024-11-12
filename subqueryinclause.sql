use SYS;

CREATE TABLE Department (
    DepartName VARCHAR(50) PRIMARY KEY,
    MaxSalary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Department (DepartName, MaxSalary) VALUES ('Software Engineering', 120000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Data Science', 135000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Cybersecurity', 125000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('IT Support', 80000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Network Administration', 90000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Cloud Services', 130000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Database Administration', 110000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('AI and ML', 140000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('DevOps', 115000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Web Development', 105000.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('Networking team', 35010.00);
INSERT INTO Department (DepartName, MaxSalary) VALUES ('DataScience Team', 205000.00);

CREATE TABLE Employer (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dept VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (dept) REFERENCES Department(DepartName)
);


INSERT INTO Employer (name, dept, salary) VALUES ('Alice Johnson', 'Software Engineering', 95000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Bob Smith', 'Data Science', 120000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Catherine Lee', 'Cybersecurity', 110000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('David Brown', 'IT Support', 60000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Eva Green', 'Network Administration', 75000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Frank White', 'Cloud Services', 115000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Grace Kim', 'Database Administration', 98000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Henry Black', 'AI and ML', 130000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Ivy Wilson', 'DevOps', 105000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Jack Thompson', 'Web Development', 85000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Kathy Adams', 'Software Engineering', 102000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Leo Martin', 'Data Science', 125000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Mona Perez', 'Cybersecurity', 118000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Nathan Collins', 'IT Support', 65000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Olivia Garcia', 'Network Administration', 80000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Paul Rodriguez', 'Cloud Services', 112000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Quincy Rivera', 'Database Administration', 99000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Rachel King', 'AI and ML', 135000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Samuel Scott', 'DevOps', 107000.00);
INSERT INTO Employer (name, dept, salary) VALUES ('Tina Young', 'Web Development', 87000.00);


SELECT * FROM Employer;
SELECT * FROM Department;

select e.name, e.dept, d.MaxSalary
from employer e
join department d on e.dept = d.DepartName;

select avg(salary) as average from employer;

-- SCALAR SUBQUERY 
select * from employer
where salary < (select avg(salary) as average from employer);

select *  from employer e
join (select avg(salary) as average from employer) as avgsalary
on e.salary < avgsalary.average;

select * from employer
where (dept,salary) in (
select dept,max(salary) from employer
group by dept)
order by salary;

select dept,max(salary) as maxi from employer
group by dept
order by maxi;

select distinct dept from employer;
SELECT * FROM Department
where DepartName  in (select distinct dept from employer);

select dept,avg(salary)  from employer
group by dept;

select * from employer e1
where salary >
(select avg(salary) from employer e2
where e1.dept = e2.dept);

SELECT * FROM Department d
where d.DepartName  in (select distinct e.dept from employer e);

SELECT * FROM Department 
where departname not in (select dept from employer);

SELECT * FROM Department d
where not exists (select 1 from employer e where e.dept = d.departname);

select dept from employer
where salary <
(select avg(total) from
(select dept,sum(salary) as total from employer
group by dept) as s); 

select * from
(select dept,sum(salary) as total from employer
group by dept) as s1
join (select avg(total) as avgsales from
(select dept,sum(salary) as total from employer
group by dept) as s) as s2
on s1.total > s2.avgsales;

with s1 as 
(select dept,sum(salary) as total from employer
group by dept)
select * from
s1
join (select avg(total) as avgsales from
s1 as s) as s2
on s1.total > s2.avgsales;

select *,
(case when salary > (select avg(salary) from employer)
then "high salary"
else "Low salary"
end) as variant
from employer;

select *,
(case when salary > (e1.average)
then "high salary"
else "Low salary"
end) as variant
from employer
cross join (select avg(salary) as average from employer) as e1;


