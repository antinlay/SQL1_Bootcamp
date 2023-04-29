DROP TRIGGER IF EXISTS trg_person_delete_audit ON person CASCADE;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person CASCADE;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_person_delete_audit CASCADE;
DROP FUNCTION IF EXISTS fnc_person_insert_audit CASCADE;
DROP FUNCTION IF EXISTS fnc_person_update_audit CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_audit CASCADE;
CREATE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER LANGUAGE PLPGSQL AS $$ BEGIN IF (TG_OP = 'DELETE') THEN
INSERT INTO person_audit
SELECT current_timestamp,
    'D',
    OLD.id,
    OLD.name,
    OLD.age,
    OLD.gender,
    OLD.address;
ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO person_audit
SELECT current_timestamp,
    'U',
    OLD.id,
    OLD.name,
    OLD.age,
    OLD.gender,
    OLD.address;
ELSIF (TG_OP = 'INSERT') THEN
INSERT INTO person_audit
SELECT current_timestamp,
    'I',
    NEW.id,
    NEW.name,
    NEW.age,
    NEW.gender,
    NEW.address;
END IF;
RETURN NULL;
END;
$$;
CREATE TRIGGER trg_person_audit
AFTER
INSERT
    OR
UPDATE
    OR DELETE ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();
TRUNCATE person_audit;
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
SELECT *
FROM person;
SELECT *
FROM person_audit;