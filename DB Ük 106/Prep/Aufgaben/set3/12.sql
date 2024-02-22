SELECT last_name,
    LPAD('*', CAST(TRUNC(salary / 1000) AS INT), '*') as salaryInStars
FROM hr.employee
ORDER BY salary DESC;