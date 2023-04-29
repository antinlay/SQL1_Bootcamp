INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER () OVER (),
	person_order.person_id,
	menu.pizzeria_id,
	CASE
		WHEN count(person_order.person_id) = 1 THEN 10.5
		WHEN count(person_order.person_id) = 2 THEN 22
		ELSE 30
	END AS discount
FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
GROUP BY person_order.person_id,
	menu.pizzeria_id;
select count(*) > 0 as check
from person_discounts