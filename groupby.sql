 select salary, count(1) as "no.of.cand"
 from candidate
 group by salary;
 
 select salary, count(1) as "no.of.cand"
 from candidate
 group by salary
 having count(1)>1;
