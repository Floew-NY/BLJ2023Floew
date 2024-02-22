BEGIN;
CREATE TABLE ort(
    plz VARCHAR(4),
    name VARCHAR(50),
    PRIMARY KEY(plz)
);
CREATE TABLE person(
    person_id SERIAL,
    name VARCHAR(20),
    PRIMARY KEY(person_id)
);
ALTER TABLE person
ADD COLUMN id_ort VARCHAR(4);
ALTER TABLE person
ADD CONSTRAINT "fk_id_ort_ort" FOREIGN KEY(id_ort) REFERENCES ort(plz);
COMMIT;