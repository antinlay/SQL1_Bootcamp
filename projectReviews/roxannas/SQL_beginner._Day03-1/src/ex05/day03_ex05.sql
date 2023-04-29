-- Создание временной таблицы с ID пиццерий, которые были посещены человеком по имени 'Andrey',
-- используя JOIN между таблицами person_visits и person
WITH p_name AS (
SELECT pizzeria_id FROM person_visits pv
JOIN person p ON p.id = pv.person_id
WHERE name = 'Andrey'
EXCEPT -- Исключение из выборки ID пиццерий, которые посетил 'Andrey' и в которых он сделал заказ
SELECT pizzeria_id FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE name = 'Andrey')
-- Выбор имен пиццерий из таблицы pizzeria, используя JOIN с временной таблицей p_name,
-- которая содержит ID пиццерий, посещенных 'Andrey', но в которых он не сделал заказ
SELECT name AS pizzeria_name FROM pizzeria
JOIN p_name ON pizzeria.id = pizzeria_id
ORDER BY pizzeria_name 