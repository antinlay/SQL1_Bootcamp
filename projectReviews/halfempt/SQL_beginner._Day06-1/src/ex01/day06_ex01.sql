INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER()     OVER ( ) AS id, po.person_id AS person_id,
       m.pizzeria_id AS pizzeria_id,
       CASE
           WHEN count(m.pizzeria_id) = 1 THEN 10.5
           WHEN count(m.pizzeria_id) = 2 THEN 22
           ELSE 30
           END
                     AS discount
FROM person_order po
         INNER JOIN menu m ON m.id = po.menu_id
GROUP BY person_id, pizzeria_id
ORDER BY person_id, pizzeria_id;
