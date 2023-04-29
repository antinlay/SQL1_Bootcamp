CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(IN pperson VARCHAR DEFAULT 'Dmitriy', IN pprice NUMERIC DEFAULT 500, IN pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (
	pizzeria_name VARCHAR
			  )
	LANGUAGE plpgsql
	    AS $$
declare pizzeria_name VARCHAR;
    BEGIN
RETURN QUERY (WITH orderr AS (SELECT DISTINCT piz.name
				FROM (SELECT * FROM person WHERE name = pperson) p
						 JOIN (SELECT * FROM person_order WHERE order_date = pdate) po ON po.person_id = p.id
						 JOIN (SELECT * FROM menu WHERE price < pprice) m ON m.id = po.menu_id
						 JOIN pizzeria piz ON piz.id = m.pizzeria_id),
	 visit AS  (SELECT DISTINCT piz.name
				FROM (SELECT * FROM person WHERE name = pperson) p
						 JOIN (SELECT * FROM person_visits WHERE visit_date = pdate) po ON po.person_id = p.id
						 JOIN (SELECT * FROM menu WHERE price < pprice) m ON m.pizzeria_id = po.pizzeria_id
						 JOIN pizzeria piz ON m.pizzeria_id = piz.id)
SELECT orderr.name
FROM orderr
		 INNER JOIN visit on orderr.name = visit.name);
		 end;
$$;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');


drop function if EXISTS fnc_person_visits_and_eats_on_date(varchar, numeric, date);





