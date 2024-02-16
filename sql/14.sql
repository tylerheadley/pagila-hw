/*
 * Use a JOIN to list all films in the "Family" category.
 * Use table category, film_category, and film.
 */

SELECT
    f.title
FROM
    film f
INNER JOIN
    film_category fc ON f.film_id = fc.film_id
INNER JOIN
    category c ON c.category_id = fc.category_id
WHERE
    c.name='Family';
