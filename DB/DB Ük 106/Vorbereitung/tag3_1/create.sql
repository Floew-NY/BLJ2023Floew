BEGIN;
CREATE TABLE tag3_2.kanton(
    kanton_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    kennzeichen CHAR(2) NOT NULL
);
ALTER TABLE ort
ADD COLUMN id_kanton INTEGER;
ALTER TABLE ort
ADD CONSTRAINT "fk_id_kanton_kanton" FOREIGN KEY(id_kanton) REFERENCES kanton(kanton_id) ON UPDATE CASCASDE ON DELETE CASCADE;
COMMIT;