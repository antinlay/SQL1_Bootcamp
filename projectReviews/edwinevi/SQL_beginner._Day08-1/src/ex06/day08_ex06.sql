-- Session #1 Переходим в режим транзакции. Устанавливаем уровень изоляции - REPEATABLE READ --
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2 Переходим в режим транзакции. Устанавливаем уровень изоляции - REPEATABLE READ --
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;


-- Session #1. Считаем сумму рейтинга --
SELECT SUM(rating) FROM pizzeria;

-- Session #2 Обновляем данные во второй сессии. Подтверждаем изменения --
UPDATE pizzeria SET rating = 5 WHERE name  = 'Pizza Hut';
COMMIT;

-- Session #1. Считаем сумму рейтинга. Не видим обновление из второй транзакции. Выходим из режима транзакции  --
SELECT SUM(rating) FROM pizzeria;
COMMIT;

-- Session #1. Считаем сумму рейтинга. Видим обновление из второй транзакции --
SELECT SUM(rating) FROM pizzeria;
-- Session #2.  --
SELECT SUM(rating) FROM pizzeria;