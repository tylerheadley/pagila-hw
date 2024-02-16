/*
 * Use a JOIN to list each film and the number of actors who are listed for that film.
 * Use tables film and film_actor.
 */

SELECT
    f.title,
    f.film_id,
    COUNT(fa.actor_id) AS actor_count
FROM 
    film f
INNER JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY
    f.film_id, f.title
ORDER BY
    actor_count, f.title;
