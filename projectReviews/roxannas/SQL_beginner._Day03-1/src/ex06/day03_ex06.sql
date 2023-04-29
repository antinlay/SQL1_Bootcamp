SELECT DISTINCT m2.pizza_name, p1.name AS pizzeria_name_1,  p2.name AS pizzeria_name_2, m2.price
FROM menu m2
JOIN menu m1 ON m2.pizza_name = m1.pizza_name AND m2.price = m1.price AND m2.pizzeria_id < m1.pizzeria_id
JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
ORDER BY m2.pizza_name