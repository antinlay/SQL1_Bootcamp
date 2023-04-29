BEGIN; -- first in session 1, then in session 2

UPDATE pizzeria SET rating = 5 WHERE id = 1; -- Make UPDATE of rating to 5 value for id = 1 in session 1 

UPDATE pizzeria SET rating = 1 WHERE id = 2; -- Make UPDATE of rating to 1 value for id = 2 in session 2 

UPDATE pizzeria SET rating = 5 WHERE id = 2; -- Make UPDATE of rating to 5 value for id = 2 in session 1 

UPDATE pizzeria SET rating = 1 WHERE id = 1; -- Make UPDATE of rating to 1 value for id = 1 in session 2 
 
COMMIT; -- Commit changes in session 1
COMMIT; -- Commit changes in session 2

