SELECT first_name,
    salary,
    (salary * 1.15) as new_salary,
    (salary * 1.15 - salary) as increase
FROm hr.employee;