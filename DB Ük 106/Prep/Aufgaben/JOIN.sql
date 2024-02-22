SELECT employee.first_name,
    job.job_title
FROM hr.employee employee
    JOIN hr.job job ON id_job = job_id
LIMIT 10;