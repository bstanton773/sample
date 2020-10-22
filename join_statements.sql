-- Customer Table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(10),
	zipcode VARCHAR(10)
);

SELECT *
FROM customer;

-- Order Table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Adding presidents to our customer table
INSERT INTO customer(first_name, last_name, email, address, city, customer_state, zipcode)
VALUES ('George', 'Washington', 'gwash@usa.gov', '3200 Mt Vernon Hwy', 'Mt. Vernon', 'VA', '22122'),
('John', 'Adams', 'jadams@usa.gov', '1200 Hancock Rd', 'Quincy', 'MA', '02168'),
('Thomas', 'Jefferson', 'tjeff@usa.gov', '931 Thomas Jefferson Pkwy', 'Charlottesville', 'VA', '22168'),
('James', 'Madison', 'jamd@usa.gov', '11350 Independence Blvd', 'Philadelphia', 'PA', '12345'),
('James', 'Monroe', 'jmonroe@usa.gov', '224 America Rd', 'Washington', 'DC', '00001')

-- Insert info INTO order table
INSERT INTO order_(amount, customer_id)
VALUES(234.56, 1),
(75.75, 3),
(123.00, 2),
(67.23, 3),
(50.00, NULL)

-- Orders from subquery
SELECT *
FROM order_
WHERE customer_id IN (
	SELECT customer_id
	FROM customer
	WHERE customer_state = 'VA'
);

-- All 4 Joins for SQL
-- INNER JOIN
SELECT first_name, last_name, order_date, amount, order_.customer_id, customer.customer_id
FROM customer -- TABLE 1
JOIN order_ -- TABLE 2
ON customer.customer_id = order_.customer_id;

-- LEFT JOIN
SELECT first_name, last_name, order_date, amount, order_.customer_id, customer.customer_id
FROM customer -- TABLE 1
LEFT JOIN order_ -- TABLE 2
ON customer.customer_id = order_.customer_id;

-- RIGHT JOIN
SELECT first_name, last_name, order_date, amount, order_.customer_id, customer.customer_id
FROM customer -- TABLE 1
RIGHT JOIN order_ -- TABLE 2
ON customer.customer_id = order_.customer_id;

-- FULL JOIN
SELECT first_name, last_name, order_date, amount, order_.customer_id, customer.customer_id
FROM customer -- TABLE 1
FULL JOIN order_ -- TABLE 2
ON customer.customer_id = order_.customer_id;

SELECT *
FROM customer
