-- We start two sessions
-- Write 'BEGIN' in each of them
begin;
-- Then we write update for session 1
UPDATE pizzeria p
SET rating = 1
WHERE p.id = 1;
-- Then we write update for session 2
UPDATE pizzeria p
SET rating = 2
WHERE p.id = 2;
-- Then we write update for session 1
UPDATE pizzeria p
SET rating = 2
WHERE p.id = 2;
-- Then we write update for session 2
UPDATE pizzeria p
SET rating = 1
WHERE p.id = 1;
-- The we see and error
-- Process 7915 waits for ShareLock on transaction 2144; blocked by process 30441.
-- HINT:  See server log for query details.
-- CONTEXT:  while updating tuple (0,22) in relation "pizzeria"
-- And finally make our commits
commit;