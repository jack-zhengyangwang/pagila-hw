/*
 * Rank actors by how many films they appear in (most films first). Ties share a rank.
 *
 * HINT:
 * Join actor with film_actor.
 * Then use a window function with an appropriate ORDER BY clause (no PARTITION BY).
 */
SELECT actor.actor_id, first_name, last_name,
    count(*) AS films,
    RANK() OVER (ORDER BY count(*) desc) AS rnk
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, first_name, last_name
ORDER BY rnk, actor.actor_id;
