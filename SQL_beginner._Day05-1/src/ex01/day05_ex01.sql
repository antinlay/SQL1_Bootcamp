SET enable_seqscan = false;
EXPLAIN ANALYZE
SELECT m.pizza_name,
    pizzeria.name AS pizzeria_name
FROM menu AS m
    JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE m.pizza_name = 'cheese pizza';