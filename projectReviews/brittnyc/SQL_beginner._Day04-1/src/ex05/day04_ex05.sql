CREATE VIEW v_price_with_discount AS
SELECT person.name, menu.pizza_name, menu.price, CAST(menu.price * 0.9 AS int) AS discount_price
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
ORDER BY 1, 2;

