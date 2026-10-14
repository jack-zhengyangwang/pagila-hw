/*
 * For each film, show the customer who most recently rented it.
 *
 * HINT:
 * Use the first_value function.
 * The window will include both PARTITION BY and ORDER BY
 */
SELECT DISTINCT title,
    first_value(customer.customer_id) OVER w AS customer_id,
    first_value(first_name || ' ' || last_name) OVER w AS customer_name
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id
WINDOW w AS (PARTITION BY film.film_id ORDER BY rental_date DESC)
ORDER BY title;
