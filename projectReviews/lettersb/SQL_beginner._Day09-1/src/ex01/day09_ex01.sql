-- Создание функции, которая будет вызываться при выполнении триггера
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS trigger AS $$ BEGIN -- Вставка записи в таблицу аудита с типом события "U" - обновление
    -- и данными, которые были изменены
INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
VALUES (
        'U',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
-- Возвращение значения NEW - новой строки, полученной после обновления,
-- которое необходимо вернуть для корректной работы триггера
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Создание триггера на обновление записей в таблице person
CREATE TRIGGER trg_person_update_audit
AFTER
UPDATE ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
select *
from person_audit