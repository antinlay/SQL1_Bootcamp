WITH andrey_visit AS (
    SELECT pz.name As pizzeria_name
    FROM pizzeria AS pz
        JOIN person_visits AS pv on pv.pizzeria_id = pz.id
        JOIN person AS p ON (
            p.id = pv.person_id
            AND p.name = 'Andrey'
        )
),
andrey_order AS (
    SELECT pz.name As pizzeria_name
    FROM pizzeria AS pz
        JOIN menu as m on m.pizzeria_id = pz.id
        JOIN person_order AS po on po.menu_id = m.id
        JOIN person AS p ON (
            p.id = po.person_id
            AND p.name = 'Andrey'
        )
)
SELECT *
FROM andrey_visit
EXCEPT
SELECT *
FROM andrey_order
ORDER BY 1;