SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'male'
LEFT JOIN person_order on person_visits.person_id = person_order.person_id
EXCEPT ALL
SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'female'
LEFT JOIN person_order on person_visits.person_id = person_order.person_id
UNION
(SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'male'
LEFT JOIN person_order on person.id = person_order.person_id
EXCEPT ALL
SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'female'
LEFT JOIN person_order on person.id = person_order.person_id)
ORDER BY pizzeria_name