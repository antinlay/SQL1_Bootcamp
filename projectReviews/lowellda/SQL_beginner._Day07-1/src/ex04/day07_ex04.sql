SELECT person.name, COUNT(person_id) as count_of_visits
FROM person_visits
INNER JOIN person on person.id = person_visits.person_id
GROUP BY person.name
HAVING COUNT(person) > 3;