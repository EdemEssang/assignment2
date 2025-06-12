SELECT 
    city.city,
    country.country,
    COUNT(customer.customer_id) AS customer_count
FROM 
    customer
JOIN 
    address ON customer.address_id = address.address_id
JOIN 
    city ON address.city_id = city.city_id
JOIN 
    country ON city.country_id = country.country_id
GROUP BY 
    city.city_id
ORDER BY 
    customer_count desc
LIMIT 5;
