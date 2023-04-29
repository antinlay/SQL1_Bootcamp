set enable_seqscan = off;

SELECT pizza_name, p.name AS pizzeria_name
FROM menu AS m
         INNER JOIN pizzeria AS p
                    ON p.id = m.pizzeria_id
-- ORDER BY 1, 2;
;

EXPLAIN ANALYZE SELECT pizza_name, p.name AS pizzeria_name
FROM menu AS m
         INNER JOIN pizzeria AS p
                    ON p.id = m.pizzeria_id
-- ORDER BY 1, 2
;