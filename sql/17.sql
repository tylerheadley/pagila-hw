/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT
    c.country,
    SUM(p.amount) as profit
FROM
    country c
INNER JOIN
    city ci ON ci.country_id = c.country_id
INNER JOIN
    address a ON a.city_id = ci.city_id
INNER JOIN
    customer cu ON cu.address_id = a.address_id
INNER JOIN
    rental r ON r.customer_id = cu.customer_id
INNER JOIN
    payment p ON p.rental_id = r.rental_id
GROUP BY
    c.country
ORDER BY
    c.country;
