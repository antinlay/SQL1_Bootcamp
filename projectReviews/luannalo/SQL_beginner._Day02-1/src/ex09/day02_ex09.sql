select cp.name
from (select name
		from person
		join person_order on person.id = person_order.person_id
		join menu on menu.id = person_order.menu_id
		where
			gender = 'female'
			and pizza_name = 'cheese pizza') as cp
join
(select name
	from person
	join person_order on person_order.person_id = person.id
	join menu on menu.id = person_order.menu_id
	where
		gender = 'female'
		and pizza_name = 'pepperoni pizza') as pp
on cp.name = pp.name
order by 1