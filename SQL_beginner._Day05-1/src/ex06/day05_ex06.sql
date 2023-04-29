SET enable_seqscan = true;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
    max(rating) OVER (
        PARTITION BY rating
        ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS k
FROM menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,
    2;
CREATE INDEX idx_1 ON pizzeria(rating ASC, id, name);
SET enable_seqscan = true;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
    max(rating) OVER (
        PARTITION BY rating
        ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS k
FROM menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,
    2;
SELECT *
FROM pg_catalog.pg_class
WHERE pg_catalog.pg_class.relname = 'idx_1';