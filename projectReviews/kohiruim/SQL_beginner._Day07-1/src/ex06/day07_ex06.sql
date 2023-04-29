select pizzeria.name, count(menu.pizza_name) as count_of_orders, 
		round(avg(price), 2) as average_price, 
		max(menu.price) as max_price, min(menu.price) as min_price
from person_order
inner join menu on menu.id = person_order.menu_id
inner join pizzeria on pizzeria.id = menu.pizzeria_id
group by 1
order by 1;
