INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT MAX(person_order.id) FROM person_order) + id, person.id,
       (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza'),
       '2022-02-25'
FROM person


-- (SELECT MAX(id) + 1 FROM person_order)
-- (SELECT id FROM menu WHERE pizza_name = 'greek pizza')