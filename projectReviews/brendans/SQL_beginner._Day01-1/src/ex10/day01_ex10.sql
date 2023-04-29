SELECT p.name AS person_name,
    m.pizza_name AS pizza_name,
    pz.name AS pizzeria_name
FROM person_order
    INNER JOIN person p on p.id = person_order.person_id
    INNER JOIN menu m on m.id = person_order.menu_id
    INNER JOIN pizzeria pz on pz.id = m.pizzeria_id
ORDER BY person_name ASC,
    pizza_name ASC,
    pizzeria_name ASC;