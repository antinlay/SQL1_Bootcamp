select pizza_name, price, p.name as pizzeria_name, visit_date
from menu
inner join pizzeria p on p.id = menu.pizzeria_id
inner join person_visits pv on p.id = pv.pizzeria_id
inner join person_order po on pv.person_id = po.person_id
inner join person p2 on p2.id = po.person_id
where (price between 800 and 1000) and  (p2.name = 'Kate')
order by 1, 2, 3