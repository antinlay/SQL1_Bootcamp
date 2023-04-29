CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $$ BEGIN IF (TG_OP = 'DELETE') THEN
INSERT INTO person_audit(
		CREATED,
		TYPE_EVENT,
		ROW_ID,
		NAME,
		AGE,
		GENDER,
		ADDRESS
	)
VALUES (
		NOW(),
		'D',
		old.id,
		old.name,
		old.age,
		old.gender,
		old.address
	);
END IF;
RETURN NEW;
END $$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();
DELETE FROM person
WHERE id = 10;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();
select *
from person_audit