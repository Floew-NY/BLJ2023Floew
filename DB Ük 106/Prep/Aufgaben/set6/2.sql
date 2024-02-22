SELECT last_name,
    employee_id
FROM hr.employee
WHERE salary > (
        SELECT AVG(salary)
        FROM hr.employee
    );
SELECT first_name
FROM hr.employee
WHERE first_name = STR;
GRANT SELECT ON ALL TABLES IN SCHEMA hr TO username;