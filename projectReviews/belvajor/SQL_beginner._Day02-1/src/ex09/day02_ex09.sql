WITH woman AS (
  SELECT person.name,
    pizza_name
  FROM person_order
    JOIN person ON person.id = person_order.person_id
    JOIN menu ON menu.id = person_order.menu_id
  WHERE gender = 'female'
)
SELECT name
FROM woman
WHERE pizza_name = 'cheese pizza'
INTERSECT
SELECT name
FROM woman
WHERE pizza_name = 'pepperoni pizza'
ORDER BY name;