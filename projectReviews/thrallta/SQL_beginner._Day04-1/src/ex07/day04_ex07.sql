WITH t1 AS (
  SELECT pizzeria.id
  FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
  WHERE menu.price < 800
    AND pizzeria.name NOT IN (
      SELECT pizzeria.name
      FROM pizzeria
        JOIN menu m ON pizzeria.id = m.pizzeria_id
        JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
        JOIN person p ON pv.person_id = p.id
      WHERE p.name = 'Dmitriy'
        AND pv.visit_date = '2022-01-08'
        AND m.price < 800
    )
  LIMIT 1
)
INSERT INTO person_visits
VALUES (
    (
      SELECT (count(id) + 1)
      FROM person_visits
    ),
    (
      SELECT person.id
      FROM person
      WHERE name = 'Dmitriy'
    ),
    (
      SELECT id
      FROM t1
    ),
    '2022-01-08'
  );
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
select *
from mv_dmitriy_visits_and_eats