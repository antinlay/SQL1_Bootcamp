SELECT info.name
FROM person_visits
JOIN person
	ON person_visits.person_id = person.id
JOIN menu
	ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN pizzeria AS info
	ON info.id = menu.pizzeria_id
WHERE visit_date = '2022-01-08'
		AND person.name = 'Dmitriy'
		AND menu.price < 800;