CREATE VIEW v_symmetric_union AS
SELECT person_id
FROM (
    (
      select person_id
      from person_visits
      where visit_date = '2022-01-02'
      except
      select person_id
      from person_visits
      where visit_date = '2022-01-06'
    )
    union
    (
      select person_id
      from person_visits
      where visit_date = '2022-01-06'
      except
      select person_id
      from person_visits
      where visit_date = '2022-01-02'
    )
    order by person_id
  ) as person_id;
select *
from mv_dmitriy_visits_and_eats