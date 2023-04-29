-- Создаем функцию fnc_person_visits_and_eats_on_date с тремя входными параметрами по умолчанию
-- и одним возвращаемым параметром типа varchar
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
        IN pperson VARCHAR DEFAULT 'Dmitriy',
        IN pprice NUMERIC DEFAULT 500,
        IN pdate date DEFAULT '2022-01-08'
    ) RETURNS TABLE(pizzeria_name varchar) AS $$ BEGIN -- Возвращаем уникальные названия пиццерий, в которых позавтракал заданный человек на заданную дату,
    -- потратив на это не более указанной суммы
    RETURN QUERY
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_order -- таблица с заказами
    LEFT JOIN menu ON menu.id = person_order.menu_id -- таблица меню, соответствующая заказу
    INNER JOIN person_visits ON person_visits.person_id = person_order.person_id
    AND -- таблица посещений пиццерий 
    person_visits.pizzeria_id = menu.pizzeria_id
    AND -- соответствующих конкретному заказу
    person_visits.visit_date = person_order.order_date -- в указанный день
    LEFT JOIN person ON person.id = person_visits.person_id -- таблица людей, посещающих пиццерии
    LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id -- таблица пиццерий
WHERE person.name = pperson
    AND menu.price <= pprice
    AND order_date = pdate;
-- выборка определенного человека, даты заказа и цены
END;
$$ LANGUAGE plpgsql;
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );