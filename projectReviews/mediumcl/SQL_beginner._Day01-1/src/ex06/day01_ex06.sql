SELECT visit_date AS action_date, person.name AS person_name
FROM person_visits 
INNER JOIN person ON person_visits.person_id = person.id
WHERE (person_id, visit_date) in (
    SELECT  person_id, visit_date from person_visits
    INTERSECT
    SELECT person_id, order_date from person_order)
ORDER BY 1, 2 DESC;