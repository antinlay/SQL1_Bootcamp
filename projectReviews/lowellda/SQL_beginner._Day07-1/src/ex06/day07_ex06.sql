SELECT pizzeria.name,
       COUNT(pizzeria_id) as count_of_orders,
       ROUND(AVG(price), 2) as average_price,
       MAX(price) as max_price,
       MIN(price) as min_price
FROM person_order
INNER JOIN menu on menu.id = person_order.menu_id
INNER JOIN pizzeria on pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY name;