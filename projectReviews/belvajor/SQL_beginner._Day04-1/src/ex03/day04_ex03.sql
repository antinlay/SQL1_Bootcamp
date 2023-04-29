SELECT generate_date AS missing_date
FROM v_generated_dates
WHERE NOT EXISTS(
    SELECT visit_date
    FROM person_visits
    WHERE visit_date = v_generated_dates.generate_date
  )
ORDER BY 1;