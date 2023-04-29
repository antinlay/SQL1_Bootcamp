SELECT DISTINCT person_id FROM person_visits
WHERE visit_date BETWEEN '2022-01-06'::date AND '2022-01-09'::date
OR pizzeria_id = 2 ORDER BY person_id DESC;