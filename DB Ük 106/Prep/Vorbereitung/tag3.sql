BEGIN;

CREATE SCHEMA tag3;

SET search_path TO tag3;

CREATE TABLE ort(
    plz VARCHAR(4),
    ortsname VARCHAR(50)
    id_somethingelse 
);

INSERT INTO ort (ortsname,plz)
VALUES
('meile',8706),
('mänedorf',8708)
;


SELECT * FROM ort;

ALTER TABLE ort RENAME ortsname TO name;

SELECT * FROM ort;
SELECT plz FROM ort WHERE name = 'meile';

UPDATE ort SET plz = '8707' WHERE name = 'mänedorf';
ALTER TABLE ort ADD PRIMARY Key(plz);
Select * FROM ort;

ROLLBACK;