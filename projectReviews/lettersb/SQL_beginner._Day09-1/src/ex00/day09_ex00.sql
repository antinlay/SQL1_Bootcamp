-- Создаем таблицу для аудита изменений в таблице person
CREATE TABLE person_audit (
    created timestamp WITH TIME ZONE NOT NULL DEFAULT now(),
    -- Дата создания записи аудита
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    -- Тип операции: 'I' - вставка, 'U' - обновление, 'D' - удаление
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U')) -- Ограничение на тип операции
);
-- Создаем триггерную функцию, которая будет вызываться после каждой операции вставки в таблицу person
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $$ BEGIN -- Вставляем запись в таблицу person_audit со значениями полей, полученными из новой вставленной записи в person
INSERT INTO person_audit(row_id, name, age, gender, address)
VALUES (
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
-- Возвращаем новую вставленную запись из таблицы person
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Создаем триггер, который будет вызывать триггерную функцию после каждой операции вставки в таблицу person
CREATE TRIGGER trg_person_insert_audit
AFTER
INSERT ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();
-- Вставляем новую запись в таблицу person
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
select *
from person_audit