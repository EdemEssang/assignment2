SELECT 
    film_id,
    title,
    description,
    release_year,
    length AS duration_in_minutes
FROM 
    film
ORDER BY 
    length DESC
LIMIT 5;