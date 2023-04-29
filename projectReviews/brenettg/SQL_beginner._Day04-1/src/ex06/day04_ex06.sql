CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats as select *
from (
select pizzeria.name as pizzeria_name
from person
join person_visits
on person.id = person_visits.person_id
join pizzeria
    on person_visits.pizzeria_id = pizzeria.id
join menu
    on pizzeria.id = menu.pizzeria_id
where person.name = 'Dmitriy' and price < 800 and visit_date = '2022-01-08') as mv_dmitriy_visits_and_eats
