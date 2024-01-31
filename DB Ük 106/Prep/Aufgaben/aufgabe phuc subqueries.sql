SELECT e.first_name as "Employee",
    (
        SELECT m.last_name
        WHERE m.salary > 8000
            AND e.id_manager = m.employee_id
    ) as manager,
    m.first_name
FROM hr.employee e
    JOIN hr.employee m ON m.employee_id = e.id_manager;