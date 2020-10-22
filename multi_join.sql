SELECT *
FROM film;

SELECT *
FROM actor;

SELECT *
FROM film_actor;


SELECT f.title, f.release_year, a_.actor_id, a_.first_name, a_.last_name
FROM film as f
JOIN film_actor as fa
ON f.film_id = fa.film_id
JOIN actor as a_
ON a_.actor_id = fa.actor_id
WHERE a_.last_name = 'Cage' and f.release_year = '2006'
ORDER BY f.title;