-- Session #1 Переходим в режим транзакции. Устанавливаем уровень изоляции - REPEATABLE READ --
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2 Переходим в режим транзакции. Устанавливаем уровень изоляции - REPEATABLE READ --
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session #1 Смотрим рейтинг --
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2 Смотрим рейтинг --
select * from pizzeria where name  = 'Pizza Hut';

-- Session #1 ОБновляем рейтинг --
UPDATE pizzeria SET rating = 4 WHERE name  = 'Pizza Hut';
-- Session #2 Обновляем рейтинг. Это не получается сделать, потому что данные меняеются в другой сесии.
-- Нужно дождаться, пока изменния подтвердят
UPDATE pizzeria SET rating = 3.6 WHERE name  = 'Pizza Hut';

-- Session #1 Подтверждаем изменения --
COMMIT;
-- Session #2 Подтверждаем изменения. Изменения откатываются назад --
COMMIT;

-- Session #1 Смотрим рейтинг. Результат из первой сессии  --
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2 Смотрим рейтинг --
select * from pizzeria where name  = 'Pizza Hut';