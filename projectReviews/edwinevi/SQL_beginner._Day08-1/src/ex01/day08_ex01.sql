-- Session #1 --
BEGIN;
-- Session #2 --
BEGIN;

-- Session #1 Смотрим рейтинг --
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2 Смотрим рейтинг --
select * from pizzeria where name  = 'Pizza Hut';

-- Session #1 ОБновляем рейтинг --
UPDATE pizzeria SET rating = 4 WHERE name  = 'Pizza Hut';
-- Session #2 Обновляем рейтинг. Терминал зависает --
UPDATE pizzeria SET rating = 3.6 WHERE name  = 'Pizza Hut';

-- Session #1 Подтверждаем изменения. Вторая сессия отвисает--
COMMIT;
-- Session #2 Подтверждаем изменения --
COMMIT;

-- Session #1 Смотрим рейтинг. Результат со второй сессии  --
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2 Смотрим рейтинг --
select * from pizzeria where name  = 'Pizza Hut';