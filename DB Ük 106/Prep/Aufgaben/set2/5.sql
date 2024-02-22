SELECT last_name,
    id_department
FROM hr.employee
WHERE id_department IN (20, 50)
ORDER BY last_name ASC;