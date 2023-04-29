CREATE VIEW v_price_with_discount AS
SELECT person.name,
  pizza_name,
  price,
  ROUND((price - price * 0.1), 0) AS discount_price
FROM person_order
  JOIN person ON person.id = person_order.person_id
  JOIN menu ON menu.id = person_order.menu_id
ORDER BY 1,
  2;
select *
from v_price_with_discount