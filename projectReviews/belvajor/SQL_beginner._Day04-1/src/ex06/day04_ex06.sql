CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
  AND visit_date = '2022-01-08'
  JOIN person ON person.id = person_visits.person_id
  AND person.name = 'Dmitriy'
  JOIN menu on menu.pizzeria_id = pizzeria.id
  AND price < 800;
select *
from mv_dmitriy_visits_and_eats