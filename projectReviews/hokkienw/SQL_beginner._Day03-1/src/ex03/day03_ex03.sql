SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'female'
EXCEPT ALL
SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'male'
UNION
(SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'male'
EXCEPT ALL
SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.gender != 'female')
ORDER BY pizzeria_name