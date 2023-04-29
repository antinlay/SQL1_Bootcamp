CREATE VIEW v_price_with_discount AS
    SELECT DISTINCT name as name, pizza_name, price, CAST((price * 0.9) as INT) as discount_price
    FROM person_order
    LEFT JOIN person ON person_order.person_id = person.id
    LEFT JOIN menu ON person_order.menu_id = menu.id
    ORDER BY name, pizza_name;