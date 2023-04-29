SELECT COALESCE(person.name, '-') AS person_name,
  A.visit_date,
  COALESCE(A.name, '-') AS pizzeria_name
FROM person
  FULL JOIN (
    SELECT *
    FROM (
        SELECT *
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
      ) AS A
      FULL JOIN pizzeria ON pizzeria.id = A.pizzeria_id
  ) AS A ON A.person_id = person.id
ORDER BY 1,
  2,
  3;