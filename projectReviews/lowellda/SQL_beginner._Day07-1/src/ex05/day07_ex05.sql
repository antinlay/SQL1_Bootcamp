SELECT DISTINCT name
FROM person_order
INNER JOIN person on person_order.person_id = person.id
ORDER BY name;