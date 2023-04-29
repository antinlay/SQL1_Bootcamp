WITH visited_pizzeria AS (
    SELECT pizzeria.name AS pizzeria_name,
        gender
    FROM pizzeria
        INNER JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
        INNER JOIN person p ON pv.person_id = p.id
) (
    SELECT pizzeria_name
    FROM visited_pizzeria
    WHERE gender = 'female'
    EXCEPT ALL
    SELECT pizzeria_name
    FROM visited_pizzeria
    WHERE gender = 'male'
)
UNION ALL
(
    SELECT pizzeria_name
    FROM visited_pizzeria
    WHERE gender = 'male'
    EXCEPT ALL
    SELECT pizzeria_name
    FROM visited_pizzeria
    WHERE gender = 'female'
)
ORDER BY pizzeria_name;