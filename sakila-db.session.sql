SELECT 
    (SELECT COUNT(*) FROM film) AS total_filmes,
    (SELECT COUNT(*) FROM actor) AS total_atores,
    (SELECT COUNT(*) FROM payment) AS total_pagamentos;

    select * from staff;