CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
    SELECT p.name AS name,
       m.pizza_name AS pizza_nmae,
       m.price AS price,
       (m.price - (m.price * pd.discount / 100)) AS discount_price,
       pi.name as pizzeria_nmae
FROM person_order po
    JOIN person p ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
    JOIN person_discounts pd ON po.person_id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
ORDER BY name, pizza_name