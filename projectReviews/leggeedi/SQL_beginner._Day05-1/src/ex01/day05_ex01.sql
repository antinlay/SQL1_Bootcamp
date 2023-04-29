SET enable_seqscan to off;
EXPLAIN ANALYZE
    SELECT m.pizza_name, pz.name AS pizzeria_name FROM pizzeria pz, menu m
    WHERE pz.id = m.pizzeria_id;