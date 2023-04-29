DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date;
CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy',
    pprice numeric default 500,
    pdate date default '2022-01-08'
) RETURNS TABLE (name varchar) LANGUAGE PLPGSQL AS $$ BEGIN RETURN QUERY
SELECT p.name
FROM person_visits pv
    JOIN person_order po ON po.person_id = pv.person_id
    AND po.order_date = pv.visit_date
    JOIN menu m ON m.id = po.menu_id
    JOIN person pn ON pn.id = po.person_id
    JOIN pizzeria p ON pv.pizzeria_id = p.id
WHERE m.price < pprice
    AND pn.name = pperson
    AND pv.visit_date = pdate
ORDER BY 1;
END;
$$;
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );