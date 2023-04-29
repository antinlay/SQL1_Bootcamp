WITH p_order AS (
	SELECT pizzeria_id
	FROM person_visits
	JOIN person ON person_visits.person_id = person.id AND person.name = 'Andrey'
),
order_menu AS (
	SELECT pizzeria_id
	FROM menu
	JOIN person_order ON person_order.menu_id = menu.id
	JOIN person ON person_order.person_id = person.id AND person.name = 'Andrey'
),
not_order AS (
	SELECT pizzeria_id
	FROM p_order
	EXCEPT
	SELECT pizzeria_id
	FROM order_menu
)
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria, not_order
WHERE pizzeria.id = not_order.pizzeria_id


