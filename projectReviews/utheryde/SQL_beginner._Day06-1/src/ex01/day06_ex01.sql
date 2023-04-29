with table_hell as (
    SELECT person_order.person_id, m.pizzeria_id,
                      COUNT(person_id) as person_count,
    CASE
    WHEN COUNT(person_id) = 1 THEN 10.5
    WHEN COUNT(person_id) = 2 THEN 22
    ELSE 30
    END discount
from person_order
join menu m on person_order.menu_id = m.id
join pizzeria p on p.id = m.pizzeria_id
GROUP BY person_order.person_id, m.pizzeria_id)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER ( ) AS id,
    table_hell.person_id,
    table_hell.pizzeria_id,
    table_hell.discount
from table_hell;

SELECT * FROM person_discounts;



-- DROP TABLE person_discounts;











-- INSERT INTO person_discounts (person_id, pizzeria_id, discount)
-- VALUES ()