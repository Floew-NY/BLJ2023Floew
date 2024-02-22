BEGIN;
/* HR */
SET search_path TO hr;
/* ? */
SELECT employee_id,
    last_name,
    (salary * 12) AS anual_salery
FROM employee;
/* ? */
SELECT employee_id,
    last_name,
    id_job,
    hire_date as STARTDATE
FROM employee;
SELECT DISTINCT employee_id
FROM employee;
/* A7 */
/* Emp #, Employee, Job und Hire Date. */
SELECT employee_id as "Emp #",
    last_name as "Employee",
    id_job as "Job",
    hire_date as "Hire Date"
FROM employee;
/* A8 */
SELECT CONCAT(last_name, ', ', id_job)
FROM employee;
/* A9 */
/* SELECT CONCAT_WS(', ',)
 FROM employee; */
/* EXTRA */
SELECT CONCAT(first_name, '.', last_name, '@batti.no')
FROM employee;
/* EXTRA 2 */
SELECT first_name,
    last_name
From employee
WHERE first_name LIKE 'E%'
    or last_name LIKE 'E%'
ORDER BY 1;
/* INPUT UNION */
(
    SELECT first_name,
        last_name
    From employee
    WHERE first_name ILIKE 'E%'
    LIMIT 3
)
UNION ALL
(
    SELECT first_name,
        last_name
    From employee
    WHERE last_name ILIKE 'E%'
    LIMIT 2
)
ORDER BY 1;
/* EXTRA 3 */
(
    SELECT first_name,
        last_name
    FROM employee
    WHERE salary > 10000
    ORDER BY salary DESC
    LIMIT 2
)
UNION
(
    SELECT first_name,
        last_name
    FROM employee
    ORDER BY hire_date
    LIMIT 5
);
ROLLBACK;