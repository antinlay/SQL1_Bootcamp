--Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- BEGIN
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

COMMIT;
-- COMMIT
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

--Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- BEGIN
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

UPDATE pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

-- Now an example showing how READ COMMITTED works. 
-- It allows you to see inside the transaction the changes 
-- that happened to the database during the execution of the transaction.