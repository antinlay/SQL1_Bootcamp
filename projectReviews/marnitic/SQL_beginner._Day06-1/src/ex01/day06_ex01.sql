INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER () AS id,
  person_id,
  pizzeria_id,
  CASE
    WHEN COUNT(*) = 1 THEN 10.5
    WHEN COUNT(*) = 2 THEN 22
    ELSE 30
  END AS discount
FROM person_order
  INNER JOIN menu ON menu.id = person_order.menu_id
  INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person_id,
  pizzeria_id;
SELECT *
FROM person_discounts