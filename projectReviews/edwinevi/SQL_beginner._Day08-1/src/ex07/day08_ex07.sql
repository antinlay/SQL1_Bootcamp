-- Session #1 Переходим в режим транзакции. --
BEGIN;
-- Session #2 Переходим в режим транзакции --
BEGIN;

-- Session #1 Обновляем данные
UPDATE pizzeria SET rating = 4 WHERE id = 1;
-- Session #2 Обновляем данные
UPDATE pizzeria SET rating = 3 WHERE id = 2;

-- Session #1 Обновляем данные. Терминал зависает
UPDATE pizzeria SET rating = 1 WHERE id = 2;
-- Session #2 Обновляем данные. Выходит ошибка об обнаружении deadlock
UPDATE pizzeria SET rating = 2 WHERE id = 1;


-- Session #1 Выходим из ржеима транзакции. Изменения сохраняются
COMMIT;
-- Session #2 Выхоодим из режим транзакции. Все изменения откатываются из-за deadlock
-- потому что при обнаружении deadlock одна из транзакицй должна быть отменена, чтобы разблкировать ресурсы
-- и позволить оставшимся транзакциям продолжить выполнение
COMMIT;