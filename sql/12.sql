/*
 * Use a JOIN to list the total paid by each customer.
 * List the customers alphabetically by last name.
 * Use tables payment and customer.
 */

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(amount)
FROM
    customer AS c
INNER JOIN
    payment p ON p.customer_id = c.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
ORDER BY
    c.last_name;
    
