-- Удаляем старые триггеры и функции, чтобы не было конфликтов
DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;
DROP FUNCTION fnc_trg_person_insert_audit;
DROP FUNCTION fnc_trg_person_update_audit;
DROP FUNCTION fnc_trg_person_delete_audit;
-- Очищаем таблицу с аудитом
DELETE FROM person_audit;
-- Создаем функцию-триггер, которая будет обрабатывать события вставки, обновления и удаления строк в таблице person
CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS trigger AS $$
DECLARE str text := '';
BEGIN -- Если происходит вставка строки, то записываем это в аудит событий как 'I' - INSERT
IF TG_OP = 'INSERT' THEN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
VALUES(
        'I',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
-- Если происходит обновление строки, то записываем это в аудит событий как 'U' - UPDATE
ELSIF TG_OP = 'UPDATE' THEN
INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
VALUES(
        'U',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
-- Если происходит удаление строки, то записываем это в аудит событий как 'D' - DELETE
ELSE
INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
VALUES(
        'D',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
END IF;
-- Возвращаем значение NEW, так как это функция-триггер
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Создаем триггер на таблице person, который будет запускать функцию-триггер fnc_trg_person_audit() при каждом изменении таблицы
CREATE TRIGGER trg_person_audit
AFTER
INSERT
    OR
UPDATE
    OR DELETE ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
DELETE FROM person
WHERE id = 10;