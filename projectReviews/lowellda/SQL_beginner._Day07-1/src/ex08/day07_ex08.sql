SELECT person.address,
       pizzeria.name,
       COUNT(person.address) as count_of_orders
FROM person_order
INNER JOIN person on person_order.person_id = person.id
INNER JOIN menu on person_order.menu_id = menu.id
INNER JOIN pizzeria on menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY address, pizzeria.name;