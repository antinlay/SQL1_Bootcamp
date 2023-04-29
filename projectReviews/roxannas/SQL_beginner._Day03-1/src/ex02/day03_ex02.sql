WITH no_order AS (
    SELECT menu.id AS menu_id FROM menu
    EXCEPT
    SELECT person_order.menu_id FROM person_order
    ORDER BY menu_id
)

SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM no_order
LEFT JOIN menu ON no_order.menu_id = menu.id
LEFT JOIN pizzeria on menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;