
--Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN
BEGIN;
-- WARNING:  there is already a transaction in progress
-- BEGIN
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

UPDATE pizzeria set rating = 4 where name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

--Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

UPDATE pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- ERROR:  could not serialize access due to concurrent update
COMMIT;
-- ROLLBACK
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

-- This example shows how commits are executed in REPEATABLE READ 
-- mode. Before sending a commit, we got a message saying "could not 
-- serialize access due to concurrent update". This protects the user 
-- from losing updated data