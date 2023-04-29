WITH id_order AS (
    SELECT person_id,
        menu_id,
        pizzeria.id AS pizzeria_id
    FROM person_order
        JOIN menu ON menu.id = menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
)
SELECT person.name,
    menu.pizza_name,
    price,
    round((100 - discount) / 100 * price, 2)::real,
    pizzeria.name AS pizzeria_name
FROM id_order
    JOIN person ON person.id = person_id
    JOIN menu ON menu.id = menu_id
    JOIN pizzeria ON id_order.pizzeria_id = pizzeria.id
    JOIN person_discounts ON person_discounts.person_id = id_order.person_id
    AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY 1,
    2