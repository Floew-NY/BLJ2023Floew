SELECT e.first_name as "Employee",
    CONCAT(m.first_name, ' ', m.last_name) as "Manager",
    m.salary as manager_salary,
    (
        SELECT grade_level
        FROM hr.job_grade
        WHERE highest_sal > m.salary
            AND lowest_sal < m.salary
    ) as grade
FROM hr.employee e
    JOIN hr.employee m ON m.employee_id = e.id_manager
WHERE m.salary > 15000;