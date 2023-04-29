SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT m.pizza_name, pizzeria.name AS pizzeria_name
FROM menu AS m
LEFT JOIN pizzeria on pizzeria.id = m.pizzeria_id;
-- WHERE pizzeria.id > 0;