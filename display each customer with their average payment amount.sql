SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.address,
    a.postal_code,
    ci.city,
    co.country,
    ROUND(AVG(p.amount), 2) AS average_payment_amount
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
JOIN 
    address a ON c.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    country co ON ci.country_id = co.country_id
GROUP BY 
    c.customer_id, customer_name, a.address, a.postal_code, ci.city, co.country
ORDER BY 
    average_payment_amount DESC;