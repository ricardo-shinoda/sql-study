SELECT 'Total Actors: ' || COUNT(*) FROM actor
UNION ALL
SELECT 'Total Films: ' || COUNT(*) FROM film
UNION ALL
SELECT 'Total Customers: ' || COUNT(*) FROM customer;

select * from film_category;

select * from payment;