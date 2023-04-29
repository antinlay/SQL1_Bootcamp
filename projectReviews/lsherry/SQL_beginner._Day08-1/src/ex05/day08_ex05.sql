-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- BEGIN
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  22.5
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
--  19.9
-- (1 row)

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- BEGIN
UPDATE pizzeria set rating = 1 where name = 'Pizza Hut';
-- UPDATE 1
COMMIT;
-- COMMIT
SELECT sum(rating) from pizzeria;
--  sum
-- ------
--  19.9
-- (1 row)


-- An example similar to ex03. READ COMMITTED allows you to show changes that occur in real time