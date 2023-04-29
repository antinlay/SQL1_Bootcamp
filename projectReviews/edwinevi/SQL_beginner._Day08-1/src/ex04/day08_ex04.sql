-- Session #1 Переходим в режим транзакции. Устанавливаем уровень изоляции - SERIALIZABLE --
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #2 Переходим в режим транзакции. Устанавливаем уровень изоляции - SERIALIZABLE --
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #1. Видим изначальный результат --
select * from pizzeria where name  = 'Pizza Hut';

-- Session #2 Обновляем данные --
UPDATE pizzeria SET rating = 3.0 WHERE name  = 'Pizza Hut';
COMMIT;

-- Session #1. Проверяем даннные. Все еще изначальный результат. Выходим из режима транзакции --
select * from pizzeria where name  = 'Pizza Hut';
COMMIT;

-- Session #1. Проверяем данные. Видим обновленный результат --
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2.  --
select * from pizzeria where name  = 'Pizza Hut';