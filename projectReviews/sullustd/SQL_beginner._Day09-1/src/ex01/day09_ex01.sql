CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
	RETURNS TRIGGER
AS
$$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
		INSERT INTO person_audit(CREATED, TYPE_EVENT, ROW_ID, NAME, AGE, GENDER, ADDRESS)
		VALUES (NOW(), 'U', old.id, new.name, old.age, old.gender, old.address);
	END IF;
	RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
	BEFORE UPDATE
	ON person
	FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;


DROP TRIGGER IF EXISTS trg_person_update_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();