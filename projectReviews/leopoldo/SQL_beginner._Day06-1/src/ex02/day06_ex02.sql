SELECT person.name AS person_name, 
       pizza_name, 
	   price, 
	   (price - (price*discount/100))::REAL AS discount_price, 
	   pizzeria.name AS pizzeria_name
FROM person 
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts ON person_discounts.person_id = person.id AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY 1 ASC, 2 ASC;  