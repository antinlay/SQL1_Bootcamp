-- Session #1 Переходим в режим транзакции. --
BEGIN;
-- Session #2 Переходим в режим транзакции --
BEGIN;

-- Session #1. Считаем сумму рейтинга --
SELECT SUM(rating) FROM pizzeria;

-- Session #2 Обновляем данные во второй сессии --
UPDATE pizzeria SET rating = 1 WHERE name  = 'Pizza Hut';
COMMIT;

-- Session #1. Считаем сумму рейтинга. Она считается с учетом обновленных данных из второй сессии. Выходим из режим транзакции --
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Session #1. Считаем сумму рейтинга. Считается с учетом новых данных в обоих сессиях --
SELECT SUM(rating) FROM pizzeria;
-- Session #2.  --
SELECT SUM(rating) FROM pizzeria;