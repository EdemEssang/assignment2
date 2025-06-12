SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM 
    customer c
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM payment p
        WHERE p.customer_id = c.customer_id
    )
ORDER BY 
    c.last_name, c.first_name;