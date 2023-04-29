SELECT menu.pizza_name, menu.price
       ,pizzeria.name as pizzeria_name
     , person_visits.visit_date
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id AND (menu.price >= 800 AND menu.price <= 1000)
JOIN person_visits on pizzeria.id = person_visits.pizzeria_id
JOIN person on person_visits.person_id = person.id AND person.name ='Kate'
ORDER BY pizza_name, price, pizzeria_name