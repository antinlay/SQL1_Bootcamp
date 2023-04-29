WITH generated_dates AS (
  SELECT gs::DATE AS missing_date
  FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS gs
)
SELECT DISTINCT missing_date
FROM generated_dates
  LEFT JOIN (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1
      OR person_id = 2
  ) AS tmp ON generated_dates.missing_date = tmp.visit_date
WHERE tmp.visit_date is NULL
ORDER BY 1;