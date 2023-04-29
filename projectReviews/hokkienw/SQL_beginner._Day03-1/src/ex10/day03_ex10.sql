insert into person_order values ((SELECT MAX(id) + 1 FROM person_order),
                                 (SELECT id FROM person WHERE name = 'Denis'),
                                 (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
                                 '2022-02-24');
insert into person_order values ((SELECT MAX(id) + 1 FROM person_order),
                                 (SELECT id FROM person WHERE name = 'Irina'),
                                 (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
                                 '2022-02-24');

-- (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza')
-- (SELECT id FROM person WHERE name = 'Denis')
-- (SELECT id FROM person WHERE name = 'Irina')
-- (SELECT MAX(id) + 1 FROM person_visits)
-- (SELECT id FROM pizzeria WHERE name = 'Dominos')