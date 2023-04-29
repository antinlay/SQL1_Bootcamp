BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Switch to READ COMMITTED isolation level in both sessions

SHOW TRANSACTION ISOLATION LEVEL; -- Check that we are at READ COMMITTED isolation level in both sessions

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in session 1

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Make UPDATE of rating to 3.6 value in session 2
COMMIT; -- Commit changes in session 2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check a rating for “ Pizza Hut ” in sessions 1
COMMIT; -- Commit changes in session 1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check changes in session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Check changes in session 2