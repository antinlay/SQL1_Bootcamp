SELECT
	(SELECT name from person WHERE person.id = ord.person_id),
	(SELECT CASE WHEN name = 'Denis' THEN true ELSE false END AS check_name FROM person WHERE person.id = ord.person_id)
FROM person_order AS ord WHERE (ord.menu_id=13 OR ord.menu_id=14 OR ord.menu_id=18) AND ord.order_date='2022-01-07';