/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customer have payer for the film.
 * Use tables payment, rental, inventory, and film. 
 */

SELECT
    f.title,
    SUM(p.amount) as profit
FROM
    film f
INNER JOIN
    inventory i ON f.film_id = i.film_id
INNER JOIN
    rental r ON r.inventory_id = i.inventory_id
INNER JOIN
    payment p ON p.rental_id = r.rental_id
GROUP BY
    f.title
ORDER BY
    profit DESC;
