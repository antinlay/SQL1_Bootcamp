SELECT person.name,
  pizza_name,
  price,
  ROUND(price / 100 * (100 - discount)) AS discount_price,
  pizzeria.name
FROM person_order
  INNER JOIN person ON person_order.person_id = person.id
  INNER JOIN pizzeria ON person_discounts.pizzeria_id = pizzeria.id
  INNER JOIN person_discounts ON person_discounts.person_id = person_order.person_id
  AND pizzeria.id = person_discounts.pizzeria_id
  INNER JOIN menu ON person_order.menu_id = menu.id
ORDER BY person.name,
  pizza_name;
select p.name,
  m.pizza_name,
  m.price,
  (m.price - (m.price * pd.discount / 100)) as discount_price,
  p2.name as pizzeria_name
from person_order
  inner join menu m on m.id = person_order.menu_id
  inner join person p on p.id = person_order.person_id
  inner join person_discounts pd on p.id = pd.person_id
  and pd.pizzeria_id = m.pizzeria_id
  inner join pizzeria p2 on m.pizzeria_id = p2.id
order by 1,
  2