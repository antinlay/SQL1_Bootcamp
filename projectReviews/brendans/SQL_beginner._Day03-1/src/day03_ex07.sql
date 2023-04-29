INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
		(
			SELECT max(id) + 1
			FROM menu
		),
		2,
		'sicilian pizza',
		'900'
	);
select count(*) = 1 as check
from menu
where id = 20
	and pizzeria_id = 2
	and pizza_name = 'sicilian pizza'
	and price = 900