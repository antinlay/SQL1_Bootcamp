SELECT person_order.order_date AS action_date,
  person.name AS person_name
FROM person_order,
  person,
  person_visits
WHERE order_date = visit_date
  AND person.id = person_order.person_id
INTERSECT
SELECT person_visits.visit_date AS action_date,
  person.name AS person_name
FROM person_visits,
  person,
  person_order
WHERE visit_date = order_date
  AND person.id = person_visits.person_id
ORDER BY action_date ASC,
  person_name DESC