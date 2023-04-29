DROP FUNCTION IF EXISTS fnc_trg_person_update_audit CASCADE;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person CASCADE;
CREATE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER LANGUAGE PLPGSQL AS $$ BEGIN
INSERT INTO person_audit(
        created,
        type_event,
        row_id,
        name,
        age,
        gender,
        address
    )
VALUES (
        current_timestamp,
        'U',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
RETURN NEW;
END;
$$;
CREATE TRIGGER trg_person_update_audit BEFORE
UPDATE ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;