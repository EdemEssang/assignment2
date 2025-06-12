SELECT 
    s.store_id,
    CONCAT(a.address, ', ', ci.city, ', ', co.country) AS store_address,
    CONCAT(st.first_name, ' ', st.last_name) AS manager_name,
    COUNT(DISTINCT p.customer_id) AS unique_customers,
    COUNT(p.payment_id) AS total_transactions,
    SUM(p.amount) AS total_revenue
FROM 
    payment p
    JOIN staff st ON p.staff_id = st.staff_id
    JOIN store s ON st.store_id = s.store_id
    JOIN address a ON s.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id
GROUP BY 
    s.store_id, store_address, manager_name
ORDER BY 
    total_revenue DESC;