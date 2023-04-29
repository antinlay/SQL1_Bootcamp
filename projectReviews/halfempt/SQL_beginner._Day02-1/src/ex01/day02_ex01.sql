-- SELECT visit_date AS missing_date
-- FROM
--      person_visits RIGHT JOIN person
-- ON person_visits.person_id = person.id
-- --WHERE visit_date IS NULL
-- ORDER BY missing_date


-- Функция DATE извлекает дату из даты-времени в формате год-месяц-день.
-- https://www.timescale.com/blog/how-to-shape-sample-data-with-postgresql-generate_series-and-sql/

SELECT date(d) AS missing_date
FROM (SELECT * FROM generate_series('2022-01-01'::TIMESTAMP, '2022-01-10'::TIMESTAMP, INTERVAL '1 day') AS d) md
LEFT JOIN(SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) vd
    ON (visit_date = md.d)
    WHERE visit_date IS NULL
ORDER BY missing_date;

