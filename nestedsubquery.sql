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




