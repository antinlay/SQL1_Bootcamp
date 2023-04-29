BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Switch to READ COMMITTED isolation level in both sessions: 1, 2

SHOW TRANSACTION ISOLATION LEVEL; -- Check that we are at READ COMMITTED isolation level in both sessions: 1, 2

SELECT SUM(rating) FROM pizzeria; -- Check SUM of all ratings for all pizzerias in session 1

UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut'; -- Make UPDATE of rating to 1 value in session 2

COMMIT; -- Commit changes in session 2

SELECT SUM(rating) FROM pizzeria; -- Check SUM of all ratings for all pizzerias in session 1
 
COMMIT; -- Commit changes in session 1

SELECT SUM(rating) FROM pizzeria; -- Check SUM of all ratings for all pizzerias in session 1
SELECT SUM(rating) FROM pizzeria; -- Check SUM of all ratings for all pizzerias in session 2