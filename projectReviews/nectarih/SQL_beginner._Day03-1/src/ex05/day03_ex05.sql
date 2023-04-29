WITH
    visited_pizzeria AS (
    SELECT pizzeria.name AS pizzeria_name, p.name AS person_name
    FROM pizzeria
        INNER JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
        INNER JOIN person p ON pv.person_id = p.id
),
    ordered_pizzeria AS (
    SELECT pizzeria.name AS pizzeria_name, p.name AS person_name
    FROM pizzeria
        INNER JOIN menu m ON pizzeria.id = m.pizzeria_id
        INNER JOIN person_order po ON m.id = po.menu_id
        INNER JOIN person p ON po.person_id = p.id
)

SELECT pizzeria_name
FROM visited_pizzeria
WHERE person_name = 'Andrey'
EXCEPT
SELECT pizzeria_name
FROM ordered_pizzeria
WHERE person_name = 'Andrey'
ORDER BY pizzeria_name;