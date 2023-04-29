--Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  19.9
-- (1 row)

SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  19.9
-- (1 row)

COMMIT;
-- COMMIT
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  23.9
-- (1 row)

--Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- BEGIN
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  19.9
-- (1 row)

UPDATE pizzeria set rating = 5 where name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  23.9
-- (1 row)

-- REPEATABLE READ. Also analogous to ex04. We can only see the changes that were in the table at the beginning of the transaction