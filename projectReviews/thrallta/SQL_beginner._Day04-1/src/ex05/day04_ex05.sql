CREATE VIEW v_price_with_discount AS
SELECT person.name,
  m.pizza_name,
  m.price,
  m.price - 0.1 * m.price AS discount_price
FROM person
  JOIN person_order po ON person.id = po.person_id
  JOIN menu m ON po.menu_id = m.id
ORDER BY person.name,
  m.pizza_name;
select *
from v_price_with_discount