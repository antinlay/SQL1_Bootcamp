CREATE VIEW v_symmetric_union AS
SELECT t1.id,
  t1.person_id,
  t1.pizzeria_id,
  t1.visit_date
FROM (
    SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-02'
  ) t1
  LEFT JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-06'
  ) t2 ON t1.person_id = t2.person_id
UNION
SELECT t2.id,
  t2.person_id,
  t2.pizzeria_id,
  t2.visit_date
FROM (
    SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-06'
  ) t2
  LEFT JOIN (
    SELECT *
    FROM person_visits
    WHERE visit_date = '2022-01-02'
  ) t1 ON t1.person_id = t2.person_id
ORDER BY person_id;
select *
from v_symmetric_union