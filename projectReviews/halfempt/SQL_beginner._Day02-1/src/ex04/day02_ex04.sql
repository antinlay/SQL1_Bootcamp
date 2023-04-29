WITH info AS (
    SELECT pizza_name, price,
        (SELECT pizzeria.name FROM pizzeria WHERE id = menu.pizzeria_id ) AS pizzeria_name
    FROM menu
    WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
)
SELECT pizza_name, pizzeria_name, price FROM info
ORDER BY pizza_name, pizzeria_name;


-- сначала берем имя из таблицы pizzeria где id равен id пицерии
-- условие звучит так что берем только машрумс и пеперони
