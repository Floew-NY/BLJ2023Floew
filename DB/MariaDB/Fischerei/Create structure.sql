CREATE TABLE IF NOT EXISTS patentart (
  patentart_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (patentart_id)
);
CREATE TABLE IF NOT EXISTS ort (
  PLZ VARCHAR(10) NOT NULL,
  ortsname VARCHAR(100) NOT NULL,
  PRIMARY KEY (PLZ, ortsname)
);
CREATE TABLE IF NOT EXISTS person (
  person_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nachname VARCHAR(100),
  vorname VARCHAR(100),
  adresse VARCHAR(100),
  PLZ VARCHAR(10),
  PRIMARY KEY (person_id),
  FOREIGN KEY (PLZ) REFERENCES ort(PLZ)
);
ALTER TABLE patentart CHANGE patentart_id patentart_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT;
CREATE TABLE IF NOT EXISTS fischereirevier (
  fischereirevier_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  beschreibung VARCHAR(511),
  PRIMARY KEY (fischereirevier_id)
);
ALTER TABLE fischereirevier
  ADD id_verwaltet_durch BIGINT UNSIGNED NOT NULL,
  ADD CONSTRAINT fk_id_verwaltet_durch_person FOREIGN KEY (id_verwaltet_durch) REFERENCES person(person_id);
CREATE TABLE IF NOT EXISTS patent (
  patent_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  erstelltAm DATE,
  unter16jahre CHAR(1) NOT NULL DEFAULT 'N',
  id_bezogen_durch BIGINT UNSIGNED NOT NULL,
  id_gilt_fuer BIGINT UNSIGNED NOT NULL,
  id_patentart BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY(patent_id),
  CONSTRAINT fk_ID_bezogen_durch_person FOREIGN KEY(id_bezogen_durch) REFERENCES person(person_id),
  CONSTRAINT fk_ID_gilt_fuer_revier FOREIGN KEY(id_gilt_fuer) REFERENCES fischereirevier(fischereirevier_id),
  CONSTRAINT fk_ID_patentart_patentart FOREIGN KEY(id_patentart) REFERENCES patentart(patentart_id)
);