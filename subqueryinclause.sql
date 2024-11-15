
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

select dept, sum(salary) from employer
group by dept
having sum(salary) < (select sum(salary) from employer);


INSERT INTO employerhistory (emp_id, dept, maxsalary)
SELECT e.emp_id, e.dept, d.maxsalary
FROM employer e
JOIN Department d ON d.departname = e.dept
WHERE not exists (
    SELECT 1
    FROM employerhistory eh
    WHERE eh.emp_id = e.emp_id
);


update employer e1
set salary = (select max(maxsalary) + max(maxsalary) * 0.1
				from employerhistory e2 where e2.dept = e1.dept )
where emp_id in (select emp_id from employerhistory
				where dept like "data%" order by emp_id)
and 
salary < (select avg(maxsalary) from department)




