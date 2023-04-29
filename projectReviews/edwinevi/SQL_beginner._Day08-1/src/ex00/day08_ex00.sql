-- Session #1 Обновляем данные и смотрим результат --
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name  = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';
-- Session #2 Смотрим, что во второй сесии нет изменений --
select * from pizzeria where name  = 'Pizza Hut';

-- Session #1 Подтверждаем изменения --
COMMIT;
-- Session #2 ПРоверяем, что изменения прилетели --
select * from pizzeria where name  = 'Pizza Hut';
