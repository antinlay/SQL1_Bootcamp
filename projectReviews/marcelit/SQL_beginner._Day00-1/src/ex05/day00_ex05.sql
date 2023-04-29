SELECT
	(SELECT name from person AS _name WHERE _name.id = ord.person_id)
FROM person_order AS ord WHERE (ord.menu_id=13 OR ord.menu_id=14 OR ord.menu_id=18) AND ord.order_date='2022-01-07';
