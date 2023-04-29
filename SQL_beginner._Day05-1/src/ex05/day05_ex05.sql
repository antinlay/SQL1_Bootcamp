CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(person_id, menu_id, order_date)
WHERE order_date = '2022-01-01';
SET enable_seqscan = false;
EXPLAIN ANALYZE
SELECT person_id,
    menu_id
FROM person_order
WHERE menu_id = 3
    AND person_id = 1
    AND order_date = '2022-01-01';
SELECT *
FROM pg_catalog.pg_class
WHERE pg_catalog.pg_class.relname = 'idx_person_order_order_date';