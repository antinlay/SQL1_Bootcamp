CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

set enable_seqscan=off;
EXPLAIN ANALYZE SELECT pizzeria_id
FROM menu
WHERE pizza_name = 'supreme pizza'