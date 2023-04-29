CREATE INDEX idx_person_name ON person(upper(name));

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE SELECT name
FROM person WHERE upper(name) = 'ANNA';