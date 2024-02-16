/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */

SELECT
    s.first_name,
    s.last_name,
    SUM(p.amount) AS sum
FROM
    staff s
INNER JOIN
    payment p ON s.staff_id = p.staff_id
WHERE
    EXTRACT(YEAR FROM p.payment_date) = 2020
    AND EXTRACT(MONTH FROM p.payment_date) = 1
GROUP BY
    s.staff_id, s.first_name, s.last_name
ORDER BY
    sum;

