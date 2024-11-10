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

