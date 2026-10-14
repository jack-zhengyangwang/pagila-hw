/*
 * For each payment, show the customer's total amount paid overall.
 *
 * HINT:
 * Use a window function with a PARTITION BY (but no ORDER BY).
 */
SELECT customer.customer_id, first_name, last_name, payment_id, amount,
    sum(amount) OVER (PARTITION BY customer.customer_id) AS customer_total
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
ORDER BY customer.customer_id, payment_id;
