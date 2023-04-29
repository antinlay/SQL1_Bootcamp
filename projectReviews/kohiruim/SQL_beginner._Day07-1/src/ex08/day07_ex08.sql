select person.address as address, 
		pizzeria.name, 
		count(person_order.person_id) as count_of_orders
from person
inner join person_order on person_order.person_id = person.id
inner join menu on menu.id = person_order.menu_id
inner join pizzeria on pizzeria.id = menu.pizzeria_id
group by address, pizzeria.name
order by 1, 2;
