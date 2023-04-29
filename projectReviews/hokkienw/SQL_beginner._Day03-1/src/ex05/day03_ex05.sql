SELECT pizzeria.name FROM person_visits
LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person_visits.person_id = (SELECT person.id FROM person WHERE person.name = 'Andrey')
EXCEPT ALL
SELECT pizzeria.name FROM person_visits
JOIN person_order ON person_visits.person_id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person_visits.person_id = (SELECT person.id FROM person WHERE person.name = 'Andrey')