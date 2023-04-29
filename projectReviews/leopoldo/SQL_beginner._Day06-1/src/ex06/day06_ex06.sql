CREATE SEQUENCE seq_person_discounts START WITH 1;
ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT NEXTVAL('seq_person_discounts');
SELECT SETVAL(
    'seq_person_discounts',
    (
      SELECT count(*) + 1
      FROM person_discounts
    )
  );
select count(*) = 1 as check1,
  max("start_value") = 1 as check2,
  max("last_value") > 5 as check3
from pg_sequences
where sequencename = 'seq_person_discounts'