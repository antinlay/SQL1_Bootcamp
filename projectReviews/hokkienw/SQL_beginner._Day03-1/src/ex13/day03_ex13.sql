DELETE FROM person_order WHERE order_date = '2022-02-25';
DELETE FROM menu WHERE pizza_name = 'greek pizza';


-- (SELECT MAX(id) + 1 FROM person_order)
-- (SELECT id FROM menu WHERE pizza_name = 'greek pizza')