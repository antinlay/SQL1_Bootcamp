select pizza_name, price, p.name as pizzeria_name
from menu
inner join pizzeria p on p.id = menu.pizzeria_id
left join  person_order po on menu.id = po.menu_id
where po.menu_id is null
order by 1, 2
