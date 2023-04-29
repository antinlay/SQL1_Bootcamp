INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES(
		(
			SELECT MAX(id) + 1
			FROM person_visits
		),
		(
			SELECT person.id
			FROM person
			WHERE name = 'Dmitriy'
		),
		(
			(
				SELECT p1.id
				FROM pizzeria p1
					JOIN menu ON menu.pizzeria_id = p1.id
				WHERE menu.price < 800
			)
			EXCEPT (
					SELECT p2.id
					FROM pizzeria p2
						JOIN mv_dmitriy_visits_and_eats ON p2.name = mv_dmitriy_visits_and_eats.pizzeria_name
				)
			ORDER BY 1
			LIMIT 1
		), '2022-01-08'::timestamp
	);
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
select *
from mv_dmitriy_visits_and_eats