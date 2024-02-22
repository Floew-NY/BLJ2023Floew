SELECT MAX(salary),
    MIN(salary),
    department_name
FROM hr.employee
    JOIN hr.department ON department_id = id_department
GROUP BY id_department
HAVING id_department IN(10, 20, 30, 60)
ORDER BY 3;