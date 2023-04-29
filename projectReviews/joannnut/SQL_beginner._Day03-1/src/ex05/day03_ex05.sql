select distinct p.name
from pizzeria p join person_visits pv on p.id = pv.pizzeria_id
    join person_order po on pv.person_id = po.person_id
    join person p2 on pv.person_id = p2.id
where p2.name = 'Andrey' and pv.visit_date <> po.order_date
order by p.name;