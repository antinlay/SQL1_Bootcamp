-- We start two sessions
-- Write 'BEGIN' in each of them
begin;
-- Check that we are on correct isolation level
SHOW TRANSACTION ISOLATION LEVEL;
-- Then we change transaction isolation level on 'READ COMMITTED' for both sessions
set transaction isolation level read committed;
set transaction isolation level read committed;
-- Next we select sum of rating for the first session which is 21.9
SELECT sum(rating) FROM pizzeria;
-- Update ration of 'Pizza Hut' in the second session on 1
UPDATE pizzeria p SET rating = 1 WHERE p.name = 'Pizza Hut'; -- for the second
-- We commit our changes for the second session;
commit;
-- Next we select sum of rating for the first session which is 19.9
SELECT sum(rating) FROM pizzeria;
-- We commit our changes for the first session;
commit;
-- And write two selects to see the results
SELECT sum(rating) FROM pizzeria;
SELECT sum(rating) FROM pizzeria;
-- The result is 19.9 in both tables IMHO
