select pizzeria.name
from person_visits
join pizzeria on person_visits.pizzeria_id = pizzeria.id
join menu on pizzeria.id = menu.pizzeria_id
where 
	person_visits.person_id = (select id from person where name = 'Dmitriy') 
	and person_visits.visit_date = '2022-01-08' 
	and menu.price < 800
order by 1