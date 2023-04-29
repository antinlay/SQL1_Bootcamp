select menu.id as menu_id
from menu
left join  person_order po on menu.id = po.menu_id
where po.menu_id is null
order by 1