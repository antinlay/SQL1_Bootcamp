SELECT name, rating
FROM pizzeria
         LEFT JOIN person_visits
                   ON person_visits.pizzeria_id = pizzeria.id
WHERE person_visits.pizzeria_id IS NULL
ORDER BY rating DESC;
-- Команда LEFT JOIN используются для связывания таблиц по определенным полям связи.