--Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  23.9
-- (1 row)

UPDATE pizzeria set rating = 2 where name = 'Pizza Hut';
-- UPDATE 1
UPDATE pizzeria set rating = 3 where name = 'Dominos';
-- UPDATE 1
COMMIT;
-- COMMIT

--Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN
UPDATE pizzeria set rating = 5 where name = 'Dominos';
-- UPDATE 1
UPDATE pizzeria set rating = 5 where name = 'Pizza Hut';
-- ERROR:  deadlock detected
-- DETAIL:  Process 7843 waits for ShareLock on transaction 2052; blocked by process 6986.
-- Process 6986 waits for ShareLock on transaction 2053; blocked by process 7843.
-- HINT:  See server log for query details.
-- CONTEXT:  while updating tuple (0,18) in relation "pizzeria"
COMMIT;
-- ROLLBACK

-- A classic example of Deadlock. Changes that cannot be accepted because 
-- of a mutual change in the table. In session #2, when we try to make an
-- UPDATE, we get a DEADLOCK message, and roll back our changes to the beginning of the transaction.