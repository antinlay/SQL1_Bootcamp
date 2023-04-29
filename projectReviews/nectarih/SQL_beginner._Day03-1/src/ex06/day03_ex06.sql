WITH pizzeria_manu AS (
    SELECT pizza_name,
           pizzeria.name AS pizzeria_name,
           price,
           pizzeria.id AS id
    FROM pizzeria
        INNER JOIN menu m ON pizzeria.id = m.pizzeria_id
)

SELECT pm1.pizza_name AS pizza_name,
       pm1.pizzeria_name AS pizzeria_name_1,
       pm2.pizzeria_name AS pizzeria_name_2,
       pm1.price AS price
FROM pizzeria_manu pm1
    JOIN pizzeria_manu pm2 ON pm1.pizza_name = pm2.pizza_name
WHERE pm1.price = pm2.price AND pm1.id > pm2.id
ORDER BY pizza_name;