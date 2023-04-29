WITH ordered_pizzeria AS (
    SELECT pizzeria.name AS pizzeria_name, gender
    FROM pizzeria
        INNER JOIN menu m ON pizzeria.id = m.pizzeria_id
        INNER JOIN person_order po ON m.id = po.menu_id
        INNER JOIN person p ON po.person_id = p.id
)

(SELECT pizzeria_name
FROM ordered_pizzeria
WHERE gender = 'female'
EXCEPT
SELECT pizzeria_name
FROM ordered_pizzeria
WHERE gender = 'male')
UNION
(SELECT pizzeria_name
FROM ordered_pizzeria
WHERE gender = 'male'
EXCEPT
SELECT pizzeria_name
FROM ordered_pizzeria
WHERE gender = 'female')
ORDER BY pizzeria_name;