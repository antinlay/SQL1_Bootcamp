SELECT menu.pizza_name,
  pizzeria.name AS pizzeria_name
FROM person_order
  JOIN person ON person.id = person_order.person_id
  AND (
    person.name = 'Denis'
    OR person.name = 'Anna'
  )
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1,
  2;