WITH
    cte_orders as (
        SELECT name, COUNT(*) as count, 'order' as action_type
        FROM person_order
        INNER JOIN menu on menu.id = person_order.menu_id
        INNER JOIN pizzeria on menu.pizzeria_id = pizzeria.id
        GROUP BY name
        ORDER BY count desc
    ),
    cte_visits as (
        SELECT name, COUNT(*) as count, 'visit' as action_type
        FROM person_visits
        INNER JOIN pizzeria on pizzeria.id = person_visits.pizzeria_id
        GROUP BY name
        ORDER BY count desc
    )  

SELECT pizzeria.name,
       COALESCE(cte_visits.count, 0) + COALESCE(cte_orders.count, 0) as total_count
FROM pizzeria
FULL JOIN cte_orders on cte_orders.name = pizzeria.name
FULL JOIN cte_visits on cte_visits.name = pizzeria.name
ORDER BY total_count desc, name;