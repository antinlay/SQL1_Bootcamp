CREATE INDEX idx_person_visits_person_id ON person_visits USING btree(person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits USING btree(pizzeria_id);
CREATE INDEX idx_menu_pizzeria_id ON menu USING btree(pizzeria_id);
CREATE INDEX idx_person_order_menu_id ON person_order USING btree(menu_id);
CREATE INDEX idx_person_order_person_id ON person_order USING btree(person_id);
SELECT *
FROM pg_catalog.pg_class
WHERE pg_catalog.pg_class.relname LIKE 'idx_%';