WITH pizzeria_female AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits AS pv ON pv.pizzeria_id = pizzeria.id
	JOIN person ON person.id = pv.person_id AND gender = 'female'
	ORDER BY 1
),
pizzeria_male AS (
	SELECT pizzeria.name AS pizzeria_name
	FROM pizzeria
	JOIN person_visits AS pv ON pv.pizzeria_id = pizzeria.id
	JOIN person ON person.id = pv.person_id AND gender = 'male'
	ORDER BY 1
)
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN pizzeria_female AS pf ON pizzeria.name = pf.pizzeria_name
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
UNION ALL
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN pizzeria_male AS pm ON pizzeria.name = pm.pizzeria_name
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
