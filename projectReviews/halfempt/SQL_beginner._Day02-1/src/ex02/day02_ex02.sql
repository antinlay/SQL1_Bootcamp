SELECT COALESCE(p.name, '-') AS person_name, visit_date, COALESCE(pv.name, '-') AS pizzeria_name
-- ключевое слово coalesce помогает вывести для пустых ячеек в двух таблицах person_name и pizzeria_name '-'
FROM person p
FULL JOIN
    (SELECT * FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pv
    FULL JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id) AS pv ON p.id = pv.person_id
ORDER BY person_name, visit_date, pizzeria_name;

-- FULL JOIN будет возвращать все записи из table1 и table2.
-- взяли полностью таблицу от 01 до 03

-- FULL JOIN объединяет таблицы с целью найти результаты, которые соответствуют левой и правой таблице,
-- несмотря на то, находится ли соответствующая запись в другой таблице. В данном случае используется FULL JOIN,
-- чтобы соединить таблицы person и person_visits и выбрать имена и даты посещения.

-- второй JOIN соединяет таблицу person_visits с таблицей pizzeria для выборки названий пиццерии.
-- также используется выражение WHERE которое исключает visit_date BETWEEN '2022-01-01' AND '2022-01-03'

