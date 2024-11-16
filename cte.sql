with avgsalary (avgsal) as
					(select avg(salary) from employer)
select * from employer e ,avgsalary av
where e.salary>av.avgsal;
