SELECT a.pizza_name as pizza_name, x.name as pizzeria_name_1, y.name as pizzeria_name_2, a.price  FROM menu as a
JOIN pizzeria as x ON a.pizzeria_id = x.id
JOIN menu as b ON a.pizza_name = b.pizza_name
JOIN pizzeria as y ON b.pizzeria_id = y.id
WHERE a.price = b.price AND a.pizzeria_id > b.pizzeria_id
ORDER BY pizza_name
