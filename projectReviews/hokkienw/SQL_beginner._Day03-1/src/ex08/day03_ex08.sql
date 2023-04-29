insert into menu values ((SELECT MAX(id) + 1 FROM menu),(SELECT id FROM pizzeria WHERE name = 'Dominos'),'sicilian pizza', 900);
-- SELECT id FROM pizzeria WHERE name = 'Dominos'
-- SELECT MAX(id) + 1 FROM menu