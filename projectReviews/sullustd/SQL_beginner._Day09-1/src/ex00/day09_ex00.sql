CREATE TABLE person_audit (
	created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
	type_event CHAR(1) DEFAULT 'I' NOT NULL,
	row_id BIGINT NOT NULL,
	name VARCHAR,
	age INTEGER,
	gender VARCHAR,
	address VARCHAR
);
ALTER TABLE person_audit
ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'));
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$ BEGIN IF (TG_OP = 'INSERT') THEN
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
END IF;
RETURN NEW;
END $$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_insert_audit
AFTER
INSERT ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person CASCADE;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
select *
from person_audit