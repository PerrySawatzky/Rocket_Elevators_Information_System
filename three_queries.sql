SELECT to_char(creation, 'Month') as Month, Count(*) as unique_requests_per_month 
FROM factcontact 
GROUP BY month

SELECT to_char(creation, 'Month') as month, Count(*) as unique_quotes_per_month 
FROM factquotes 
GROUP BY month

SELECT COUNT(serial_number) as "Elevators", customer_id as "Customer ID"
FROM factelevator
GROUP BY customer_id
ORDER BY COUNT(customer_id) DESC;