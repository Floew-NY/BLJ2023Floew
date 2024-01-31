BEGIN;
INSERT INTO ort (plz,name) VALUES 
('8307','dorf1'),
('8308','dorf2'),
('8048','dorf3'),
('8320','dorf4');

COPY person(name,id_ort) FROM '/tmp/ImportPerson.csv' DELIMITER ';' ENCODING 'UTF-8' CSV HEADER;

SELECT * FROM person;
ROLLBACK;