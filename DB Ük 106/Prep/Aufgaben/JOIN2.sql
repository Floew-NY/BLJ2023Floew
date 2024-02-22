SELECT location.city,
    country.country_name
FROM hr.location location
    JOIN hr.country country ON id_country = country_id
LIMIT 40;