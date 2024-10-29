-- BASIC QUERIES
use SYS;
create table customers(cust_id int primary key, cust_name varchar(25),Age int, Gender char(1), 
DOB date,Address varchar(25),item varchar(25),price float);

select cust_name from customers;

insert into customers values
(100,"Joel",26,"m","2024-10-20","kadayam","shirt",1000),
(101,"messi",45,"m","2024-09-30","argentina","football",400),
(102,"sachin",50,"m","2024-08-21","mumbai","bat",600),
(103,"vijay",49,"m","2024-10-09","chennai","gun",2000),
(104,"girl",24,"f","2023-10-09","chennai","shirt",600);

select * from customers;

drop table customers;

truncate table customers;

alter table customers
drop column age;
