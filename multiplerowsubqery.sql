
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
