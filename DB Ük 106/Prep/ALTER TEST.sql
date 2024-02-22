BEGIN;
CREATE SCHEMA DDL01;
CREATE TABLE DDL01.debt(id INT, name varchar(25));
ALTER TABLE DDL01.debt
ADD COLUMN mumcount INT;
SELECT *
FROM DDL01.debt;
SELECT *
from Steam.category;
INSERT INTO DDL01.debt (mumcount, name)
SELECT s.category_id,
    s.name
FROM Steam.category s;
DELETE FROM DDL01.debt
WHERE name Like 'VR';
SELECT *
from DDL01.debt;
ALTER TABLE DDL01.debt
ADD COLUMN modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
SELECT *
FROM DDL01.debt;
ROLLBACK;