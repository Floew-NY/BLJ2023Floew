SELECT e.last_name,
    e.salary,
    x.depsal
FROM hr.employee e
    INNER JOIN (
        SELECT AVG(salary) as "depsal",
            id_department
        FROM hr.employee
        GROUP BY id_department
    ) x ON x.id_department = e.id_department;