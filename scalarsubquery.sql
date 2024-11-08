-- SCALAR SUBQUERY 
select * from employer
where salary < (select avg(salary) as average from employer);

select *  from employer e
join (select avg(salary) as average from employer) as avgsalary
on e.salary < avgsalary.average;
