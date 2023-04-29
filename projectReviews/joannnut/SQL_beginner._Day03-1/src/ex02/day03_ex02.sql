select m.pizza_name, m.price, p.name as pizzeria_name
from menu as m join pizzeria p on p.id = m.pizzeria_id
left join person_order po on m.id = po.menu_id
where po.order_date is null
order by 1;
