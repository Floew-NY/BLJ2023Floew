BEGIN;
SET search_path TO steam;
INSERT INTO category (name)
VALUES ('fred'),
    ('rob'),
    ('Jack');
SELECT *
FROM category;
ROLLBACK;