create materialized view mv_dmitriy_visits_and_eats as (
    select pz.name as pizzeria_name
    from pizzeria pz
        inner join person_visits pv on pz.id = pv.pizzeria_id
        and pv.visit_date = '2022-01-08'
        inner join person p on pv.person_id = p.id
        inner join menu m on pz.id = m.pizzeria_id
        and m.price < 800
    where p.name = 'Dmitriy'
);
-- select * from mv_dmitriy_visits_and_eats;
select *
from mv_dmitriy_visits_and_eats