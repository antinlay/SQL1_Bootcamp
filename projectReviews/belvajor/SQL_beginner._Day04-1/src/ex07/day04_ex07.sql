INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (
      SELECT MAX(id) + 1
      FROM person_visits
    ),
    (
      SELECT id
      FROM person
      WHERE name = 'Dmitriy'
    ),
    (
      SELECT id
      FROM pizzeria
      WHERE id = (
          SELECT pizzeria_id
          FROM menu
          WHERE price = 780
        )
    ),
    '2022-01-08'
  );
refresh materialized view mv_dmitriy_visits_and_eats;
select *
from mv_dmitriy_visits_and_eats