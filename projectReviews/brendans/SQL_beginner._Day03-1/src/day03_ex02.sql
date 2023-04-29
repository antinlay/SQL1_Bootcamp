WITH outers AS (
	SELECT menu.id AS menu_id
	FROM menu
	EXCEPT
	SELECT menu_id
	FROM person_order
)
SELECT pizza_name, price, pizzeria.name AS pizzeria_name
FROM menu AS mn
JOIN pizzeria ON pizzeria.id = mn.pizzeria_id
JOIN outers ON outers.menu_id = mn.id
ORDER BY 1, 2