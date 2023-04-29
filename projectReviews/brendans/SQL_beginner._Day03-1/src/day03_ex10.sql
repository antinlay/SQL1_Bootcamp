INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES (
		(
			SELECT max(id) + 1
			FROM person_order
		),
		(
			SELECT person.id
			FROM person
			WHERE person.name = 'Denis'
		),
		(
			SELECT id
			FROM menu
			WHERE pizza_name = 'sicilian pizza'
		),
		'2022-02-24'
	),
	(
		(
			SELECT max(id) + 2
			FROM person_order
		),
		(
			SELECT person.id
			FROM person
			WHERE person.name = 'Irina'
		),
		(
			SELECT id
			FROM menu
			WHERE pizza_name = 'sicilian pizza'
		),
		'2022-02-24'
	);
select count(*) = 2 as check
from person_order
where order_date = '2022-02-24'
	and person_id in (6, 4)
	and menu_id =(
		select id
		from menu
		where pizza_name = 'sicilian pizza'
	)