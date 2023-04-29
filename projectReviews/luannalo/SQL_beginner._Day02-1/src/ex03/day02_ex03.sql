with days as (
    select generate_series('2022-01-01'::DATE, '2022-01-10','1 day')::DATE as visit_date )
select d.visit_date as missing_date
from (select distinct visit_date from person_visits where person_id between 1 and 2) as pv
right join days d
    on pv.visit_date = d.visit_date
where pv.visit_date is NULL
order by 1;