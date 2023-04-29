-- We start two sessions
-- Write 'BEGIN' in each of them
begin;
-- Check that we are on correct isolation level
SHOW TRANSACTION ISOLATION LEVEL;
-- Update ration of 'Pizzat Hut' in the first session on 4
-- and in the second session on 3.6
UPDATE pizzeria p set rating = 4 WHERE p.name = 'Pizza Hut'; -- for the first
UPDATE pizzeria p set rating = 3.6 WHERE p.name = 'Pizza Hut'; -- for the second
-- We commit our changes;
commit;
-- And write two selects to see the results
SELECT *
FROM pizzeria
WHERE pizzeria.name = 'Pizza Hut';
SELECT *
FROM pizzeria
WHERE pizzeria.name = 'Pizza Hut';
-- The result is 3.6 in both tables IMHO