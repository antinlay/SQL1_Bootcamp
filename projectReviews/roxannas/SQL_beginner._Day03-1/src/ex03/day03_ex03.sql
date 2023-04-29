-- Выбрать названия пиццерий, в которых побывали только женщины или только мужчины
SELECT name FROM pizzeria
-- Выбрать id пиццерий, в которых побывали только женщины
WHERE id IN (SELECT pizzeria_id FROM person_visits
WHERE person_id IN (
-- Выбрать id женщин
SELECT id FROM person
WHERE gender = 'female'
)
-- Исключить пиццерии, в которых побывали мужчины
EXCEPT ALL
SELECT pizzeria_id FROM person_visits
WHERE person_id IN (
-- Выбрать id мужчин
SELECT id FROM person
WHERE gender = 'male'
))
-- Объединить со списком пиццерий, в которых побывали только мужчины
UNION
SELECT name FROM pizzeria
-- Выбрать id пиццерий, в которых побывали только мужчины
WHERE id IN (
SELECT pizzeria_id FROM person_visits
WHERE person_id IN (
-- Выбрать id мужчин
SELECT id FROM person
WHERE gender = 'male'
)
-- Исключить пиццерии, в которых побывали женщины
EXCEPT ALL
SELECT pizzeria_id FROM person_visits
WHERE person_id IN (
-- Выбрать id женщин
SELECT id FROM person
WHERE gender = 'female'
))
-- Отсортировать результат по названию пиццерий
ORDER BY name;