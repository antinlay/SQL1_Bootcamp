-- Session #1 --
BEGIN;
-- Session #2 --
BEGIN;

-- Session #1. Видим исходные данные --
select * from pizzeria where name  = 'Pizza Hut';

-- Session #2 Обновляем рейтинг. Изменения применяются --
UPDATE pizzeria SET rating = 3.6 WHERE name  = 'Pizza Hut';
COMMIT;

-- Session #1. Смотрим данные. Видим обновленные из второй сесссии. Выходим из режим транзакции --
select * from pizzeria where name  = 'Pizza Hut';
COMMIT;

-- Session #1. Смотрим рейтинг. Видим обновленную информацию --
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2.  --
select * from pizzeria where name  = 'Pizza Hut';