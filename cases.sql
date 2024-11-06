SELECT name, salary,
    CASE
        WHEN salary > 410000 THEN 'high'
        WHEN salary < 410000 THEN 'low'
        ELSE 'medium'
    END AS `range`
FROM candidate
order by salary desc;

SELECT name, salary,
    IF(salary > 410000, 'high', 'low') AS `range`
FROM candidate;
