SELECT country_id,
    COUNT(city)
FROM hr.location
WHERE
    JOIN hr.country ON country_id = id_country
WHERE
GROUP BY country_id
HAVING NOT COUNT(city) LIKE 'Geneva'
    AND country_id LIKE 'C%';