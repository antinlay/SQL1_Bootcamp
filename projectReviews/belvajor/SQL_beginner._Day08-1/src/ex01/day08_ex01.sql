SHOW TRANSACTION ISOLATION LEVEL; -- First, check that we are at a default isolation level: 
-- “ read committed ” in both sessions: 1, 2

BEGIN; -- in session 1
BEGIN; -- in session 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in session 1 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in session 2

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- Make UPDATE of rating to 4 value in session 1 

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Make UPDATE of rating to 3.6 value in session 2
 
COMMIT; -- Commit changes in session 1
COMMIT; -- Commit changes in session 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check changes in session 1 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check changes in session 2