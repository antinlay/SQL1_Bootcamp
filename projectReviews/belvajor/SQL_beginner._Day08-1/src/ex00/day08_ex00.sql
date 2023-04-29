BEGIN; -- in session 1

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; -- update of rating for “ Pizza Hut ” to 5 points

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- check that you can see a changes in session 1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- check that you can't see a changes session 2 

COMMIT; -- publish your changes for all parallel sessions in session 1

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- check that you can see changes in session 2