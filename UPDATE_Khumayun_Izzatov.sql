
UPDATE film
SET rental_duration = 21, rental_rate = 9.99
WHERE film_id = 100;

UPDATE customer
SET first_name = 'YourFirstName', last_name = 'YourLastName', email = 'your@email.com', address_id = 1, create_date = CURRENT_DATE
WHERE customer_id = (
    SELECT customer_id
    FROM (
        SELECT customer_id
        FROM rental
        GROUP BY customer_id
        HAVING COUNT(rental_id) >= 10
    ) AS t
    LIMIT 1
);
