DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;
DROP FUNCTION IF EXISTS fnc_persons;
CREATE FUNCTION fnc_persons(pgender varchar default 'female') RETURNS SETOF text AS $$
SELECT name
FROM person
WHERE gender IN (format('%s', pgender));
$$ LANGUAGE SQL;
select *
from fnc_persons('male');
select *
from fnc_persons();