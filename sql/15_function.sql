/*
 * Use a JOIN to count the number films in each category in the specified language.
 * Use table category, film_category, film, and language.
 */
CREATE OR REPLACE FUNCTION category_counts_by_language(TEXT) RETURNS TABLE(name TEXT, count BIGINT) AS
$$
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
    l.name = $1
GROUP BY
   c.category_id;
$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT * FROM category_counts_by_language('English');
SELECT * FROM category_counts_by_language('Italian');
SELECT * FROM category_counts_by_language('Japanese');
SELECT * FROM category_counts_by_language('Mandarin');
SELECT * FROM category_counts_by_language('French');
SELECT * FROM category_counts_by_language('German');
SELECT * FROM category_counts_by_language('Latin');
