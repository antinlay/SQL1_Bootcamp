select day.visit_date as missing_date
from (select distinct visit_date
        from person_visits
      where person_id > 0 and person_id < 3) AS pid
full outer join
  (select generate_series('2022-01-01'::DATE, '2022-01-10','1 day')::DATE as visit_date) as day
on pid.visit_date = day.visit_date
where pid.visit_date is NULL