SET search_path TO hr;
SELECT e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM employee e
    JOIN department d ON e.id_department = d.department_id
    JOIN job j ON e.id_job = job_id;