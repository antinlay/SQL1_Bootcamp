SELECT info.pizza_name, pizzeria.name
FROM person_order
         JOIN menu AS info ON info.id = person_order.menu_id
         JOIN pizzeria ON info.pizzeria_id = pizzeria.id
         JOIN person ON person_order.person_id = person.id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY info.pizza_name, pizzeria.name;

