SELECT AVG(salary),
    department_name
FROM hr.employee
    JOIN hr.department ON department_id = id_department
GROUP BY department_name;