BEGIN;
CREATE SCHEMA DDL02;
CREATE TABLE DDL02.employee AS
SELECT *
FROM hr.employee;
ALTER TABLE DDL02.employee
ADD COLUMN WorkEmail VARCHAR(255);
UPDATE DDL02.employee
SET WorkEmail = CONCAT(employee_id, '@example.com');
UPDATE DDL02.employee
SET salary = 100
WHERE salary < 10000;
SELECT *
from DDL02.employee;
ROLLBACK;