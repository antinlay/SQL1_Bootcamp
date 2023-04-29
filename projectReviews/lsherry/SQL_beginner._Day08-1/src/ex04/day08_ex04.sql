--Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- BEGIN
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

COMMIT;
-- COMMIT
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

--Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- BEGIN
UPDATE pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

-- Also an example with SERIALIZABLE. Here we see that in 
-- this mode we can't observe changes happening to the table
-- in real time. We are working with data that was at the time 
-- the transaction started