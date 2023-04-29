drop materialized view if exists mv_dmitriy_visits_and_eats;
drop view if exists v_persons_female,
v_persons_male,
v_generated_dates,
v_symmetric_union,
v_price_with_discount;
select count(*) = 0 as check
from pg_class
where relname in (
    'v_generated_dates',
    'v_persons_female',
    'v_persons_male',
    'v_price_with_discount',
    'v_symmetric_union',
    'mv_dmitriy_visits_and_eats'
  )