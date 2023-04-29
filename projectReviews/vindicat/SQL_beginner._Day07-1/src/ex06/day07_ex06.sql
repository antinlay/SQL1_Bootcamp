SELECT pizzeria.name, SUM(order_count_menu.count) AS count_of_orders,
       ROUND(SUM(menu.price * count) / SUM(order_count_menu.count), 2) AS average_price,
       MAX(menu.price) AS max_price, MIN(menu.price) AS min_price
FROM (SELECT menu_id, COUNT(menu_id) AS count
      FROM person_order
      GROUP BY menu_id) AS order_count_menu
LEFT JOIN menu ON menu.id = order_count_menu.menu_id
LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY name ASC;
