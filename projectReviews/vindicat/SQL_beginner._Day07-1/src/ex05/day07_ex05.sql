SELECT person.name
FROM (SELECT DISTINCT person_id FROM person_order) AS person_order_list
LEFT JOIN person ON person.id = person_order_list.person_id
ORDER BY person.name ASC;
