
WITH pizzeria_order AS (
SELECT person_order.person_id,person_order.menu_id,person_order.order_date,person.name,
person.gender,pizzeria.name AS pizzeria_name FROM person_order
LEFT JOIN person ON person_order.person_id = person.id
LEFT JOIN menu ON person_order.menu_id = menu.id
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)

(SELECT pizzeria_name
FROM pizzeria_order
EXCEPT
SELECT pizzeria_name FROM pizzeria_order
WHERE gender = 'male')
UNION DISTINCT
(SELECT pizzeria_name FROM pizzeria_order
EXCEPT
SELECT pizzeria_name FROM pizzeria_order
WHERE gender = 'female')

ORDER BY pizzeria_name;