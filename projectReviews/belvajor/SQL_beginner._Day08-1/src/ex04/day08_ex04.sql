BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Switch to SERIALIZABLE isolation level in both sessions: 1, 2

SHOW TRANSACTION ISOLATION LEVEL; -- Check that we are at SERIALIZABLE isolation level in both sessions: 1, 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in session 1

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- Make UPDATE of rating to 3.0 value in session 2

COMMIT; -- Commit changes in session 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in sessions 1
 
COMMIT; -- Commit changes in session 1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in session 2