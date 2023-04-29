WITH ppp AS (
    SELECT person_order.id,
        person_order.person_id,
        menu.pizzeria_id
    FROM person_order
        JOIN menu ON menu.pizza_name = 'pepperoni pizza'
),
pch AS (
    SELECT person_order.id,
        person_order.person_id,
        menu.pizzeria_id
    FROM person_order
        JOIN menu ON menu.pizza_name = 'cheese pizza'
),
fml AS (
    SELECT *
    FROM ppp
    INTERSECT
    SELECT *
    FROM pch
)
SELECT *
FROM fml
SELECT DISTINCT name
FROM person
    JOIN fml ON fml.person_id = person.id
WHERE gender = 'female'
    AND person.id = fml.person_id
ORDER BY name