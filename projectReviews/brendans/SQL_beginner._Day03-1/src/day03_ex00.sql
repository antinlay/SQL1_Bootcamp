SELECT pizza_name, price, pizzeria.name AS pizza_name, visit_date
FROM person
JOIN person_visits AS po ON person.id = po.person_id
JOIN pizzeria ON pizzeria.id = po.pizzeria_id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND menu.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3 ASC


