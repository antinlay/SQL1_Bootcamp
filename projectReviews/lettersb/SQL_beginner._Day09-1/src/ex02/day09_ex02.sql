-- Создание функции fnc_trg_person_delete_audit
-- Эта функция будет вызвана при выполнении операции DELETE на таблице person
-- Она добавляет запись в таблицу person_audit, отслеживающую удаление записи из таблицы person
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS $$ BEGIN -- Вставка данных об удаленной записи в таблицу person_audit
INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
VALUES (
        'D',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
-- Возвращаем NEW, чтобы триггер завершился успешно
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Создание триггера trg_person_delete_audit
-- Он будет вызывать функцию fnc_trg_person_delete_audit после операции DELETE на таблице person
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();
DELETE FROM person
WHERE id = 10;
select *
from person_audit