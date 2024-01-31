SELECT COUNT(employee_id) as employee_count,
    COALESCE(department_name, 'Extern')
FROM hr.employee
    FULL OUTER JOIN hr.department ON department_id = id_department
GROUP BY department_name
HAVING MAX(employee_id) > 2
ORDER BY employee_count DESC;
/* SELECT COUNT(employee_id),
 id_department
 FROM hr.employee
 GROUP BY id_department
 HAVING COUNT(employee_id) > 10; */
SELECT MAX(salary) as employee_count,
    COALESCE(department_name, 'Extern')
FROM hr.employee
    FULL OUTER JOIN hr.department ON department_id = id_department
GROUP BY department_name
HAVING MAX(salary) > 12000
ORDER BY employee_count DESC;