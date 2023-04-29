SELECT name, COUNT(*) as count_of_visits
FROM person_visits
INNER JOIN person on person.id = person_visits.person_id
GROUP BY name
ORDER BY count_of_visits desc, name
LIMIT 4