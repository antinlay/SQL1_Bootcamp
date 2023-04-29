SELECT p.name                                                         AS name,
       m.pizza_name                                                   AS pizza_name,
       m.price                                                        AS price,
       (price * (100 - (SELECT pd.discount
                        FROM person_discounts pd
                        WHERE pd.person_id = po.person_id
                          AND pd.pizzeria_id = m.pizzeria_id)) / 100) AS discount_price,
       pz.name                                                        AS pizzeria_name
FROM person_order po
         INNER JOIN person p ON po.person_id = p.id
         INNER JOIN menu m ON po.menu_id = m.id
         INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY name, pizza_name;
