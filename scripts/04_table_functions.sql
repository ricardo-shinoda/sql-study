select * from payment;

-- Table functions to return the highest payment

-- @block criar função get_highest_payment
CREATE OR REPLACE FUNCTION get_highest_payment()
RETURNS TABLE (
    customer_id INT,
    rental_id INT,
    amount NUMERIC
)
LANGUAGE plpgsql AS
$$
BEGIN
    RETURN QUERY
    SELECT p.customer_id, p.rental_id, p.amount
    FROM payment p
    ORDER BY p.amount DESC
    LIMIT 20;
END;
$$;

select
    customer_id,
    amount,
    amount + (amount * 0.1) AS total_amount_10_percent
from get_highest_payment();

select * from inventory;
select * from rental where return_date is null;

CREATE OR REPLACE FUNCTION get_film_inventory_status(p_film_id INT)
RETURNS TABLE (
    inventory_id INT,
    film_id INT,
    last_update TIMESTAMP
)
LANGUAGE plpgsql AS
$$
BEGIN
    RETURN QUERY
    SELECT i.inventory_id, i.film_id, i.last_update
    FROM inventory i
    WHERE i.film_id = p_film_id;
END;
$$;

select
    inventory_id,
    film_id,
    last_update
from get_film_inventory_status(1);