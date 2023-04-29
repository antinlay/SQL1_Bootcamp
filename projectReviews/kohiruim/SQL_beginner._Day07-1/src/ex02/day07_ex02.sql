(select pizzeria.name, count(person_visits.person_id), 'visit' AS action_type
from pizzeria
inner join person_visits on person_visits.pizzeria_id = pizzeria.id
group by pizzeria.name
order by 3, 2 DESC limit 3)
union
(select pizzeria.name, count(person_order.person_id), 'order' AS action_type
from pizzeria
inner join menu on pizzeria.id = menu.pizzeria_id
inner join person_order on menu.id = person_order.menu_id
group by pizzeria.name
order by 3, 2 DESC limit 3)
order by 3, 2 DESC
