BEGIN;
INSERT INTO tag3_2.kanton (name, kennzeichen)
VALUES ('Basel-Stadt', 'BS'),
    ('Basel-Landschaft', 'BL'),
    ('Zürich', 'ZH'),
    ('Bern', 'BE'),
    ('Luzern', 'LU'),
    ('Uri', 'UR'),
    ('Schwyz', 'SZ'),
    ('Obwalden', 'OW'),
    ('Nidwalden', 'NW'),
    ('Glarus', 'GL'),
    ('Zug', 'ZG'),
    ('Freiburg', 'FR'),
    ('Solothurn', 'SO'),
    ('Schaffhausen', 'SH'),
    ('Appenzell Ausserrhoden', 'AR'),
    ('Appenzell Innerrhoden', 'AI'),
    ('St. Gallen', 'SG'),
    ('Graubünden', 'GR'),
    ('Aargau', 'AG'),
    ('Thurgau', 'TG'),
    ('Tessin', 'TI'),
    ('Waadt', 'VD'),
    ('Wallis', 'VS'),
    ('Neuenburg', 'NE'),
    ('Genf', 'GE'),
    ('Jura', 'JU');
\ copy ort(name, plz, id_kanton)
FROM 'Vorbereitung/tag3_1/ImportPlaces.csv' DELIMITER '#' ENCODING 'UTF-8' CSV HEADER;
COMMIT;