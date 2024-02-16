/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */

SELECT
    c.name,
    COUNT(c.category_id) as "sum"
FROM
    category c
INNER JOIN
    film_category fc ON c.category_id = fc.category_id
INNER JOIN
    film f ON f.film_id = fc.film_id
INNER JOIN
    language l ON l.language_id = f.language_id
WHERE
    l.name = 'English'
GROUP BY
   c.category_id;
