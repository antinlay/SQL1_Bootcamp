SELECT name FROM pizzeria
WHERE NOT EXISTS(SELECT *
        FROM person_visits
        WHERE pizzeria.id IN (person_visits.pizzeria_id)
        );
