CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    SELECT pizzeria.name AS name
    FROM (SELECT person_id, pizzeria_id, visit_date FROM person_visits WHERE visit_date = '2022-01-08') AS person_visits
    INNER JOIN (SELECT id, name FROM person WHERE name = 'Dmitriy') AS person
    ON person.id = person_visits.person_id
    INNER JOIN (SELECT id, pizzeria_id, pizza_name FROM menu WHERE price <= 800) AS menu
    ON menu.pizzeria_id = person_visits.pizzeria_id
    INNER JOIN pizzeria
    ON pizzeria.id = menu.pizzeria_id;

SELECT * FROM mv_dmitriy_visits_and_eats