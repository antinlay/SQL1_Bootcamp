select name
from person
join person_order on person_order.person_id = person.id
join menu on menu.id = person_order.menu_id
where
	gender = 'male'
	and address in ('Moscow','Samara')
	and pizza_name in ('mushroom pizza','pepperoni pizza')
order by 1 desc