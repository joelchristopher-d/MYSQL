with avgsalary (avgsal) as
					(select avg(salary) from employer)
select * from employer e ,avgsalary av
where e.salary>av.avgsal;


 
 with TotalSales (dept,total_expense_per_dept) as 
		(select e.dept,sum(salary) as total_expense_per_dept
		 from employer e
		 group by dept),
	avgsales(avgexpense) as (select cast(avg(total_expense_per_dept) as float) as avgexpense from TotalSales)
	select * from TotalSales ts 
    join avgsales av
    on av.avgexpense > ts.total_expense_per_dept;
