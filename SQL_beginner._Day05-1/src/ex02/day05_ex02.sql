CREATE INDEX idx_person_name ON person(upper(name));
SET enable_seqscan = false;
EXPLAIN ANALYZE
SELECT name
FROM person
WHERE upper(name) = 'DENIS';
SELECT *
FROM pg_catalog.pg_class
WHERE pg_catalog.pg_class.relname = 'idx_person_name';