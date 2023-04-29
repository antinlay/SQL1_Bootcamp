SET enable_seqscan = off;

EXPLAIN ANALYZE
    SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
    FROM pizzeria, menu
    WHERE pizzeria.id = menu.pizzeria_id;
