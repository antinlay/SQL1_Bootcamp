DROP TRIGGER IF EXISTS trg_person_delete_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();
DROP TRIGGER IF EXISTS trg_person_update_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
TRUNCATE person_audit;
CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $$ BEGIN IF (TG_OP = 'INSERT') THEN
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
		'I',
		new.id,
		new.name,
		new.age,
		new.gender,
		new.address
	);
ELSIF (TG_OP = 'DELETE') THEN
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
ELSIF (TG_OP = 'UPDATE') THEN
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
		'U',
		old.id,
		new.name,
		old.age,
		old.gender,
		old.address
	);
END IF;
RETURN NEW;
END $$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_audit
AFTER
INSERT
	OR
UPDATE
	OR DELETE ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();
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
DROP TRIGGER IF EXISTS trg_person_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_audit();
select *
from person_audit