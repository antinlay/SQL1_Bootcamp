WITH not_ordered_menu_id AS (
    SELECT id AS menu_id
    FROM menu
    EXCEPT
    SELECT menu_id
    FROM person_order
)

SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM not_ordered_menu_id
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;