SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

SELECT * 
FROM customer;

-- Subquery
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM language
	WHERE name = 'English'
);

SELECT *
FROM city
WHERE country_id IN (
	SELECT country_id
	FROM country
	WHERE country LIKE 'A__%'
);

SELECT *
FROM country
WHERE country LIKE 'A__%';