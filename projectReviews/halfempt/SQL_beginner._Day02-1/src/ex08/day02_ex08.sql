SELECT name
FROM person
INNER JOIN person_order AS O
    ON person.id = O.person_id
INNER JOIN menu AS M
    ON O.menu_id = M.id
WHERE person.gender = 'male'
    AND (person.address = 'Moscow' OR person.address = 'Samara')
    AND (M.pizza_name = 'pepperoni pizza' OR M.pizza_name = 'mushroom pizza')
ORDER BY person.name DESC;