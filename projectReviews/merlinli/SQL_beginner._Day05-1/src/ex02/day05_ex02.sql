CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));
SET enable_seqscan  = off;
EXPLAIN ANALYSE
    SELECT person.name FROM person ORDER BY UPPER(name);
	