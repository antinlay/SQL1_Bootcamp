SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
  JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
  AND visit_date = '2022-01-08'
  JOIN person ON person.id = person_visits.person_id
  AND person.name = 'Dmitriy'
  JOIN menu ON menu.pizzeria_id = pizzeria.id
  AND PRICE < 800
ORDER BY 1;