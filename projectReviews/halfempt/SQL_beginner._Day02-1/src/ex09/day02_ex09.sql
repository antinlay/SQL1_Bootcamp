SELECT p.name
FROM person AS p
INNER JOIN person_order AS O
    ON p.id = O.person_id
LEFT JOIN person_order AS P2
    ON O.person_id = P2.person_id
INNER JOIN menu AS M
    ON O.menu_id = M.id
INNER JOIN menu AS M2
    ON P2.menu_id = M2.id
WHERE p.gender = 'female'
    AND M.pizza_name = 'cheese pizza'
    AND M2.pizza_name = 'pepperoni pizza'
ORDER BY p.name;
