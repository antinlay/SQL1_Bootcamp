--Session #1
begin;
-- BEGIN
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

UPDATE pizzeria set rating = 4 where name = 'Pizza Hut';
-- UPDATE 1
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      4
-- (1 row)

commit;
-- COMMIT
Select * from pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

--Session #2
begin;
-- BEGIN
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)

UPDATE pizzeria set rating = 3.6 where name = 'Pizza Hut';
-- UPDATE 1
commit;
-- COMMIT
SELECT * FROM pizzeria where name = 'Pizza Hut';
--  id |   name    | rating
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)

-- In this example, we see that the sequence of the transactions 
-- themselves also plays a role. After the first transaction was 
-- executed, a second transaction was executed, which overwrote the 
-- data from the first transaction.