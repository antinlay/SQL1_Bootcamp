INSERT INTO person_visits
VALUES ((select MAX(id)+1 from person_visits), (select id from person where name='Dmitriy') ,(select pizzeria_id from pizzeria join menu m on pizzeria.id = m.pizzeria_id where price < 800 limit 1),'2022-01-08');

refresh materialized view mv_dmitriy_visits_and_eats;
