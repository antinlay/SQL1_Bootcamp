CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);
SET enable_seqscan = false;
EXPLAIN ANALYZE
SELECT pizzeria_id,
    pizza_name
FROM menu;
SELECT *
FROM pg_catalog.pg_class
WHERE pg_catalog.pg_class.relname = 'idx_menu_unique';