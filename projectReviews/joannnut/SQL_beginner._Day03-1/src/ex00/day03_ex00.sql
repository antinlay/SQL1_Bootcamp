select m.pizza_name, m.price, p.name as pizzeria_name, pv.visit_date
from menu m join pizzeria p on p.id = m.pizzeria_id
join person_visits pv on p.id = pv.pizzeria_id
join person p2 on pv.person_id = p2.id
where p2.name = 'Kate' and m.price between 800 and 1000
order by 1, 2, 3;