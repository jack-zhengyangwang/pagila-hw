/*
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title in reverse alphabetical order.
 */
SELECT film.film_id, title, count(inventory_id)
FROM film
JOIN inventory ON inventory.film_id = film.film_id
WHERE title ILIKE 'h%'
GROUP BY film.film_id, title
ORDER BY title desc;
