set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person.name,
  menu.pizza_name,
  menu.price,
  (
    menu.price / 100 * (100 - person_discounts.discount)
  ) as discount_price
FROM person_discounts
  JOIN person ON person.id = fk_person_discounts_person_id
  JOIN menu ON menu.pizzeria_id = fk_person_discounts_pizzeria_id
ORDER BY 1,
  2 CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(
    fk_person_discounts_person_id,
    fk_person_discounts_pizzeria_id
  )